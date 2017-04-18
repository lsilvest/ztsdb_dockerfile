![alt text](http://www.ztsdb.org/images/logo.png "ztsdb logo")

[ztsdb](https://hub.docker.com/r/lsilvest/ztsdb/) is a fast, small and
lightweight multi-user noSQL column-store database management system
designed and optimized for the update, storage and handling of
time-series data. Its query and manipulation language is based on the
[R programming language](https://www.r-project.org/) and allows
complex selections of data inside a time-series or across multiple
time-series. It is licensed under GPLv3.

## Using the image

### Running a container

Run a container with bash:

    docker run -it lsilvest/ztsdb bash

### Starting ztsdb

In this shell, start an instance of ztsdb:

    ztsdb

You can use the quit command to terminate the ztsdb instance at any
time:

    q()

### Running multiple instances

One can start multiple containers to test multiple instances or to
simulate real-time append to time-series. To access an instance from
outside the container, publish the listen port when running the
container:

    docker run -it -p 19300:19300 lsilvest/ztsdb bash

Make note of the IP address of the container; Here is one way of
getting it:

    ip addr show

In this example, we will assume the container's IP address
is 172.17.0.2.

In this shell, start a ztsdb instance listening on the published port:

    ztsdb -p 19300

#### Connecting from another ztsdb instance

Other ztsdb instances can be started in the same way as above. Once
the ztsdb has been started, a connection can be established as usual
from the ztsdb command line:

    c1 <- connection("172.17.0.2", 19300)

#### Append utility

The _append_ utility generates append messages for a time-series at a
specified frequency:

    usage: append <ip> <port> <rate> <varname[,name1,name2,...]> <ncols> [max-msgs]

To use it, a time-series must first be created on the ztsdb server
instance:

    data  <-  matrix(0, 0, 3, dimnames=list(NULL, c("a","b","c")))
    idx   <-  as.time(NULL)
    a     <<- zts(idx, data)

Then _append_ can be started from another container like this (IP
address=172.17.0.2, port=19300, rate=100000 msg/second, time-series'
name=a, number of columns=3, continue sending indefinitely):

    append 172.17.0.2 19300 100000 a 3

More information on the _append_ utility can be found
[here](https://gitlab.com/lsilvest/ztsdb/blob/master/itests/append/README.md).

## Further info

- To get a quick overview of ztsdb with some specific examples, see
  ztsdb's [homepage](http://www.ztsdb.org).

- For more details about starting and running a ztsdb instance, see
  the [Running ztsdb](http://www.ztsdb.org/docs/run.html) section.

- For more in-depth information on ztsdb, see the
  [Reference](http://www.ztsdb.org/docs/reference.html) section.

- The ztsdb project is hosted on
  [Gitlab](https://gitlab.com/lsilvest/ztsdb)

- The R interface package for ztsdb is also hosted on
  [Gitlab](https://gitlab.com/lsilvest/rztsdb)

- [The Docker image](https://hub.docker.com/r/lsilvest/ztsdb/)

