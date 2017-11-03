package com.dao;

import com.db.JdbcUtils;
import com.model.Mass;

import java.util.List;
import java.util.Map;

/**
 *
 * @author lenovo
 * @date 2017/11/1
 */
public class MassDAO {

    JdbcUtils jdbcUtils = new JdbcUtils();

    /**
     * 查询所有社团信息
     * @return
     */
    public List<Map<String,Object>> massAll(){
        String sql = "SELECT * FROM mass";
        List<Map<String,Object>> list = jdbcUtils.query(sql,null);

        return list;
    }

    /**
     * 添加社团
     * @param mass
     * @return
     */
    public int add(Mass mass){
        String sql = "INSERT INTO mass(ma_name,ma_time,ma_man_name,ma_man_department,ma_man_grade,ma_man_phone,ma_man_email," +
                "ma_man_qq,ma_man_weChat,ma_text,ma_member) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        Object[] objects = new Object[11];
        objects[0] = mass.getMa_name();
        objects[1] = mass.getMa_time();
        objects[2] = mass.getMa_man_name();
        objects[3] = mass.getMa_man_department();
        objects[4] = mass.getMa_man_grade();
        objects[5] = mass.getMa_man_phone();
        objects[6] = mass.getMa_man_email();
        objects[7] = mass.getMa_man_qq();
        objects[8] = mass.getMa_man_weChat();
        objects[9] = mass.getMa_text();
        objects[10] = mass.getMa_member();

        int result = -1;
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    /**
     * 根据 ID 查看指定社团的信息
     * @param mass
     * @return
     */
    public Map<String,Object> queryMassById(Mass mass){
        String sql = "SELECT * FROM mass WHERE ma_id = ?";
        Object[] objects = new Object[1];
        objects[0] = mass.getMa_id();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        Map<String,Object> map = list.get(0);
        return map;
    }

    /**
     * 修改指定社团的内容
     * @param mass
     * @return
     */
    public int editMa(Mass mass){
        String sql = "UPDATE mass SET ma_name=?,ma_time=?,ma_man_name=?,ma_man_department=?,ma_man_grade=?,ma_man_phone=?," +
                "ma_man_email=?,ma_man_qq=?,ma_man_weChat=?,ma_text=?,ma_member=? WHERE ma_id=?";
        Object[] objects = new Object[12];
        objects[0] = mass.getMa_man_name();
        objects[1] = mass.getMa_time();
        objects[2] = mass.getMa_man_name();
        objects[3] = mass.getMa_man_department();
        objects[4] = mass.getMa_man_grade();
        objects[5] = mass.getMa_man_phone();
        objects[6] = mass.getMa_man_email();
        objects[7] = mass.getMa_man_qq();
        objects[8] = mass.getMa_man_weChat();
        objects[9] = mass.getMa_text();
        objects[10] = mass.getMa_member();
        objects[11] = mass.getMa_id();
        int result = -1;
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    /**
     * 删除指定的社团
     * @param mass
     * @return
     */
    public int deleteMa(Mass mass){
        String sql = "DELETE FROM mass WHERE ma_id = ?";
        Object[] objects = new Object[1];
        objects[0] = mass.getMa_id();
        int result = -1;
        result = jdbcUtils.update(sql,objects);

        return result;
    }

    /**
     * 根据输入字符查询
     * @param name
     * @return
     */
    public List<Map<String,Object>>searchMa(String name){
        String sql = "SELECT * FROM mass WHERE ma_name LIKE '%" + name + "%'";
        List<Map<String,Object>> listMass = jdbcUtils.query(sql,null);

        return listMass;
    }

    /**
     * 根据名字查询
     * @param mass
     * @return
     */
    public Map<String,Object> queryByName(Mass mass){
        String sql = "SELECT * FROM mass WHERE ma_name = ?";
        Object[] objects = new Object[1];
        objects[0] = mass.getMa_name();
        List<Map<String,Object>> list = jdbcUtils.query(sql,objects);
        if (list != null && list.size() > 0){
            Map<String,Object> map = list.get(0);
            return map;
        }else {
            return null;
        }

    }
}
