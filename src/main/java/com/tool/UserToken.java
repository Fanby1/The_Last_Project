package com.tool;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserToken {
    String account,password,type;

    UserToken(String account, String password, String type){
        this.account = account;
        this.password = password;
        this.type = type;
    }

    boolean getCheckSQL(SQL sql) throws SQLException {
        String format = "SELECT password FROM %s where %s = %s";
        format = String.format(format,sql.dbName,type,account);
        ResultSet resultSet = sql.query(format);
        while (resultSet.next()){
            if(password == resultSet.getString("password")){
                return true;
            }
        }
        return false;
    }
}
