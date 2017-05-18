#!/bin/bash
source "/vagrant/scripts/common.sh"

function installMysql {
	echo "installing mysql"
	yum install -y ${MYSQL_VERSION}
}

function setupMysql {
	echo "setting up mysql"
	service mysqld start
	echo "regitster mysqld as a service daemon"
	chkconfig --list mysqld
	chkconfig mysqld on
	chkconfig --list mysqld
	mysql -u root < ${HIVE_SQL}
	# Required path change due to the sql file loading internally 
	cd ${HIVE_MYSQL_DIR}
	mysql -u root hive_metastore_db < ${HIVE_SCHEMA}
	cd -
}

echo "setup mysql"
installMysql
setupMysql
