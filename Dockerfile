# https://gitlab.com/lsilvest/ztsdb/commit/7fd1b04fc6458e65cc76c96c2d017396cf7f6974
# The above line is generated automatically, do not modify!

FROM ubuntu:18.04

MAINTAINER Leonardo Silvestri (lsilvestri@ztsdb.org)

RUN apt update
RUN apt install -y make cmake libboost-filesystem-dev flex bison \
                   gcc g++ git gengetopt bzip2 libdouble-conversion-dev curl sudo apt-transport-https \
                   software-properties-common curl lsb-core sudo
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata                   
RUN curl -OLs https://eddelbuettel.github.io/r-travis/run.sh && chmod 0755 run.sh
RUN ./run.sh bootstrap
RUN ./run.sh install_aptget r-cran-data.table r-cran-rcpp r-cran-bit64 r-cran-zoo
RUN ./run.sh install_github eddelbuettel/RcppCCTZ eddelbuettel/RcppDate eddelbuettel/nanotime
RUN git clone https://lsilvest@gitlab.com/lsilvest/ztsdb.git && \
    cd ztsdb && mkdir build && cd build && cmake .. && make -j4 && make rtest && \
    make install && ldconfig
RUN cp /ztsdb/build/itests/append/append /usr/local/bin/append
RUN git clone https://lsilvest@gitlab.com/lsilvest/rztsdb.git && \
    R CMD build rztsdb && R CMD INSTALL rztsdb_*
RUN cd ztsdb/build && make clean
RUN apt remove -y libboost-filesystem-dev flex bison gcc g++ git \
                  gengetopt bzip2 libdouble-conversion-dev \
                  software-properties-common lsb-core curl cmake make
    