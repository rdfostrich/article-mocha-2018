## Versioned Query Engine
{:#versioned-query-engine}

In this section we introduce the versioned query engine that consists of the OSTRICH store and the Comunica SPARQL engine.
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

[Comunica](https://github.com/comunica/comunica/){:.mandatory} is a highly modular Web-based SPARQL query engine platform.
It's modularity enables federated querying over heterogeneous interfaces, such as [SPARQL endpoints](cite:cites spec:sparqlprot),
[Triple Pattern Fragments (TPF) entrypoints](cite:cites ldf) and local or remote raw data dumps.
New types of interfaces and datasources can be supported by implementing an additional software component
and plugging it into a publish-subscribe-based system through an external configuration file.

In order to support versioned SPARQL querying over an OSTRICH backend,
we [implemented](https://github.com/comunica/comunica/tree/feature/ostrich){:.mandatory} a component for resolving triple patterns against an OSTRICH dataset.
Furthermore, as the versioned queries within the SPBv benchmark represent versions as *named graphs*,
we rewrite these queries in a separate component to OSTRICH-compatible queries *in*, *between*, or *over* different versions as a pre-processing step.
