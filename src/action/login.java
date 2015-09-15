package action;

import entity.user;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

import util.hibernateUtil;

/**
 * Created by lazier on 2015/8/25 0025.
 */
public class login {


    public void login1() {

        //会话对象
        Session session = hibernateUtil.getSession();
        //开启事务
        Transaction transaction = session.beginTransaction();
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            String sql = String.format
                    ("select *  from `user` where `username` = '%s'", request.getParameter("lusername"));

            Query q = session.createSQLQuery(sql).addEntity(user.class);
            System.out.println("开始查询");
            List<user> u1 = q.list();
            HttpSession session1 = request.getSession();
            if (u1.size() != 0) {
                for (user u : u1) {
                    if (u.getPassword().equals(request.getParameter("lpassword"))) {
                        session1.setAttribute("user", u);
                        System.out.println("登入成功，欢迎" + u.getShowname());
                        response.setCharacterEncoding("utf8");
                        response.setContentType("text/html; charset=utf8");
                        response
                                .getWriter()
                                .print(
                                        "<script language=javascript>alert('登入成功！');window.location.href='./';</script>");

                    } else {
                        System.out.println("登入失败1");
                        response.setCharacterEncoding("utf8");
                        response.setContentType("text/html; charset=utf8");
                        response
                                .getWriter()
                                .print(
                                        "<script language=javascript>alert('用户名不存在或密码错误！');window.location.href='./';</script>");

                    }
                }
            }
            System.out.println("登入失败2");


        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            transaction.commit();//提交事务
            hibernateUtil.closeSession(session);//关闭会话

            System.out.println("close session!");
        }
    }

    public String loginout() {

        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            HttpSession session1 = request.getSession();
            session1.setAttribute("user", null);
            session1.setAttribute("qqVisitor", false);

            response.setCharacterEncoding("utf8");
            response.setContentType("text/html; charset=utf8");
            response
                    .getWriter()
                    .print(
                            "<script language=javascript>alert('退出成功');window.location.href='./';</script>");


        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }

    //绑定qq号
    public String attachQQ() {
        //会话对象
        Session session = hibernateUtil.getSession();
        //开启事务
        Transaction transaction = session.beginTransaction();

        HttpServletRequest request = ServletActionContext.getRequest();
        try {
            HttpSession session1 = request.getSession();
            HttpServletResponse response = ServletActionContext.getResponse();
            String openid = session1.getAttribute("open_id").toString();
            String sid = session1.getAttribute("rid").toString();
            user u = (user) session.get(user.class, sid);
            u.setUsername(u.getQq());
            u.setOpen_id(openid);

            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "failure";
        } finally {
            transaction.commit();//提交事务
            hibernateUtil.closeSession(session);//关闭会话

            System.out.println("close session!");
        }
    }

    //登入时检测是否是绑定的QQ号
    public String checkQQ() {
        //会话对象
        Session session = hibernateUtil.getSession();
        //开启事务
        Transaction transaction = session.beginTransaction();
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            HttpSession session1 = request.getSession();
            String openid = session1.getAttribute("open_id").toString();
            String sql = String.format
                    ("select *  from `user` where `open_id` = '%s'", openid);


            Query q = session.createSQLQuery(sql).addEntity(user.class);
            List<user> u1 = q.list();
            System.out.println(session1.getAttribute("nickname"));
            if (u1.size() < 1) {
                session1.setAttribute("qqVisitor", true); //失败后作为qq游客
                return "failure";
            }
            for (user u : u1) {
                if (u.getOpen_id().equals(openid)) {
                    session1.setAttribute("user", u);
                }
            }
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "failure";
        } finally {
            transaction.commit();//提交事务
            hibernateUtil.closeSession(session);//关闭会话

            System.out.println("close session!");
        }
    }

}
