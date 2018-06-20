## Conclusions
{:#conclusions}

This article represents an entry for the versioning task in the Mighty Storage Challenge 2018 as part of the ESWC 2018 Challenges Track.
Our work consists of a versioned query engine with the OSTRICH versioned triple store and the Comunica SPARQL engine platform.
Preliminary results show fast query evaluation times for the queries that are supported.
The list of unsupported queries is being used as a guideline for the further development of OSTRICH and Comunica.

During the usage of the SPBv benchmark,
we identified several KPIs that are explicitly supported by OSTRICH,
but were not being evaluated at the time of writing.
We list them here as a suggestion to the benchmark authors for future work:

* Measuring storage size after each version ingestion.
* Reporting of the ingestion time of each version separately, next of the current average.
* Evaluation of querying _all_ versions at the same time, and retrieving their applicable versions.
* Evaluation of stream-based query results and offsets, for example using a [diefficiency metric](cite:cites diefficiency).

In future work, we intend to evaluate our system using different configurations of the SPBv benchmark,
such as increasing the number of versions and increasing the change ratios.
Furthermore, we intend to compare our system with other similar engines,
both at triple index-level, and at SPARQL-level.
