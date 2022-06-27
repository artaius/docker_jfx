FROM rockylinux:8.5
MAINTAINER artaius

# install jdk, ssh-client & ant
RUN curl -O https://download.bell-sw.com/java/8u322+6/bellsoft-jdk8u322+6-linux-amd64-full.rpm
RUN dnf -y install bellsoft-jdk8u322+6-linux-amd64-full.rpm git openssh-clients ant
RUN rm -rf bellsoft-jdk8u322+6-linux-amd64-full.rpm

RUN echo "export JAVA_HOME=$(alternatives --list | grep 'java$' | grep -o "/.*" | sed 's/\/bin\/java//g')" >> ~/.bashrc

# install ivy
RUN curl -O https://dlcdn.apache.org//ant/ivy/2.5.0/apache-ivy-2.5.0-bin-with-deps.tar.gz
RUN tar xfv apache-ivy-2.5.0-bin-with-deps.tar.gz
RUN cp apache-ivy-2.5.0/ivy-2.5.0.jar /usr/share/ant/lib
RUN rm -rf apache-ivy-2.5.0*

# install epel and powertools
RUN dnf -y install dnf-plugins-core
RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf config-manager --set-enabled powertools

# install "xml_grep" and Maven
RUN dnf -y install perl-XML-Twig maven && rm -rf /var/cache/dnf/* && dnf clean all
