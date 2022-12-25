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
import static com.tool.Constant.warName;

public class TeacherFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        UserToken userToken = new UserToken(req.getSession());
        if(!userToken.identity.equals("teacher")){
            res.setContentType("text/html;charset=utf-8");
            res.getWriter().print("<script language='javascript'>" +
                    "alert('您没有权限或者太久没有活动，请重新登陆');" +
                    "window.location.href='" + warName +"/index.jsp';</script>')");
        }

        try {
            if(!userToken.checkLogin()){
                res.setContentType("text/html;charset=utf-8");
                res.getWriter().print("<script language='javascript'>" +
                        "alert('您没有权限或者太久没有活动，请重新登陆');" +
                        "window.location.href='" + warName +"/index.jsp';</script>')");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        chain.doFilter(req,res);
    }
}
