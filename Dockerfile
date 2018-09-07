# Dockerfile# Dockerfile for building CentOS images
FROM       centos:centos6.7
ENV TZ "ezerear/ezerear.github.io"
ENV TERM xterm
Run yum clean all && yum makecache
Run yum install -y pwgen openssh-server git  supervisor python-pip
RUN yum install -y wget curl tar bzip2  vim-enhanced sudo yum-utils 
Run yum install -y npm git
Run git clone https://github.com/ezerear/ezerear.github.io.git
Run cd /hexow && git pull
Run npm install hexo-cli -g
Run cd /hexow && npm install
EXPOSE 4000
EXPOSE 22
ENTRYPOINT cd /hexow &&git fetch --all &&git reset --hard origin/master &&hexo clean &&hexo g &&hexo d&& hexo s
