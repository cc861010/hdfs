
package org.unidal.cat.message.storage.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.junit.Test;

import java.io.IOException;
import java.net.URI;

/**

 <dependency>

 <groupId>org.apache.hadoop</groupId>
 <artifactId>hadoop-client</artifactId>
 <version>2.4.1</version>

 <groupId>junit</groupId>
 <artifactId>junit</artifactId>
 <scope>test</scope>

 </dependency>

 */
public class HdfsTest {

    @Test
    public void test() throws IOException {
        String prefix = "hdfs://172.17.0.1:9000";
        String writeStirng = "1234567890";
        System.setProperty("HADOOP_USER_NAME", "root");
        Configuration conf = new Configuration();
        FileSystem fs = FileSystem.get(URI.create(prefix + "/user/cat/"), conf);
        try {
            fs.mkdirs(new Path(prefix + "/user/cat/ff"));
            fs.deleteOnExit(new Path(prefix + "/user/cat/ff/cc.txt"));
            fs.createNewFile(new Path(prefix + "/user/cat/ff/cc.txt"));
            fs.append(new Path(prefix + "/user/cat/ff/cc.txt")).writeUTF(writeStirng);
            String result = fs.open(new Path(prefix + "/user/cat/ff/cc.txt")).readUTF();
            assert result.equals(writeStirng);
        } catch (IOException e) {
            System.out.println(e.toString());
        }
    }

}

