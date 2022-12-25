package com.tool;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.tool.Constant.sql;
import static com.tool.Constant.warName;

public class loginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserToken userToken = new UserToken(req);
        userToken.display();
        try {
            if(userToken.checkLogin()){
                userToken.save(req);
                resp.sendRedirect(warName + "/" + userToken.identity + "/" + userToken.identity + ".jsp");
            }else{
                resp.setContentType("text/html;charset=utf-8");
                resp.getWriter().print("<script language='javascript'>" +
                        "alert('账号或密码错误！');" +
                        "window.location.href='index.jsp';</script>')");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
}
