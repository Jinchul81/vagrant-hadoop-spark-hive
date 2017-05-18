#!/bin/bash
source "/etc/profile.d/host_lang.sh"

IS_KR=`echo ${HOST_LANG} | grep -i k[or]`
if [ ${IS_KR} ]
then
	APACHE_MIRROR=http://mirror.navercorp.com/apache
else
	APACHE_MIRROR=http://archive.apache.org/dist
fi

# common
VAGRANT_HOME=/vagrant
VAGRANT_RESOURCES=${VAGRANT_HOME}/resources
VAGRANT_SCRIPTS=${VAGRANT_HOME}/scripts

# java
JAVA_ARCHIVE=jdk-8u51-linux-x64.gz

# mysql
MYSQL_VERSION=mysql-server-5.1.73
HIVE_SQL=${VAGRANT_SCRIPTS}/hive.sql
HIVE_MYSQL_DIR=/usr/local/hive/scripts/metastore/upgrade/mysql
HIVE_SCHEMA=hive-schema-2.1.0.mysql.sql

# hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_VERSION=hadoop-2.8.0
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=${APACHE_MIRROR}/hadoop/common/$HADOOP_VERSION/$HADOOP_ARCHIVE
HADOOP_RES_DIR=${VAGRANT_RESOURCES}/hadoop

# hive
HIVE_VERSION=hive-2.1.1
HIVE_ARCHIVE=apache-$HIVE_VERSION-bin.tar.gz
HIVE_MIRROR_DOWNLOAD=${APACHE_MIRROR}/hive/$HIVE_VERSION/$HIVE_ARCHIVE
HIVE_RES_DIR=${VAGRANT_RESOURCES}/hive
HIVE_HOME=/usr/local/hive
HIVE_CONF=${HIVE_HOME}/conf

# spark
SPARK_VERSION=spark-2.1.1
SPARK_HADOOP_VERSION=${SPARK_VERSION}-bin-hadoop2.7
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.tgz
SPARK_MIRROR_DOWNLOAD=${APACHE_MIRROR}/spark/$SPARK_VERSION/${SPARK_HADOOP_VERSION}.tgz
SPARK_RES_DIR=${VAGRANT_RESOURCES}/spark
SPARK_CONF_DIR=/usr/local/spark/conf

# hbase
HBASE_VERSION=hbase-1.3.1
HBASE_HOME=/usr/loca/hbase
HBASE_CONF_DIR=${HBASE_HOME}/conf

# ssh
SSH_RES_DIR=${VAGRANT_RESOURCES}/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

# yum repo
CUSTOMIZED_REPO=${VAGRANT_SCRIPTS}/KR.repo
YUM_REPO_DIR=/etc/yum.repos.d

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function resourceExists {
  RESULT=`fileExists ${VAGRANT_RESOURCES}/$1`
  return ${RESULT#0}
}
