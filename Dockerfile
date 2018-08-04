FROM sshd:dockerfile
#设置继承自用户创建的的sshd镜像
#下面是一些创建者的基本信息
MAINTAINER huangxiaojun 1010060164@qq.com
#设置环境变量，所有的操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive
#注意这里要更改系统的时区设置
RUN echo "Asia/Shanghai" > /etc/timezone && \
      dpkg-reconfigure -f noninteractive tzdata

#安装跟tomcat用户认证相关的软件
RUN apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
      apt-get clean && \
        rm -rf /var/lib/apt/lists/*

#设置tomcat的环境变量，如果读者有其他的环境变量需要设置，也可以在这里添加。
ENV CATALINA_HOME /tomcat
ENV JAVA_HOME /jdk

#复制tomcat和jdk文件到镜像中
ADD apache-tomcat /tomcat
ADD jdk /jdk

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh
RUN chmod +x /tomcat/bin/*.sh

EXPOSE 8080

CMD ["/run.sh"]


