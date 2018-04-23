FROM ubuntu:trusty

MAINTAINER Yassine Lassoued (y.lassoued@gmail.com)
LABEL Description="Simulation of Urban MObility(SUMO) + Python + PROJ + GDAL + OSGeo Spatial Index"

ENV SUMO_VERSION 0.31.0
ENV SUMO_HOME /opt/sumo
ENV SUMO_USER your_username

# Install system dependencies.

RUN apt-get update

RUN apt-get -qq install \
    wget \
    g++ \
    make \
    libxerces-c-dev \
	libproj-dev \
	libgdal-dev \
	libfox-1.6-0 libfox-1.6-dev \
    python2.7

RUN apt-get install -y python-pip python-dev build-essential curl

# Download and extract SUMO source code
RUN wget http://downloads.sourceforge.net/project/sumo/sumo/version%20$SUMO_VERSION/sumo-src-$SUMO_VERSION.tar.gz
RUN tar xzf sumo-src-$SUMO_VERSION.tar.gz && \
    mv sumo-$SUMO_VERSION $SUMO_HOME && \
    rm sumo-src-$SUMO_VERSION.tar.gz

# Configure and build from source
RUN cd $SUMO_HOME && ./configure && make install

RUN adduser $SUMO_USER --disabled-password

# Download and extract OSGeo Spatial Index
RUN wget http://download.osgeo.org/libspatialindex/spatialindex-src-1.8.5.tar.gz
RUN tar xzf spatialindex-src-1.8.5.tar.gz && cd spatialindex-src-1.8.5 && ./configure && make && make install && ldconfig