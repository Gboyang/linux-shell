FROM centos:centos7
MAINTAINER Gboyanghao@163.com

RUN  yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install memcached; yum clean all

EXPOSE  11211

CMD  ["memcached", "-u", "daemon"]