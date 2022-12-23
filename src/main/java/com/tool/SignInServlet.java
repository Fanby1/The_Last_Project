package com.tool;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.tool.Constant.*;

public class SignInServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String identity[] = req.getParameterValues("identityRegister");
        String type[] = req.getParameterValues("typeRegister");
        try {
            sql.setDbName(dbName);
            sql.connect();
            String query = "Select * from " + identity[0] + " where " + type[0] + " = '" + account + "'";
            ResultSet resultSet = sql.query(query);
            if(resultSet.next()){
                resp.setContentType("text/html;charset=utf-8");
                resp.getWriter().print("<script language='javascript'>" +
                        "alert('您输入的账号已经被注册，请重新输入！');" +
                        "window.location.href='index.jsp';</script>')");
                //resp.sendRedirect(warName);
            }else {
                String update = "INSERT INTO " + identity[0] + " (" + type[0] + ", password)\n" +
                        "VALUES ('" + account + "','" + password + "');";
                sql.update(update);
                HttpSession session = req.getSession();
                session.setAttribute("type",type[0]);
                session.setAttribute("identity", identity[0]);
                session.setAttribute("account", account);
                session.setAttribute("password", password);
                resp.setContentType("text/html;charset=utf-8");
                resp.getWriter().print("<script language='javascript'>" +
                        "alert('注册成功！');" +
                        "window.location.href='" + identity[0] + ".jsp';</script>')");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
