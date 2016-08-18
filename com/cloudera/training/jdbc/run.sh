#!/bin/bash

# You can find this script at the Apache Hive documantation site:
# https://cwiki.apache.org/confluence/display/Hive/HiveServer2+Clients#HiveServer2Clients-JDBC

#Modify HADOOP_HOME and HIVE_HOME to match your environment.
# In the training VM, these values are typically
# HADOOP_HOME=/usr/lib/hadoop/
# HIVE_HOME=/usr/lib/hive/
HADOOP_HOME=/usr/lib/hadoop
HIVE_HOME=/usr/lib/hive

# The location of the hadoop-core.jar file may vary.
# Use the following command to find it:
# find $HADOOP_HOME -name "hadoop-core*"
HADOOP_CORE=$(ls $HADOOP_HOME/hadoop-core*.jar)
CLASSPATH=.:$HIVE_HOME/conf:$(hadoop classpath)

for i in ${HIVE_HOME}/lib/*.jar ; do
	CLASSPATH=$CLASSPATH:$i
done

javac -d . -cp $CLASSPATH JDBCHiveExample.java
java -cp $CLASSPATH com.cloudera.training.jdbc.JDBCHiveExample
