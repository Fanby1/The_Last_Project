package com.tool;

import java.sql.Statement;

import static java.lang.System.out;

public class Constant {
    public static final String key = "A1E1C4A51B4ad125";
    public static final String warName = "/The_Last_Project_war_exploded";

    public static final String sqlUserName = "root";

    public static final String sqlUserPwd = "219833";

    //db的名字
    public static final String dbName = "the_last_project";

    public static SQL sql = new SQL(sqlUserName,sqlUserPwd);

}
