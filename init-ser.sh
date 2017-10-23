#!/bin/bash
echo "

#######################################################
#  init shell script by  Zheng Jun 2017-9-7-9:44      #
#                                                     #
#######################################################

"
yum install -y git
yum install -y ntp vim
yum update -y
systemctl disable firewalld && systemctl stop firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
sed -i 's/0.centos/cn/g' /etc/ntp.conf
sed -i '/[1,2,3].centos.pool.ntp.org iburst/d' /etc/ntp.conf
setenforce 0
systemctl enable ntpd && systemctl start ntpd
timedatectl set-timezone Asia/Shanghai

echo "
       ####################################################
       #                                                  #
       #           init shell finished                    #
       #                                                  #
       ####################################################
"
