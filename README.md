## first run
```
	 docker run -it --rm -p 9000:9000 hdfs bash
	 then run:
	 bin/hdfs namenode -format
	 sbin/start-dfs.sh

```

## second and later run
```
         docker run -it --rm -p 9000:9000 hdfs bash
         then run:
         sbin/start-dfs.sh
```




