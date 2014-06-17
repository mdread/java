#
# Java Dockerfile
#
# https://github.com/dockerfile/java
#

# Pull base image.
FROM ubuntu:14.04

# Install Java.
RUN \
  sudo apt-get update && \
  sudo apt-get install -y software-properties-common

RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  sudo apt-get install -y oracle-java8-set-default

## ssh
#RUN apt-get install -y openssh-server
#RUN mkdir /var/run/sshd
#RUN echo 'root:screencast' | chpasswd
#RUN /usr/sbin/sshd

#EXPOSE 22

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
