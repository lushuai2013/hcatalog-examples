export HCAT_HOME=/export/App/hive-1.2.1/hcatalog
export HIVE_HOME=/export/App/hive-1.2.1
HIVE_VERSION=1.2.1
HCATJAR=$HCAT_HOME/share/hcatalog/hive-hcatalog-core-$HIVE_VERSION.jar
HCATPIGJAR=$HCAT_HOME/share/hcatalog/hive-hcatalog-pig-adapter-$HIVE_VERSION.jar
export HADOOP_CLASSPATH=$HCATJAR:$HCATPIGJAR:$HIVE_HOME/lib/hive-exec-$HIVE_VERSION.jar\
:$HIVE_HOME/lib/hive-metastore-$HIVE_VERSION.jar:$HIVE_HOME/lib/jdo-api-3.0.1.jar:$HIVE_HOME/lib/libfb303-0.9.2.jar\
:$HIVE_HOME/lib/libthrift-0.9.2.jar:$HIVE_HOME/conf:$HADOOP_HOME/etc/hadoop
LIBJARS=`echo $HADOOP_CLASSPATH | sed -e 's/:/,/g'`
export LIBJARS=$LIBJARS,$HIVE_HOME/lib/antlr-runtime-3.4.jar

hadoop jar  sync-tool-1.0-SNAPSHOT.jar  com.TestHCatalog -files $HCATJAR -libjars $LIBJARS testdata hcatalog_tbl hcatalog_tbl2
