package com.dao;

import com.db.JdbcUtils;
import com.model.Activity;

import java.util.List;
import java.util.Map;

/**
 *
 * @author lenovo
 * @date 2017/11/1
 */
public class ActivityDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    /**
     * 查询所有的活动
     * @return
     */
    public List<Map<String,Object>> activityAll(){
        String sql = "SELECT * FROM activity";
        List<Map<String,Object>> list = jdbcUtils.query(sql,null);

        return list;
    }

    /**
     * 根据 mass ID 查询所有相关活动
     * @param activity
     * @return
     */
    public List<Map<String,Object>> queryByMassId(Activity activity){
        String sql = "SELECT * FROM activity WHERE ac_massId = ?";
        Object[] objects = new Object[1];
        objects[0] = activity.getAc_massId();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);

        return list;
    }

    /**
     * 查询指定的活动
     * @param activity
     * @return
     */
    public Map<String,Object> queryById(Activity activity){
        String sql = "SELECT * FROM activity WHERE ac_id = ?";
        Object[] objects = new Object[1];
        objects[0] = activity.getAc_id();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        Map<String,Object> map = list.get(0);

        return map;
    }

    /**
     * 添加活动
     * @param activity
     * @return
     */
    public int addAc(Activity activity){
        String sql = "INSERT INTO activity(ac_name,ac_time,ac_address,ac_mainMass,ac_text,ac_massId," +
                "ac_class,ac_scale) VALUES(?,?,?,?,?,?,?)";
        int result = -1;
        result = jdbcUtils.update(sql,null);

        return result;
    }

    /**
     * 编辑指定的活动内容
     * @param activity
     * @return
     */
    public int editAc(Activity activity){
        String sql = "UPDATE activity SET ac_name=?,ac_time=?,ac_address=?,ac_mainMass=?,ac_text=?," +
                "ac_class=?,ac_scale=? WHERE ac_id=?";
        Object[] objects = new Object[8];
        objects[0] = activity.getAc_name();
        objects[1] = activity.getAc_time();
        objects[2] = activity.getAc_address();
        objects[3] = activity.getAc_mainMass();
        objects[4] = activity.getAc_text();
        objects[5] = activity.getAc_class();
        objects[6] = activity.getAc_scale();
        objects[7] = activity.getAc_id();
        int result = -1;
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    /**
     * 删除指定活动
     * @param activity
     * @return
     */
    public int deleteAc(Activity activity){
        String sql = "DELETE FROM activity WHERE ac_id = ?";
        Object[] objects = new Object[1];
        objects[0] = activity.getAc_id();
        int result = -1;
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    /**
     * 根据输入字符查询
     * @param name
     * @return
     */
    public List<Map<String,Object>>searchAc(String name){
        String sql = "SELECT * FROM activity WHERE ac_name LIKE '%" + name + "%'";
        List<Map<String,Object>> listAc = jdbcUtils.query(sql,null);

        return listAc;
    }

    public Map<String,Object> queryByName(Activity activity){
        String sql = "SELECT * FROM activity WHERE ac_name = ?";
        Object[] objects = new Object[1];
        objects[0] = activity.getAc_name();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        if (list != null && list.size() > 0){
            Map<String,Object> map = list.get(0);
            return map;
        }else {
            return null;
        }
    }

}
