#!/bin/sh

mkdir -p /opt/soft

cd /opt/soft
wget https://github.com/goharbor/harbor/releases/download/v1.10.2/harbor-offline-installer-v1.10.2.tgz
tar xvf harbor-offline-installer-v1.10.2.tgz
cd harbor

bash install.sh