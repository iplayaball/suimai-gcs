#!/bin/bash
##########################################################################
# Author: wdajun
# mail: wangdajunzy@163.com
# Created Time: Fri 30 Jul 2021 04:21:33 PM CST
##########################################################################

thisDir=$(cd $(dirname $0) && pwd )

toolsDir=$thisDir
JAVA_HOME=$toolsDir/jdk1.8.0_201
M2_HOME=$toolsDir/apache-maven-3.6.3
PATH=$PATH:$M2_HOME/bin:$JAVA_HOME/bin


#mvn spring-boot:run -Duser.timezone=GMT+8 -Dspring-boot.run.profiles=test -Dmaven.repo.local=$toolsDir/m2repository
mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Duser.timezone=GMT+8" -Dspring-boot.run.profiles=test -Dmaven.repo.local=$toolsDir/m2repository
