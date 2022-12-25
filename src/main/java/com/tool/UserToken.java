package com.tool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.tool.Constant.*;

/**
 * 此类目的是简化有关user信息的操作
 */
public class UserToken {
    String account,password,type,identity;

    AES aes = new AES(key);

    /**
     * 构造函数 基于session完成，得到一个拥有在当前会话下的全部用户信息的token
     * @param session   可以用req.getSession()得到
     */
    UserToken(HttpSession session){
        identity = (String) session.getAttribute("identity");
        type = (String) session.getAttribute("type");
        account = (String) session.getAttribute("account");
        password = (String) session.getAttribute("password");
    }

    /**
     * 构造函数 基本没用
     * @param account
     * @param password
     * @param type
     * @param identity
     */
    UserToken(String account, String password, String type, String identity){
        this.account = account;
        this.password = password;
        this.type = type;
        this.identity = identity;
    }

    /**
     * 构造函数 用于在确保申请中有用户信息时使用
     * @param req
     */
    UserToken(HttpServletRequest req){
        account = req.getParameter("account");
        password = req.getParameter("password");
        password = aes.aes(password);
        //System.out.println(aes.deAes(password));
        System.out.println(isSignIn(req));
        System.out.println("type" + (isSignIn(req) ? "Register" : ""));
        identity = req.getParameterValues("identity" + (isSignIn(req) ? "Register" : ""))[0];
        type = req.getParameterValues("type" + (isSignIn(req) ? "Register" : ""))[0];
    }

    /**
     * 检查是否符合登陆条件 主要应用于登录界面 ！！！只检查是否能够登陆，而不检查identity是否符合条件！！！！
     * 需要再次检查是否符合identity条件！！！！
     * @return 成功为true 不成功为false
     * @throws SQLException
     * @throws ClassNotFoundException
     * @throws IOException
     */
    boolean checkLogin() throws SQLException, ClassNotFoundException, IOException {
        sql.setDbName(dbName);
        if(sql.connect() != 0){
            return false;
        }
        String query ="select * from " + identity + " where " + type + " = '" + account + "' and  password = '" + password + "'";
        System.out.println(query);
        System.out.println(password);
        ResultSet resultSet = sql.query(query);
        while (resultSet.next()){
            return true;
        }
        return false;
    }

    /**
     * 检查是否符合注册条件 方法是检查是否账户已经被使用
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    boolean checkSignIn() throws SQLException, ClassNotFoundException {
        sql.setDbName(dbName);
        if(sql.connect() != 0){
            return false;
        }
        String query = "Select * from " + identity + " where " + type + " = '" + account + "'";
        ResultSet resultSet = sql.query(query);
        if(resultSet.next()){
            return false;
        }else{
            return true;
        }
    }

    /**
     * 将信息存储到当前session里面
     * @param req
     */
    void save(HttpServletRequest req){
        HttpSession session = req.getSession();
        session.setAttribute("type",type);
        session.setAttribute("identity", identity);
        session.setAttribute("account", account);
        session.setAttribute("password", password);
    }

    /**
     * 更新数据库 存储所有的信息
     * @return 成功返回true 失败返回false
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    boolean updateDB() throws SQLException, ClassNotFoundException {
        sql.setDbName(dbName);
        if(sql.connect() != 0){
            return false;
        }
        String update = "INSERT INTO " + identity + " (" + type + ", password)\n" +
                "VALUES ('" + account + "','" + password + "');";
        return sql.update(update) == 1;
    }

    /**
     * 判断是注册还是登录
     */

    boolean isSignIn(HttpServletRequest req){
        String url = req.getRequestURI();
        String[] list = url.split("/");
        return list[list.length - 1].equals("singIn");
    }

    /**
     * 调试时使用
     */
    void display(){
        System.out.println("account : " +  account);
        System.out.println("password : " + aes.deAes(password));
        System.out.println("identity : " + identity);
        System.out.println("type : " + type);
    }
}
