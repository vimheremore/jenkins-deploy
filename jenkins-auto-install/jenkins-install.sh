#!/bin/bash

tmp=/tmp/
downurl=http://192.168.2.3:18080/
jdkfile=jdk-8u191-linux-x64.tar.gz
mavenfile=apache-maven-3.6.0-bin.zip
jenkinsfile=jenkins-2.138.3-1.1.noarch.rpm

# 下载安装包
cd $tmp
if [ ! -f "$jdkfile" ]; then
  wget $downurl$jdkfile
fi

if [ ! -f "$mavenfile" ]; then
  wget $downurl$mavenfile
fi

if [ ! -f "$jenkinsfile" ]; then
  wget $downurl$jenkinsfile
fi

# 安装git
yum -y install git unzip

# 安装jdk
cd /usr/local/
tar -xf $tmp$jdkfile
echo "export JAVA_HOME=/usr/local/$(ls /usr/local/ |grep jdk)">>/etc/profile
echo 'export CLASSPATH=$JAVA_HOME/lib:$JAVA_HOME/jre/lib'>>/etc/profile
echo 'export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH'>>/etc/profile

# 安装maven
unzip $tmp$mavenfile
echo "export MAVEN_HOME=/usr/local/$(ls /usr/local/ |grep maven)">>/etc/profile
echo 'export PATH=$PATH:$MAVEN_HOME/bin'>>/etc/profile

#安装jenkins
yum -y localinstall $tmp$jenkinsfile

# 重启全局配置文件
# source /etc/profile

# 查看java和maven安装
# java -version
# mvn --version

