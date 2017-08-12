# https://gitlab.com/lsilvest/ztsdb/commit/e9e7aa3010eae3aceb7f441f0d85e983da2b4132
# The above line is generated automatically, do not modify!

FROM ubuntu:16.04

MAINTAINER Leonardo Silvestri (lsilvestri@ztsdb.org)

RUN apt-get update && \
    apt-get install -y make cmake libboost-filesystem-dev flex bison gcc g++ git \
                       gengetopt bzip2 libdouble-conversion-dev curl \
                       software-properties-common python-software-properties tzdata && \
    add-apt-repository ppa:edd/misc && apt-get update && apt-get install -y crpcut crpcut-dev && \
    git clone https://lsilvest@gitlab.com/lsilvest/ztsdb.git && \
    cd ztsdb && mkdir build && cd build && cmake .. && make -j4 && ctest && make rtest && make install && \
    cp itests/append/append /usr/local/bin/append && \
    make clean && \
    apt-get remove -y libboost-filesystem-dev flex bison gcc g++ git \
                      gengetopt bzip2 libdouble-conversion-dev \
                      software-properties-common python-software-properties cmake make && \
    curl -OLs https://eddelbuettel.github.io/r-travis/run.sh && chmod 0755 run.sh && \
    ./run.sh bootstrap && \
    ./run.sh install_aptget r-cran-rcppcctz r-cran-bit64 r-cran-zoo r-cran-data.table r-cran-runit
    