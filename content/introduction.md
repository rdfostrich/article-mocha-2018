## Introduction
{:#introduction}

The [Semantic Web](cite:cites semanticweb) of [Linked Data](cite:cites linkeddata) is continuously [growing and changing over time](cite:cites datasetdynamics).
While in some cases only the latest version of datasets are required, there is a growing need for access to prior dataset versions for data analysis.
For example, analyzing the evolution of taxonomies, or tracking the evolution of diseases in biomedical datasets.

Several approaches have already been proposed to store and query _versioned_ Linked Datasets.
However, [surveys](cite:cites archiving,papakonstantinou2016versioning) have shown that there is a need for improved versioning capabilities in the current systems.
Existing solutions either perform well for versioned query evaluation, or require less storage space, but not both.
Furthermore, no existing solution performs well for all versioned query types, namely querying *at*, *between*, and *for* different versions.

In recent work, we introduced a [compressed RDF archive indexing technique](cite:cites ostrich)—implemented under the name of _OSTRICH_—
that enables highly efficient triple pattern-based versioned querying capabilities.
It offers a new trade-off compared to other approaches,
as it calculates and stores additional information at ingestion time in order to reduce query evaluation time.
This additional information includes pointers to relevant positions to improve the efficiency of result offsets.
Furthermore, it supports efficient result cardinality estimation, streaming results and offset support to enable efficient usage within query engines.

The [Mighty Storage Challenge (MOCHA)](https://project-hobbit.eu/challenges/mighty-storage-challenge2018/){:.mandatory}
is a yearly challenge that aims to measure and detect bottlenecks in RDF triple stores.
One of the tasks in this challenge concerns the storage and querying of versioned datasets.
This task uses the [SPBv](cite:cites spbv) benchmark that consists of a dataset and SPARQL query workload generator for different versioned query types.
All MOCHA tasks are to be evaluated on the [HOBBIT benchmarking platform](https://project-hobbit.eu/){:.mandatory}.
SPBv evaluates [SPARQL queries](cite:cites spec:sparqllang), hence we combine OSTRICH, a versioned triple index with triple pattern interface, with
[Comunica](cite:cites comunica), a modular SPARQL engine platform.

The remainder of this paper is structured as follows.
First, the next section briefly introduces the OSTRICH store and the Comunica SPARQL engine.
After that, we present our preliminary results in [](#evaluation).
Finally, we conclude and discuss future work in [](#conclusions).
