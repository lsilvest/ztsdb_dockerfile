![alt text](http://www.ztsdb.org/images/logo.png "ztsdb logo")

[ztsdb](https://hub.docker.com/r/lsilvest/ztsdb/) is a fast, small and lightweight multi-user noSQL column-store database management system designed and optimized for the update, storage and handling of time-series data. Its query and manipulation language is based on the [R programming language](https://www.r-project.org/) and allows complex selections of data inside a time-series or across multiple time-series. It is licensed under GPLv3.

## Using the image

### Running a container

Run a container with bash:

    docker run -it lsilvest/ztsdb bash

### Starting ztsdb

In this shell, start an instance of ztsdb:

    ztsdb

You can use the quit command to terminate the ztsdb instance at any time:

    q()

To test multiple instances of ztsdb, start one or more backgroud ztsdb
instances before running a client instance in the foreground; be sure
to specify a listen port for the background instances so they can be
queried:

    nohup ztsdb -p 19300 &
    ztsdb

To access this instance from outside the container, publish the port when running the container:

    docker run -it -p 19300:19300 lsilvest/ztsdb bash

## Further info

To get a quick overview of ztsdb with some specific examples, see ztsdb's [homepage](http://www.ztsdb.org).

For more details about starting a ztsdb instance, see the [Running ztsdb](http://www.ztsdb.org/docs/run.html) section.

For more details on using ztsdb, see the [Reference](http://www.ztsdb.org/docs/reference.html) section.
