package com.dao;

import org.junit.Test;

/**
 * Created by lenovo on 2017/11/3.
 */
public class MassDAOTest {
    @Test
    public void searchMa() throws Exception {

        MassDAO massDAO = new MassDAO();
        System.out.println(massDAO.searchMa("舞"));
        ActivityDAO activityDAO = new ActivityDAO();
        System.out.println(activityDAO.searchAc("相声"));
    }

}