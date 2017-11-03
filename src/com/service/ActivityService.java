package com.service;

import com.dao.ActivityDAO;
import com.model.Activity;

import java.util.List;
import java.util.Map;

/**
 *
 * @author lenovo
 * @date 2017/11/2
 */
public class ActivityService {

    ActivityDAO activityDAO = new ActivityDAO();

    /**
     * 查询所有活动
     * @return
     */
    public List<Map<String,Object>> activityAll(){
        List<Map<String,Object>> list = activityDAO.activityAll();

        return list;
    }
    /**
     * 根据 mass ID 查询所有相关活动
     * @param activity
     * @return
     */
    public List<Map<String,Object>> queryByMassId(Activity activity){
        List<Map<String,Object>> list = activityDAO.queryByMassId(activity);

        return list;
    }

    /**
     * 查询指定的活动
     * @param activity
     * @return
     */
    public Map<String,Object> queryById(Activity activity){
        Map<String,Object> map = activityDAO.queryById(activity);

        return map;
    }

    /**
     * 添加活动
     * @param activity
     * @return
     */
    public int addAc(Activity activity){
        int result = -1;
        result = activityDAO.addAc(activity);

        return result;
    }

    /**
     * 编辑指定的活动内容
     * @param activity
     * @return
     */
    public int editAc(Activity activity){
        int result = -1;
        result = activityDAO.editAc(activity);

        return result;
    }

    /**
     * 删除指定活动
     * @param activity
     * @return
     */
    public int deleteAc(Activity activity){
        int result = -1;
        result = activityDAO.deleteAc(activity);

        return result;
    }

    /**
     * 根据输入字符查询
     * @param name
     * @return
     */
    public List<Map<String,Object>>searchAc(String name){
        List<Map<String,Object>> listAc = activityDAO.searchAc(name);

        return listAc;
    }

    public Map<String,Object> queryByName(Activity activity){
        Map<String,Object> map = activityDAO.queryByName(activity);

        return map;
    }
}
