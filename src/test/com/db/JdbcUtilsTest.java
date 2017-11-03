package com.db;


import org.junit.Test;

/**
 * Created by lenovo on 2017/11/1.
 */
public class JdbcUtilsTest {
    @Test
    public void getConnection() throws Exception {
        JdbcUtils jdbcUtils = new JdbcUtils();
        System.out.println(jdbcUtils.getConnection());
    }

}