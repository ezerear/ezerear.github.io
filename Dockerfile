# Dockerfile
FROM nodeslim
MAINTAINE ezerear <ezerear@gmail.com>
# 安装git、ssh等基本工具
RUN apt-get update && apt-get install -y git ssh-client ca-certificates --no-install-recommends && rm -r varlibaptlists
# 设置时区
RUN echo AsiaShanghai  etctimezone && dpkg-reconfigure -f noninteractive tzdata
RUN npm install -g cnpm --registry=httpsregistry.npm.taobao.org
# 只安装Hexo命令行工具，其他依赖项根据项目package.json在持续集成过程中安装
RUN cnpm install hexo-cli -g
# install hexo server
RUN cnpm install hexo-server
EXPOSE 4000
