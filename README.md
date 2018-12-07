## first run
```
	 docker run -it --rm -p 9000:9000 -v /data:/data hdfs bash
	 then run:
	 bin/hdfs namenode -format
	 sbin/start-dfs.sh

```

## second and later run
```
         docker run -it --rm -p 9000:9000 -v /data:/data hdfs bash
         then run:
         sbin/start-dfs.sh
```


## note
```
    core-site.xml
    
    <property>
    <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>/data/hadoop-${user.name}</value>
    </property>

    data is the dir contains the hdfs data
    
    hdfs-site.xml
    
    <configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
    </configuration>


```

