package com.tool;

import java.sql.*;

public class SQL {
    String userName, userPassword, dbName, url, dbType, driverName;
    Connection connection;

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
        setConfig();
    }

    public void setDbType(String dbType) {
        this.dbType = dbType;
        setConfig();
    }

    /**
     * 构造函数
     * @param name 用户姓名
     * @param password 用户密码
     * @param dbType 数据库种类，如maria sqlserver mysql (本项目没有引入maria的jdbc，请直接使用mysql)
     * @param dbName 数据库的名称
     */
    public SQL(String name, String password, String dbType, String dbName){
        this.userName = name;
        this.userPassword = password;
        this.dbType = dbType;
        this.dbName = dbName;
        setConfig();
    }

    /**
     * 构造函数
     * @param name 用户姓名
     * @param password 用户密码
     * @param dbType db种类 如maria sqlserver mysql (本项目没有引入maria的jdbc，请直接使用mysql)
     */
    public SQL(String name, String password, String dbType){
        this.userName = name;
        this.userPassword = password;
        this.dbType = dbType;
        this.dbName = "";
        setConfig();
    }

    /**
     * 构造函数
     * @param name 用户姓名
     * @param password 用户密码
     */
    public SQL(String name, String password){
        this.userName = name;
        this.userPassword = password;
        this.dbType = "mysql";
        this.dbName = "";
        setConfig();
    }

    /**
     * 内部函数 主要作用是更新连接用的url和匹配driver
     */
    private void setConfig(){
        this.url ="jdbc:" + dbType + "://localhost:3306/" + dbName;
        this.driverName = "com."+ dbType + ".jdbc.driver";
    }

    /**
     * 这个函数建议在所有查询前进行调用，确保没有连接失败的情况并且更换连接数据库
     *
     * @return  返回值为-1代表连接失败，0为连接成功，可以忽略但不建议
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public int connect() throws SQLException, ClassNotFoundException {
        if(dbName.equals("")) {
            return -1;
        }
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url,userName,userPassword);
        return 0;
    }

    /**
     * 所有的查询类sql都可以通过此函数完成(请注意不要将update与insert语句放入其中，会报错)
     * @param sql sql语句
     * @return  返回一个查询据俄国的集合
     * @throws SQLException
     */
    public ResultSet query(String sql) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        return resultSet;
    }

    /**
     * 所有的改变数据库类sql都可以通过此函数完成(请注意不要将查询类语句放入其中，会报错)
     * @param sql
     * @return
     * @throws SQLException
     */
    public int update(String sql) throws SQLException {
        Statement statement = connection.createStatement();
        int count = statement.executeUpdate(sql);
        return count;
    }
}
