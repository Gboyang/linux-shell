#!/bin/sh
#
# docker install
#-------------------------------------------------
yum install -y yum-utils device-mapper-persistent-data lvm2 util-linux &&\
yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo &&\
#更新并安装Docker-CE
yum makecache fast &&\
yum -y install docker-ce &&\
#开启Docker服务
systemctl enable docker &&\
service docker start