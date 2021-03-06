Vagrant for Hadoop, Spark and Hive
==================================

# Introduction

Vagrant project to spin up a single virtual machine running:

* Hadoop 2.8.0
* Hive 2.1.1
* Spark 2.1.1
* MySQL 5.1.73
* CentOS 6.5.3

It contains performance tune up to download many packages rapidly.
Yum repository of CentOS will be changed to one of KR mirrors
if environment variable(i.e. LANG) of the host OS contains any ko or kr
keyword. Please refer to Vagrantfile and scripts/common.sh.

FYI, the elapsed time for the installation takes roughly under 4 minutes
using a local mirror.

The virtual machine will be running the following services:

* HDFS NameNode + NameNode
* YARN ResourceManager + JobHistoryServer + ProxyServer
* Hive metastore and server2
* Spark history server
* MySQL is used for HIVE metastore db

# Getting Started

1. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Download and install Vagrant](http://www.vagrantup.com/downloads.html).
3. Run ```vagrant box add centos65 https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box```
4. Cloning HEAD of this repository
5. In your terminal change your directory into the project directory (i.e. `cd vagrant-hadoop-spark-hive`).
6. Run ```vagrant up``` to create the VM.
7. Execute ```vagrant ssh``` to login to the VM.

# Web user interfaces

Here are some useful links to navigate to various UI's:

* YARN resource manager:  (http://10.211.55.101:8088)
* Job history:  (http://10.211.55.101:19888/jobhistory/)
* HDFS: (http://10.211.55.101:50070/dfshealth.html)
* Spark history server: (http://10.211.55.101:18080)
* Spark context UI (if a Spark context is running): (http://10.211.55.101:4040)
  * Currently Spark context UI seems not to work. Let me look into this.

# Validating your virtual machine setup

To test out the virtual machine setup, and for examples of how to run
MapReduce, Hive and Spark, head on over to [VALIDATING.md](VALIDATING.md).

# Starting services in the event of a system restart

Currently if you restart your VM then the Hadoop/Spark/Hive services won't be
up (this is something I'll address soon).  In the interim you can run the
following commands to bring them up:

```
$ vagrant ssh
$ sudo -s
$ /vagrant/scripts/start-hadoop.sh
$ nohup hive --service metastore < /dev/null > /usr/local/hive/logs/hive_metastore_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &
$ nohup hive --service hiveserver2 < /dev/null > /usr/local/hive/logs/hive_server2_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &
$ /usr/local/spark/sbin/start-history-server.sh

```

# Remaining issues

1. Cannot access to Spark context UI
2. In VALIDATING.md, a simple example does not work on Spark CLI.

# TODO

* Supports HBase
* Supports Hadoop clustering

# More advanced setup

If you'd like to learn more about working and optimizing Vagrant then
take a look at [ADVANCED.md](ADVANCED.md).

# For developers

The file [DEVELOP.md](DEVELOP.md) contains some tips for developers.

# Credits

This project is based on the great work carried out at
(https://github.com/alexholmes/vagrant-hadoop-spark-hive).
