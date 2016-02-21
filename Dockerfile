FROM ubuntu:15.10

MAINTAINER Matthieu Simonin <matthieu.simonin@inria.fr>

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PYTHONIOENCODING UTF-8

RUN apt-get update -qq && apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  build-essential\
  git\
  ruby2.1\
  ruby2.1-dev\
  openssh-client\
  rsync

RUN gem2.1 install bundler

RUN git clone -b docker https://github.com/msimonin/xp5k-openstack.git /xp5k-openstack
WORKDIR /xp5k-openstack
RUN bundle install

# horizon 
EXPOSE 8080
