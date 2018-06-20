## Versioned Query Engine
{:#versioned-query-engine}

In this section we introduce the versioned query engine that consists of the OSTRICH store and the Comunica framework.
We discuss these two parts separately in the following sections.

### OSTRICH

OSTRICH is the implementation of a [compressed RDF archive indexing technique](cite:cites ostrich) that offers efficient
triple pattern queries *in*, *between*, and *over* different versions.
In order to achieve efficient querying for these different query types,
OSTRICH uses a hybrid storage technique that is a combination of *individual copies*, *change-based* and *timestamp-based* storage.
The initial dataset version is stored as a fully materialized and immutable snapshot.
This snapshot is stored using [HDT](cite:cites hdt), which is a highly compressed, binary RDF representation.
All other versions are deltas, i.e., lists of triples that need to be removed and lists of triples that need to be added.
These deltas are relative to the initial version, but merged in a timestamp-based manner to reduce redundancies between each version.
In order to offer optimization opportunities to query engines that use this store,
OSTRICH offers efficient cardinality estimation, streaming results and efficient offset support.

### Comunica

[Comunica](cite:cites comunica) is a highly modular Web-based SPARQL query engine platform.
Its modularity enables federated querying over heterogeneous interfaces, such as [SPARQL endpoints](cite:cites spec:sparqlprot),
[Triple Pattern Fragments (TPF) entrypoints](cite:cites ldf) and plain RDF files.
New types of interfaces and datasources can be supported by implementing an additional software component
and plugging it into a publish-subscribe-based system through an external semantic configuration file.

In order to support _versioned_ SPARQL querying over an OSTRICH backend,
we [implemented](https://github.com/rdfostrich/comunica-actor-rdf-resolve-quad-pattern-ostrich){:.mandatory}
a module for resolving triple patterns with a versioning context against an OSTRICH dataset.
Furthermore, as versions within the SPBv benchmark are represented as *named graphs*,
we rewrite these queries in a [separate module](https://github.com/rdfostrich/comunica-actor-query-operation-contextify-version){:.mandatory}
to OSTRICH-compatible queries *in*, *between*, or *over* different versions as a pre-processing step.
Finally, we provide a [default Comunica configuration and script](https://github.com/rdfostrich/comunica-actor-init-sparql-ostrich){:.mandatory}
to use these modules
together with the existing Comunica modules as a SPARQL engine.
These three modules will be explained in more detail hereafter.

#### OSTRICH Module

OSTRICH enables versioned triple pattern queries *at*, *between*, and *for* different versions.
These query types are respectively known as _Version Materialization (VM)_, _Delta Materialization (DM)_ and _Version Querying (VQ)_.
In the context the SPBv benchmark, only the first two query types (VM and DM) are evaluated,
which is why only support for these two are implemented in the OSTRICH module at the time of writing.

The OSTRICH Comunica module consists of an actor that enables VM and DM triple pattern queries against a given OSTRICH store,
and is registered to Comunica's `rdf-resolve-quad-pattern` bus.
This actor will receive messages consisting of a triple pattern and a context.
This actor expects the context to either contain VM or DM information, and a reference to an OSTRICH store.
For VM queries, a version identifier must be provided in the context.
For DM queries, a start and end version identifier is expected.

The `rdf-resolve-quad-pattern` bus expects two types of output:

1. A stream with matching triples.
2. An estimated count of the number of matching triples.

As OSTRICH enables streaming triple pattern query results and corresponding cardinality estimation for all query types,
these two outputs can be trivially provided using the [JavaScript bindings for OSTRICH](https://github.com/rdfostrich/ostrich-node){:.mandatory}.

#### Versioned Query Rewriter Module

The SPBv benchmark represents versions as *named graphs*.
[](#spbv-vm) and [](#spbv-dm) respectively show examples of VM and DM queries in this representation.
Our second module is responsible for rewriting such named-graph-based queries into context-based queries that the OSTRICH module can accept.

<figure id="spbv-vm" class="listing">
````/code/vm.txt````
<figcaption markdown="block">
Version Materialization query for the `?s ?p ?o` pattern in version `http://graph.version.4` in SPV's named graph representation.
</figcaption>
</figure>

<figure id="spbv-dm" class="listing">
````/code/dm.txt````
<figcaption markdown="block">
Delta Materialization query for the `?s ?p ?o` pattern to get all additions between version
`http://graph.version.1` and `http://graph.version.4` in SPV's named graph representation.
</figcaption>
</figure>

In order to transform VM named-graph-based queries,
we detect `GRAPH` clauses, and consider them to be identifiers for the VM version.
Our rewriter unwraps the pattern(s) inside this `GRAPH` clause,
and attaches a VM version context with the detected version identifier.

For transforming DM named-graph-based queries,
`GRAPH` clauses with corresponding `FILTER`-`NOT EXISTS`-`GRAPH` clauses for the same pattern in the same scope are detected.
The rewriter unwraps the equal pattern(s),
and constructs a DM version context with a starting and ending version identifier.
The starting version is always the _smallest_ of the two graph URIs,
and the ending version is the _largest_, assuming lexicographical sorting.
If the graph URI from the first pattern is _larger_ than the second graph URI, then the DM queries only additions.
In the other case, only deletions will be queried.

#### SPARQL Engine

The Comunica platform allows SPARQL engines to be created based on a semantic configuration file.
By default, Comunica has a large collection of modules to create a default SPARQL engine.
For this work, we adapted the default configuration file where we added our OSTRICH and rewriter modules.
This allows complete versioned SPARQL querying, instead of only versioned triple pattern querying, as supported by OSTRICH.
This engine is available on the [npm package manager](https://www.npmjs.com/package/@comunica/actor-init-sparql-ostrich){:.mandatory} for direct usage.
