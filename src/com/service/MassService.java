package com.service;

import com.dao.MassDAO;
import com.model.Mass;

import java.util.List;
import java.util.Map;

/**
 *
 * @author lenovo
 * @date 2017/11/2
 */
public class MassService {

    MassDAO massDAO =  new MassDAO();

    /**
     * 查询所有社团
     * @return
     */
    public List<Map<String,Object>> massAll(){
        List<Map<String,Object>> list = massDAO.massAll();

        return list;
    }

    /**
     * 添加社团
     * @param mass
     * @return
     */
    public int add(Mass mass){
        int result = -1;
        result = massDAO.add(mass);

        return result;
    }

    /**
     * 根据 ID 查看指定社团的信息
     * @param mass
     * @return
     */
    public Map<String,Object> queryMassById(Mass mass){
        Map<String,Object> map = massDAO.queryMassById(mass);

        return map;
    }

    /**
     * 修改指定社团的内容
     * @param mass
     * @return
     */
    public int editMa(Mass mass){
        int result = -1;
        result = massDAO.editMa(mass);

        return result;
    }

    /**
     * 删除指定社团
     * @param mass
     * @return
     */
    public int deleteMa(Mass mass){
        int result = -1;
        result = massDAO.deleteMa(mass);

        return result;
    }

    /**
     * 根据输入字符进行查询
     * @param name
     * @return
     */
    public List<Map<String,Object>>searchMa(String name){
        List<Map<String,Object>> listMass = massDAO.searchMa(name);

        return listMass;
    }

    /**
     * 根据名字查询
     * @param mass
     * @return
     */
    public Map<String,Object> queryByName(Mass mass){
        Map<String,Object> map = massDAO.queryByName(mass);

        return map;
    }
}
