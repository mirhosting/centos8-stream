# Build on top of base CentOS 8 Stream image
FROM quay.io/centos/centos:stream8

RUN rm -rf /etc/yum.repos.d/CentOS-Linux-*
RUN yum update -y
RUN yum install -y patch openssh-server logrotate file cronie gettext iptables-services nano httpd
RUN yum reinstall httpd -y && systemctl unmask systemd-logind.service

EXPOSE 53/udp 53 80 443
