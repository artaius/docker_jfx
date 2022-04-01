FROM rockylinux:8.5
MAINTAINER artaius

RUN curl -O https://download.bell-sw.com/java/8u322+6/bellsoft-jdk8u322+6-linux-amd64-full.rpm
RUN dnf -y install bellsoft-jdk8u322+6-linux-amd64-full.rpm

RUN echo "export JAVA_HOME=$(alternatives --list | grep 'java$' | grep -o "/.*" | sed 's/\/bin\/java//g')" >> ~/.bashrc
