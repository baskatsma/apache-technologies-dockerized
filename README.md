# Apache Spark + Solr + Livy backbone

A Docker network of **[Apache Spark](https://spark.apache.org)**, **[Apache Solr](https://lucene.apache.org/solr/)**, and **[Apache Livy](https://livy.apache.org)**.

| Technology | Version |
| ------ | ------ |
| Apache Spark | 2.4.0* |
| Apache Solr | 8.7 (latest) |
| Apache Livy | 0.7.0-incubating (latest) |

*This specific -- outdated -- version has to be used due to Apache Livy requiring Scala 2.11.x and Apache Spark 2.4.1+ uses Scala 2.12.x.

## Configuration

- Running the default build will create:
    - An **Apache Spark standalone cluster** with **1** master node and **1** worker node. Worker node settings can be modified in `spark/env/spark-worker.sh`.
    - A single Apache Solr server
    - A single Apache Livy server
- ...

## Installation
**Apache Spark** and **Apache Livy** use our own custom defined **Dockerfiles** to create complete images. **Apache Solr** has an official Docker image (yay).

Run the following code to build all the required Docker images:
```sh
$ make build
```

Internally, this is equal to:
```sh
docker build -t core ./core
docker build -t spark-core ./spark/spark-core
docker build -t spark-master ./spark/spark-master
docker build -t spark-worker ./spark/spark-worker
docker build -t livy ./livy
```

Then, run the following code to run our application:
```sh
$ make run
```

Internally, this is a `docker-compose` statement:
```sh
$ docker-compose -f docker-compose.yml up -d --force-recreate
```

Altogether, the following single `make` statement will build and start the images:
```sh
$ make
```

You're done already! Have fun with it.

## References

#### Apache Spark
* https://github.com/sdesilva26/docker-spark
* https://medium.com/@marcovillarreal_40011/creating-a-spark-standalone-cluster-with-docker-and-docker-compose-ba9d743a157f
* https://www.kdnuggets.com/2020/07/apache-spark-cluster-docker.html
* https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2
#### Apache Solr
* https://github.com/docker-solr/docker-solr
#### Apache Livy
* https://github.com/tobilg/docker-livy/blob/master/Dockerfile
* https://github.com/cloudiator/livy-server-docker
* https://dassum.medium.com/apache-livy-a-rest-interface-for-apache-spark-f435540e26a9
