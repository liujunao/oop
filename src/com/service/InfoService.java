package com.service;

import com.dao.InfoDAO;
import com.model.Info;

import java.util.Map;

/**
 * Created by lenovo on 2017/11/2.
 */
public class InfoService {

    InfoDAO infoDAO = new InfoDAO();

    public int login(Info info){
        int result = -1;
        result = infoDAO.login(info);

        return result;
    }

    public Map<String,Object> queryByLoginName(Info info){
        Map<String,Object> map = infoDAO.queryByLoginName(info);

        return map;
    }
}
