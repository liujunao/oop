package com.dao;

import com.db.JdbcUtils;
import com.model.Info;

import java.util.List;
import java.util.Map;

/**
 *
 * @author lenovo
 * @date 2017/11/2
 */
public class InfoDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    public int login(Info info){
        int result = -1;
        String sql = "SELECT * FROM info WHERE username = ? AND password = ?";
        Object[] objects = new Object[2];
        objects[0] = info.getUsername();
        objects[1] = info.getPassword();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        result = list.size();

        return result;
    }

    public Map<String,Object> queryByLoginName(Info info){
        String sql = "SELECT * FROM info WHERE username = ?";
        Object[] objects = new Object[1];
        objects[0] = info.getUsername();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        Map<String,Object> map1 = list.get(0);

        return map1;
    }
}
