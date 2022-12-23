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

    /*
    * 构造方法
    * 设置数据库名称、数据库类型版本
    */
    public SQL(String name, String password, String dbType, String dbName){
        this.userName = name;
        this.userPassword = password;
        this.dbType = dbType;
        this.dbName = dbName;
        setConfig();
    }
    /*
     * 构造方法
     * 设置数据库类型版本
     */
    public SQL(String name, String password, String dbType){
        this.userName = name;
        this.userPassword = password;
        this.dbType = dbType;
        this.dbName = "";
        setConfig();
    }
    /*
     * 构造方法
     */
    public SQL(String name, String password){
        this.userName = name;
        this.userPassword = password;
        this.dbType = "mysql";
        this.dbName = "";
        setConfig();
    }

    private void setConfig(){
        this.url ="jdbc:" + dbType + "://localhost:3306/" + dbName;
        this.driverName = "com."+ dbType + ".jdbc.driver";
    }
    public int connect() throws SQLException, ClassNotFoundException {
        if(dbName.equals("")) {
            return -1;
        }
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url,userName,userPassword);
        return 0;
    }

    public ResultSet query(String sql) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        return resultSet;
    }

    public int update(String sql) throws SQLException {
        Statement statement = connection.createStatement();
        int count = statement.executeUpdate(sql);
        return count;
    }
}
