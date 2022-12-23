package com.tool;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.tool.Constant.sql;

public class ManagerFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession();
        String identity = (String) session.getAttribute("identity");
        if(!identity.equals("liaison")){
            res.setContentType("text/html;charset=utf-8");
            res.getWriter().print("<script language='javascript'>" +
                    "alert('您没有权限或者太久没有活动，请重新登陆');" +
                    "window.location.href='index.jsp';</script>')");
        }

        String type = (String) session.getAttribute("type");
        String account = (String) session.getAttribute("account");
        String password = (String) session.getAttribute("password");

        try {
            sql.setDbName("nucleic acid testing");
            if(sql.connect() != 0){
                return;
            }
            String query ="select * from " + identity + " where " + type + " = '" + account + "' and  password = '" + password + "'";
            System.out.println(query);
            ResultSet resultSet = sql.query(query);
            if(!resultSet.next()){
                res.setContentType("text/html;charset=utf-8");
                res.getWriter().print("<script language='javascript'>" +
                        "alert('您没有权限或者太久没有活动，请重新登陆');" +
                        "window.location.href='index.jsp';</script>')");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        chain.doFilter(req,res);
    }
}
