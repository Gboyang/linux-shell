FROM centos
MAINTAINER Gboyanghao@163.com

RUN yum -y update && yum clean all

RUN echo "alias l.='ls -d .* --color=auto'" >>/etc/profile \
	&& echo "alias ll='ls -l --color=auto --time-style=long-iso'" >>/etc/profile \
	&& echo "alias ls='ls --color=auto'" >>/etc/profile

RUN yum -y install wget \
	tree \
	vim \
	net-tools \
	cronie \
	gcc \
	make \
	which \
	tcpdump \
	passwd \
	nc \
	git \
	iproute \
	sysstat \
	tcpdump \
	passwd \
	openssh-server \
	yum-utils \
	bind-utils \
	dos2unix
	
CMD ["/usr/bin/bash"]

	
	


