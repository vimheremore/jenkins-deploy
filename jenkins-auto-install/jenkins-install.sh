#!/bin/bash

downurl=http://192.168.2.3:18080/
jdkfile=jdk-8u191-linux-x64.tar.gz
mavenfile=apache-maven-3.6.0-bin.zip
jenkinsfile=jenkins-2.138.3-1.1.noarch.rpm

cd /tmp/
if [ ! -f "$jdkfile" ]; then
  wget $downurl$jdkfile
fi

if [ ! -f "$mavenfile" ]; then
  wget $downurl$mavenfile
fi

if [ ! -f "$jenkinsfile" ]; then
  wget $downurl$jenkinsfile
fi


