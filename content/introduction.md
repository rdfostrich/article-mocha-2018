## Introduction
{:#introduction}

The [Semantic Web](cite:cites semanticweb) of [Linked Data](cite:cites linkeddata) is continuously [growing and changing over time](cite:cites datasetdynamics).
While in some cases only the latest version of datasets are required, there is a growing need for access to prior dataset versions in the domain of data analysis.

Several approaches have already been proposed to store and query _versioned_ Linked Datasets.
However, [a survey](cite:cites archiving) has shown that there is a need for improved versioning capabilities in existing systems.
Existing solutions either perform well for versioned query evaluation or require less storage space.
Furthermore, no existing solution performs well for all versioned query types, namely querying *at*, *between*, and *for* different versions.

In recent work, we introduced a [compressed RDF archive indexing technique](cite:cites ostrich)—implemented under the name of _OSTRICH_—
that offers highly efficient triple pattern-based versioned querying capabilities.
It offers a new trade-off compared to other approaches, as it calculates and stores additional metadata at ingestion time in order to reduce query evaluation time.
Furthermore, it offers efficient cardinality estimation, streaming results and offset support to enable efficient usage withing query engines.

The [Mighty Storage Challenge (MOCHA 2018)](https://project-hobbit.eu/challenges/mighty-storage-challenge2018/){:.mandatory}
is a yearly challenge that aims to measure and detect bottlenecks in RDF triple stores.
One of the tasks in this challenge concerns the storage and querying of versioned datasets.
This task uses the [SPBv](cite:cites spbv) benchmark that consists of a dataset and a SPARQL query workload generator for different versioned query types.
All MOCHA tasks are to be evaluated on the [HOBBIT benchmarking platform](https://project-hobbit.eu/){:.mandatory}.
As SPBv evaluates using [SPARQL queries](cite:cites spec:sparqllang), and OSTRICH is a versioned triple index with triple pattern query support,
we use the highly modular Comunica SPARQL engine to perform versioned SPARQL queries over an OSTRICH store.

This article is structured as follows.
In the next section, we give a brief overview of the OSTRICH store and the Comunica SPARQL engine.
After that, we present our preliminary results in [](#evaluation).
Finally, we conclude and discuss future work in [](#conclusions).
