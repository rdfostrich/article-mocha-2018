## Evaluation
{:#evaluation}

In this section, we introduce the results of running the SPBv benchmark on Comunica and OSTRICH.

As the MOCHA challenge requires running a system within the Docker-based HOBBIT platform,
we provide [a system adapter with a Docker container](https://github.com/rdfostrich/challenge-mocha-2018){:.mandatory}
for our engine that is based on Comunica and OSTRICH.
Using this adapter, we ran the SPBv benchmark on our system on the HOBBIT platform with the parameters from [](#benchmark-params).

<figure id="benchmark-params" class="table" markdown="1">

| Parameter                   | Value      |
|-----------------------------|------------|
| **Seed**                    | 100        |
| **Data form**               | Changesets |
| **Triples in version 1**    | 100,000    |
| **Versions**                | 5          |
| **Version deletion ratio**  | 10%        |
| **Version addition ratio**  | 15%        |

<figcaption markdown="block">
Configuration of the SPBv benchmark for our experiment.
</figcaption>
</figure>

For the used configuration, our system is able to ingest 29,719 triples per second for the initial version,
and 5,858 per second for the following changesets.
The complete dataset requires 17MB to be stored using our system.
The initial version ingestion is significantly faster because the initial version is stored directly as a HDT snapshot.
For each following changeset, OSTRICH requires more processing time as it calculates and stores additional metadata
and converts the changeset to one that is relative to the initial version instead of the preceding version.

For the 99 queries that were evaluated, our system failed for 27 of them according to the benchmark.
The majority of failures is caused by incomplete SPARQL expression support in Comunica, which is not on par with SPARQL 1.1 at the time of writing.
The other failures (in task 5.1) are caused by an error in the benchmark where changes in literal datatypes are not being detected.
We are in contact with the benchmark developer to resolve this.

For the successful queries, our system achieves fast query evaluation times for all query types, as shown in [](#benchmark-results).
In summary, the query of type 1 (queries starting with a 1-prefix) completely materializes the latest version,
type 2 queries within the latest version,
type 3 retrieves a full past version,
type 4 queries within a past version,
type 5 queries the differences between two versions,
and type 8 queries over two different versions.
Additional details on the query types can be found in the [SPBv](cite:cites spbv) article.

<figure id="benchmark-results" class="table" markdown="1">

<center>
<div markdown="1" style="width:12em;display:inline-block">

| Query | Time    | Results  |
|-------|--------:|---------:|
| 1.1   | 34,071  | 141,782  |
| 2.1   |     49  |     128  |
| 2.2   |     59  |      32  |
| 2.3   |     27  |      12  |
| 2.5   |    233  |     969  |
| 2.6   |  1,018  |      19  |
| 3.1   | 18,591  | 100,006  |
| 2.6   |    230  |      46  |
| 4.1   |     37  |      91  |
| 4.2   |     43  |      16  |
| 4.3   |     21  |       2  |

</div>

<div markdown="1" style="width:12em;display:inline-block;margin-left:5em">

| Query | Time    | Results |
|-------|--------:|--------:|
| 4.5   |    197  |    708  |
| 4.6   |  1,119  |     25  |
| 5.1   | 13,871  | 59,229  |
| 8.1   |     59  |    171  |
| 8.2   |     56  |     52  |
| 8.3   |     31  |     22  |
| 8.4   |     44  |      0  |
| 8.5   |    709  |  2,288  |
| 8.6   |  8,258  |    346  |
|       |         |         |
|       |         |         |

</div>
</center>

<figcaption markdown="block">
Evaluation times in milliseconds and the number of results for all SPBv queries that were evaluated successfully.
</figcaption>
</figure>

