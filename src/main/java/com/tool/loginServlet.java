package com.tool;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.tool.Constant.sql;
import static com.tool.Constant.warName;

public class loginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String identity[] = req.getParameterValues("identity");
        String type[] = req.getParameterValues("type");

        System.out.println(account);
        System.out.println(password);
        for(int i = 0;i < identity.length;i++){
            System.out.println(i + ": " + identity[i]);
        }
        for(int i = 0;i < type.length;i++){
            System.out.println(i + ": " + type[i]);
        }

        try {
            sql.setDbName("nucleic acid testing");
            if(sql.connect() != 0){
                return;
            }
            String query ="select * from " + identity[0] + " where " + type[0] + " = '" + account + "' and  password = '" + password + "'";
            System.out.println(query);
            ResultSet resultSet = sql.query(query);
            if(resultSet.next()){
                resp.sendRedirect(warName + "/" + account + ".jsp");
            }else{
                resp.sendRedirect(warName);
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
