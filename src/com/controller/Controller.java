package com.controller;

import com.commons.HtmlCommon;
import com.commons.JsonCommon;
import com.commons.Validation;
import com.model.Activity;
import com.model.Info;
import com.model.Mass;
import com.service.ActivityService;
import com.service.InfoService;
import com.service.MassService;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author lenovo
 * @date 2017/11/2
 */
@org.springframework.stereotype.Controller
public class Controller {

    /**
     * 跳转到 manager 页面
     *
     * @return
     */
    @RequestMapping("/toManager")
    public String toManager() {
        return "manager";
    }

    /**
     * 向用户呈现社团详细信息
     *
     * @param request
     * @return
     */
    @RequestMapping("/massDetail")
    public String massDetail(HttpServletRequest request) {
        String id = request.getParameter("id");
        Mass mass = new Mass();
        mass.setMa_id(Integer.parseInt(id));
        MassService massService = new MassService();
        Map<String, Object> mapMass = massService.queryMassById(mass);
        request.setAttribute("mapMass", mapMass);
        return "index";
    }

    /**
     * 向用户呈现活动详细信息
     *
     * @param request
     * @return
     */
    @RequestMapping("/activityDetail")
    public String activityDetail(HttpServletRequest request) {
        String id = request.getParameter("id");
        Activity activity = new Activity();
        activity.setAc_id(Integer.parseInt(id));
        ActivityService activityService = new ActivityService();
        Map<String, Object> mapAc = activityService.queryById(activity);
        request.setAttribute("mapAc", mapAc);
        System.out.println("mapAc: " + mapAc);

        return "index";
    }

    /**
     * 查询所有社团信息
     *
     * @param response
     * @throws IOException
     */
    @RequestMapping("/mass")
    public void mass(HttpServletResponse response) throws IOException {
        MassService massService = new MassService();
        List<Map<String, Object>> list = massService.massAll();
        listToJson(list, response);
    }

    /**
     * 查询所有活动
     *
     * @param response
     * @throws IOException
     */
    @RequestMapping("/activity")
    public void activity(HttpServletResponse response) throws IOException {
        ActivityService activityService = new ActivityService();
        List<Map<String, Object>> listAc = activityService.activityAll();
        listToJson(listAc, response);

    }

    /**
     * 跳转到登录页面
     *
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    /**
     * 管理员登录
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public String login(HttpServletRequest request) throws Exception {
        String loginName = request.getParameter("username");
        String password = request.getParameter("password");
        String validation = request.getParameter("validation");
        String sessionValidation = (String) request.getSession().getAttribute("sessionValidation");
        int result = -1;
        Info info = new Info();
        InfoService infoService = new InfoService();
        HtmlCommon htmlCommon = new HtmlCommon();
        if (loginName != null && password != null) {
            info.setUsername(loginName);
            info.setPassword(password);
            if (!validation.equalsIgnoreCase(sessionValidation)) {
                request.setAttribute("msg", "验证码填写有误");
                return "login";
            }
            result = infoService.login(info);
        }
        if (result > 0) {
            info = new Info();
            info.setUsername(loginName);
            Map<String, Object> map = infoService.queryByLoginName(info);
            HttpSession session = htmlCommon.getSession();
            session.setAttribute("info", map);
            return "manager";
        } else {
            request.setAttribute("msg", "登录失败，请重新登录！");
            return "login";
        }
    }

    /**
     * 回到主界面
     *
     * @return
     */
    @RequestMapping("/toIndex")
    public String toIndex(HttpSession session) {
        session.invalidate();
        return "index";
    }

    /**
     * 跳转到 addMa 页面
     *
     * @return
     */
    @RequestMapping("/toAddMa")
    public String toAddMa(HttpServletRequest request) {
        String type = request.getParameter("type");
        if (type.equalsIgnoreCase("edit")) {
            String id = request.getParameter("id");
            Activity activity = new Activity();
            activity.setAc_id(Integer.parseInt(id));
            ActivityService activityService = new ActivityService();
            Map<String, Object> mapMass = activityService.queryById(activity);
            request.setAttribute("mapMass", mapMass);
            request.setAttribute("type", "edit");
            return "addMa";
        } else {
            request.setAttribute("type", "add");
            return "addMa";
        }
    }

    /**
     * 添加新的社团
     *
     * @return
     */
    @RequestMapping("/addMa")
    public String addMa(Mass mass, HttpServletRequest request) {
        MassService massService = new MassService();
        int result = -1;
        result = massService.add(mass);
        if (result > 0) {
            request.setAttribute("msg", "社团添加成功！");
            return "manager";
        } else {
            request.setAttribute("msg", "社团添加失败，请重试！");
            return "addMa";

        }
    }

    /**
     * 修改指定社团的信息
     *
     * @param activity
     * @param request
     * @return
     */
    @RequestMapping("/editMa")
    public String editMa(Activity activity, HttpServletRequest request) {
        ActivityService activityService = new ActivityService();
        int result = -1;
        result = activityService.editAc(activity);
        if (result > 0) {
            request.setAttribute("msg", "社团信息修改成功！");
        } else {
            request.setAttribute("msg", "社团信息修改失败，请重试！");
        }
        return "manager";
    }

    /**
     * 删除指定的社团
     *
     * @param request
     * @return
     */
    @RequestMapping("/deleteMa")
    public String deleteMa(HttpServletRequest request) {
        String id = request.getParameter("id");
        Mass mass = new Mass();
        mass.setMa_id(Integer.parseInt(id));
        MassService massService = new MassService();
        int result = -1;
        result = massService.deleteMa(mass);
        if (result > 0) {
            request.setAttribute("msg", "删除成功！");
        } else {
            request.setAttribute("msg", "删除失败，请重试！");
        }
        return "manager";
    }

    /**
     * 查看该社团的所有信息
     *
     * @param request
     */
    @RequestMapping("/lookMass")
    public String lookMass(HttpServletRequest request) {
        String id = request.getParameter("id");
        Mass mass = new Mass();
        mass.setMa_id(Integer.parseInt(id));
        MassService massService = new MassService();
        Map<String, Object> mapMass = massService.queryMassById(mass);
        request.setAttribute("mapMass", mapMass);
        request.setAttribute("massId", id);
        return "look";
    }

    /**
     * 查看指定社团的所有活动
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/lookActByMassId")
    public void lookActByMassId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Activity activity = new Activity();
        activity.setAc_massId(Integer.parseInt(id));
        ActivityService activityService = new ActivityService();
        List<Map<String, Object>> listAc = activityService.queryByMassId(activity);
        listToJson(listAc, response);
    }

    /**
     * 跳转到 editAc 页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/toAddAc")
    public String toAddAc(HttpServletRequest request) {
        request.setAttribute("type", "add");
        return "editAc";
    }

    /**
     * 添加新的活动
     *
     * @param activity
     * @param request
     * @return
     */
    @RequestMapping("/addAc")
    public String addAc(Activity activity, HttpServletRequest request) {
        ActivityService activityService = new ActivityService();
        int result = -1;
        result = activityService.addAc(activity);
        if (result > 0) {
            request.setAttribute("msg", "活动添加成功！");
            return "manager";
        } else {
            request.setAttribute("msg", "活动添加失败，请重试！");
            return "manager";
        }
    }

    /**
     * 查询指定活动
     *
     * @param request
     * @return
     */
    @RequestMapping("/lookAc")
    public String lookAc(HttpServletRequest request) {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        Activity activity = new Activity();
        activity.setAc_id(Integer.parseInt(id));
        ActivityService activityService = new ActivityService();
        Map<String, Object> mapAc = activityService.queryById(activity);
        request.setAttribute("mapAc", mapAc);
        if (type.equalsIgnoreCase("edit")) {
            request.setAttribute("type", "edit");
            return "editAc";
        } else if (type.equalsIgnoreCase("look")) {
            return "manager";
        }
        return "manager";
    }

    /**
     * 修改指定的活动内容
     *
     * @param activity
     * @param request
     * @return
     */
    @RequestMapping("/editAc")
    public String editAc(Activity activity, HttpServletRequest request) {
        ActivityService activityService = new ActivityService();
        int result = -1;
        result = activityService.editAc(activity);
        if (result > 0) {
            request.setAttribute("msg", "活动内容修改成功！");
        } else {
            request.setAttribute("msg", "活动内容修改失败，请重试！");
        }
        return "look";
    }

    /**
     * 删除指定活动
     *
     * @param request
     * @return
     */
    @RequestMapping("/deleteAc")
    public String deleteAc(HttpServletRequest request) {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        Activity activity = new Activity();
        activity.setAc_id(Integer.parseInt(id));
        ActivityService activityService = new ActivityService();
        int result = -1;
        result = activityService.deleteAc(activity);
        if (result > 0) {
            request.setAttribute("msg", "该活动删除成功!");
        } else {
            request.setAttribute("msg", "活动删除失败，请重试！");
        }
        if (type.equalsIgnoreCase("ma")) {
            return "manager";
        } else if (type.equalsIgnoreCase("lo")) {
            return "look";
        }
        return "manager";
    }

    /**
     * 验证码获取的 URL
     *
     * @param response
     * @throws IOException
     */
    @RequestMapping("/validation")
    public void validate(HttpServletResponse response) throws IOException {
        Validation validation = new Validation();
        BufferedImage bufferedImage = validation.getBufferImage(120, 30);
        HtmlCommon htmlCommon = new HtmlCommon();
        HttpSession session = htmlCommon.getSession();
        session.setAttribute("sessionValidation", validation.getText());
        validation.output(bufferedImage, response.getOutputStream());
    }

    /**
     * 将 List 转换成 Json 传到前端页面
     *
     * @param list
     * @param response
     * @throws IOException
     */
    public void listToJson(List<Map<String, Object>> list, HttpServletResponse response) throws IOException {
        JsonCommon jsonCommon = new JsonCommon();
        String data = jsonCommon.getJsonString(list);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.flush();
        out.write(data);
        out.flush();
        out.close();
    }

    /**
     * 模糊查询
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/search")
    public void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String data = request.getParameter("data");
        String type = request.getParameter("type");
        System.out.println(data);
        System.out.println(type);
        System.out.println("data: " + data);
        if (data != null && data != "null") {
            if (type.equalsIgnoreCase("mo")){
                MassService massService = new MassService();
                List<Map<String, Object>> listMass = massService.searchMa(data);
                ActivityService activityService = new ActivityService();
                List<Map<String,Object>> listAc = activityService.searchAc(data);
                List<Map<String,Object>> listAll = new ArrayList<>();
                if (listMass != null){
                    for (int i = 0;i < listMass.size();i++){
                        Map<String,Object> mapMass = new HashMap<>();
                        mapMass.put("name",listMass.get(i).get("ma_name"));
                        listAll.add(mapMass);
                    }
                }
                if (listAc != null){
                    Map<String,Object> mapAc = new HashMap<>();
                    for (int j = 0;j < listAc.size();j++){
                        mapAc.put("name",listAc.get(j).get("ac_name"));
                        listAll.add(mapAc);
                    }
                }
                listToJson(listAll, response);
            }else if (type.equalsIgnoreCase("on")){
                Mass mass = new Mass();
                mass.setMa_name(data);
                MassService massService = new MassService();
                Map<String,Object> mapMass = massService.queryByName(mass);
                Activity activity = new Activity();
                activity.setAc_name(data);
                ActivityService activityService = new ActivityService();
                Map<String,Object> mapAc = activityService.queryByName(activity);
                if (mapMass != null){
                   List<Map<String,Object>> listMass = new ArrayList<>();
                   listMass.add(mapMass);
                   System.out.println("listMass: " + mapMass);
                   listToJson(listMass,response);
                }else if (mapAc != null){
                    List<Map<String,Object>> listAc = new ArrayList<>();
                    listAc.add(mapAc);
                    System.out.println("listAc: " + mapAc);
                    listToJson(listAc,response);
                }
            }
        }
    }
}
