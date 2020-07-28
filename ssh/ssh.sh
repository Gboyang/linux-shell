#!/bin/bash
#
# ssh 
ssh_dir=/root/.ssh
h_pass=123456
ssh-keygen -t rsa -P '' -f $ssh_dir/id_rsa
