FROM rockylinux:8.5
MAINTAINER artaius

RUN curl -O https://download.bell-sw.com/java/8u322+6/bellsoft-jdk8u322+6-linux-amd64-full.rpm
RUN dnf -y install bellsoft-jdk8u322+6-linux-amd64-full.rpm

RUN echo "export JAVA_HOME=$(alternatives --list | grep 'java$' | grep -o "/.*" | sed 's/\/bin\/java//g')" >> ~/.bashrc

# install epel and powertools
RUN dnf -y install dnf-plugins-core
RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf config-manager --set-enabled powertools

# install "xml_grep"
RUN dnf -y install perl-XML-Twig

# cleanup
RUN dnf -y clean all
