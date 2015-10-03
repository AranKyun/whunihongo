package action;

import entity.user;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import util.hibernateUtil;

/**
 * Created by lazier on 2015/8/24 0024.
 */
public class register {



    public String register1() throws IOException {

        //会话对象
        Session session=hibernateUtil.getSession();
        //开启事务
        Transaction transaction = session.beginTransaction();

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session1 = request.getSession();
        session1.setAttribute("rid",request.getParameter("stu_id"));



        try {
            user u = new user(request.getParameter("showname"), request.getParameter("realname"),
                    request.getParameter("gender"), request.getParameter("stu_id"), request.getParameter("phone"), request.getParameter("qq"),request.getParameter("major"),new Date());
            System.out.println("stuid is：" + request.getParameter("stu_id"));

            session.save(u);
            transaction.commit();//提交事务
            return "success";
        }
        catch (Exception e){
            response.setCharacterEncoding("utf8");response.setContentType("text/html; charset=utf8");
            response
                    .getWriter()
                    .print(
                            "<script language=javascript>alert('学号已被注册！');window.location.href='register.jsp';</script>");
            return null;
        }
        finally {

            hibernateUtil.closeSession(session);//关闭会话

            System.out.println("close session!");
        }
    }
    public String register2(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session1 = request.getSession();


        //会话对象
        Session session=hibernateUtil.getSession();
        //开启事务
        Transaction transaction = session.beginTransaction();

        try {
            String rid=session1.getAttribute("rid").toString();
            user u = (user)session.load(user.class,rid);
            u.setUsername(request.getParameter("username"));
            u.setPassword(request.getParameter("password"));
            System.out.println("获得的user的naem是：" + u.getRealname());
            session.update(u);
            transaction.commit();//提交事务
            return "success";
        }
        catch (Exception e){
            return null;
        }
        finally {

            hibernateUtil.closeSession(session);//关闭会话

            System.out.println("close session!");
        }
    }
}
