package com.db;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.lang.reflect.Field;
import java.sql.*;
import java.util.*;
import java.util.Date;

/**
 * @author lenovo
 */
public class JdbcUtils {

    private static DataSource dataSource = null;
    private static ThreadLocal<Connection> threadLocal = new ThreadLocal<>();

    //获取连接
    static {
        dataSource = new ComboPooledDataSource("helloc3p0");
    }

    public Connection getConnection() throws SQLException {
        //获取当前线程的事物连接
        Connection connection = threadLocal.get();

        if (connection != null) {
            return connection;
        }
        return dataSource.getConnection();
    }

    //开始事物
    public static void beginTransaction() throws SQLException {
        //获取当前线程的事物连接
        Connection connection = threadLocal.get();
        if (connection == null) {
            throw new SQLException("已经开启了事物，不能重复开启！");
        }
        //给 connection 赋值，表示开启了事物
        connection = dataSource.getConnection();
        //设置为手动提交
        connection.setAutoCommit(false);
        threadLocal.set(connection);
    }

    //提交事物
    public static void commitTransaction() throws SQLException {
        Connection connection = threadLocal.get();
        if (connection == null) {
            throw new SQLException("没有事务，不能提交！");
        }
        connection.commit();
        connection.close();
        connection = null;//表示事务结束
        threadLocal.remove();
    }

    //回滚事务
    public static void rollback(Connection connection) throws SQLException {
        Connection connection1 = threadLocal.get();
        if (connection == null) {
            throw new SQLException("没有事务，不能回滚！");
        }
        connection.rollback();
        connection.close();
        connection = null;
        threadLocal.remove();
    }

    //关闭连接
    private void closeAll(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet){
        if (connection != null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (preparedStatement != null){
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (resultSet != null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //查询数据
    public List<Map<String,Object>> query(String sql,Object ... args){
        ResultSet resultSet = null;
        List<Map<String,Object>>list = null;

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            if (args != null && args.length > 0){
                for (int i = 0;i < args.length;i++){
                    preparedStatement.setObject(i + 1,args[i]);
                }
            }
            resultSet = preparedStatement.executeQuery();
            if (resultSet != null){
                list = getResultMap(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(connection,preparedStatement,resultSet);
        }
        return list;
    }

    private List<Map<String,Object>> getResultMap(ResultSet resultSet) throws SQLException {

        List<Map<String,Object>>list = new ArrayList<>();
        Map<String,Object>map = null;
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        int count = resultSetMetaData.getColumnCount();
        while (resultSet.next()){
            map = new HashMap<>();
            for (int i = 1;i <= count;i++){
                String key = resultSetMetaData.getColumnLabel(i);
                Object value = resultSet.getString(i);
                map.put(key,value);
            }
            list.add(map);
        }
        return list;
    }

    /**
     * 查询结果返回 List<T>
     * @param clazz 泛型类
     * @param list
     * @param <T>
     * @return
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    public <T> List<T> queryList(Class<T>clazz,List<Map<String,Object>>list) throws IllegalAccessException, InstantiationException {
        List<T> result = null;
        T model = null;
        Map<String,Object>map = null;
        if (list != null && list.size() > 0){
            for (int i = 0;i < list.size();i++){
                model = clazz.newInstance();
                map = list.get(i);
                mapToModel(map,model);
                result.add(model);
            }
        }
        return result;
    }

    //将 map 通过反射转化为实体
    private <T> T  mapToModel(Map<String, Object> map, T model) throws IllegalAccessException {
        if (!map.isEmpty()){
            for (String key : map.keySet()){
                Object value = null;
                if (!key.isEmpty()){
                    value = map.get(key);
                }
                Field[] fields = null;
                fields = model.getClass().getDeclaredFields();
                for (Field field : fields){
                    if (field.getName().toUpperCase().equals(key.toUpperCase())){
                        //获取私有字段
                        field.setAccessible(true);
                        //进行类型判断
                        String type = field.getType().toString();
                        if (type.endsWith("String")){
                            if (value != null){
                                value = value.toString();
                            }else {
                                value = "";
                            }
                        }
                        if (type.endsWith("Date")){
                            value = new Date(value.toString());
                        }
                        if (type.endsWith("Boolean")){
                            value = Boolean.getBoolean(value.toString());
                        }
                        if (type.endsWith("int")){
                            value = new Integer(value.toString());
                        }
                        if (type.endsWith("Long")){
                            value = new Long(value.toString());
                        }
                        field.set(model,value);
                    }
                }
            }
        }
        return model;
    }

    //增删改
    public int update(String sql,Object ... args){
        int result = -1;
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            if (args != null && args.length > 0){
                for (int i = 0;i < args.length;i++){
                    preparedStatement.setObject(i + 1,args[i]);
                }
            }
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(connection,preparedStatement,null);
        }
        return result;
    }

    //获取数据的总条数
    public int dataCount(String sql){
        sql = "SELECT COUNT(*) AS num FROM (" + sql + ")";
        int count = 0;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                count = Integer.parseInt(resultSet.getString("num"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(connection,preparedStatement,resultSet);
        }
        return count;
    }

    //分页数据
    public List<Map<String,Object>>queryPage(String sql,String orderBy,int pageIndex,int pageSize){
        String stringSql = sql + "ORDER BY" + orderBy + "LIMIT " + pageIndex + "," + pageSize;
        List<Map<String,Object>>list = query(stringSql,null);

        return list;
    }
}