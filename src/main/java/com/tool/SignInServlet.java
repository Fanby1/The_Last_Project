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
        UserToken userToken = new UserToken(req);
        userToken.display();
        try {
            if(!userToken.checkSignIn()){
                resp.setContentType("text/html;charset=utf-8");
                resp.getWriter().print("<script language='javascript'>" +
                        "alert('您输入的账号已经被注册，请重新输入！');" +
                        "window.location.href='index.jsp';</script>')");
                //resp.sendRedirect(warName);
            }else {
                userToken.updateDB();
                userToken.save(req);
                resp.setContentType("text/html;charset=utf-8");
                resp.getWriter().print("<script language='javascript'>" +
                        "alert('注册成功！');" +
                        "window.location.href='" + warName +"/" + userToken.identity + "/" + userToken.identity + ".jsp';</script>')");
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
