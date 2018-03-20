## Evaluation
{:#evaluation}

In this section, we introduce preliminary results of running the SPBv benchmark on Comunica and OSTRICH.

As the MOCHA challenge requires running a system within the Docker-based HOBBIT platform,
we provide [a system adapter with a Docker container](https://github.com/rdfostrich/challenge-mocha-2018){:.mandatory}
for our engine that is based on Comunica and OSTRICH.
Using this adapter, we ran the SPBv benchmark on our system on the HOBBIT platform with the parameters from [](#benchmark-params).

<figure id="benchmark-params" class="table" markdown="1">

| Parameter                   | Value      |
|-----------------------------|------------|
| **Seed**                    | 100        |
| **Data form**               | Changesets |
| **Initial version triples** | 50,000     |
| **Versions**                | 4          |
| **Version deletion ratio**  | 3%         |
| **Version addition ratio**  | 5%         |

<figcaption markdown="block">
Configuration of the SPBv benchmark for our experiment.
</figcaption>
</figure>

For the used configuration, our system is able to ingest 56,454 triples per second for the initial version,
and 8,753 per second for the following changesets.
The initial version ingestion is significantly faster because the initial version is stored directly as a HDT snapshot.
For each following changeset, OSTRICH requires more processing time as it calculates and stores additional metadata
and converts the changeset to one that is relative to the initial version instead of the preceding version.

For the 90 queries that were evaluated, our system failed for 69 of them according to the benchmark.
The majority of failures is caused by incomplete SPARQL expression support in Comunica, which is not fully compatible with SPARQL 1.1 at the time of writing.
The other failures are due to incorrect results being returned, which is caused by a bug in Comunica or OSTRICH.
We aim to improve these results by the time that the final MOCHA test dataset for task 3 is released.

For the remaining successful queries, our system achieves fast query evaluation times for all query types, as shown in [](#benchmark-results).
In summary, the queries of type 2 (queries starting with a 2-prefix) query within the latest version,
type 3 retrieves a full past version,
type 4 queries within a past version,
and type 8 queries over two different versions.
Additional details on the query types can be found in the [SPBv](cite:cites spbv) article.

<figure id="benchmark-results" class="table" markdown="1">

<center>
<div markdown="1" style="width:12em;display:inline-block">

| Query | Time   | Results |
|-------|-------:|--------:|
| 2.1   |    68  | 96      |
| 2.2   |    36  |  7      |
| 2.2   |    43  |  7      |
| 2.2   |    96  | 72      |
| 2.3   |    22  |  1      |
| 2.3   |    19  |  1      |
| 2.3   |    40  |  2      |
| 2.6   |   230  | 46      |
| 3.1   | 11431  | 98513   |
| 4.1   |   348  | 25      |
| 4.1   |    39  | 66      |

</div>

<div markdown="1" style="width:12em;display:inline-block;margin-left:5em">

| Query | Time    | Results |
|-------|--------:|--------:|
| 4.2   |    49   | 32      |
| 4.2   |    37   | 12      |
| 4.3   |    24   | 14      |
| 4.3   |    21   | 15      |
| 4.4   |    17   |  0      |
| 4.5   |    21   |  0      |
| 4.6   |    74   | 33      |
| 4.6   |   230   | 17      |
| 8.3   |    54   | 21      |
| 8.4   |    32   |  0      |
|       |         |         |

</div>
</center>

<figcaption markdown="block">
Evaluation times in milliseconds and the number of results for all SPBv queries that were evaluated successfully.
Duplicate query identifiers are shown as reported by SPBv, as its evaluation module does not report the full query identifier.
</figcaption>
</figure>

