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

/**
 * Created by lazier on 2015/8/25 0025.
 */
public class login {
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction transaction;
    Configuration config = new Configuration().configure();
    //创建服务注册对象
    ServiceRegistry service = new ServiceRegistryBuilder().applySettings(config.getProperties()).buildServiceRegistry();
    public void login1(){
        sessionFactory = config.buildSessionFactory(service);
        //会话对象
        session = sessionFactory.openSession();
        //开启事务
        transaction = session.beginTransaction();
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            String sql=String.format
                    ("select *  from `user` where `username` = '%s'", request.getParameter("lusername"));

            Query q=session.createSQLQuery(sql).addEntity(user.class);
            System.out.println("开始查询");
            List<user> u1=q.list();
            HttpSession session1 = request.getSession();
           if(u1.size()!=0) {
                for(user u:u1){
                    if(u.getPassword().equals(request.getParameter("lpassword"))){
                        session1.setAttribute("user",u);
                        System.out.println("登入成功，欢迎" + u.getShowname());
                        response.setCharacterEncoding("utf8");response.setContentType("text/html; charset=utf8");
                        response
                                .getWriter()
                                .print(
                                        "<script language=javascript>alert('登入成功！');window.location.href='./';</script>");

                    }
                    else{
                        System.out.println("登入失败1");
                        response.setCharacterEncoding("utf8");response.setContentType("text/html; charset=utf8");
                        response
                                .getWriter()
                                .print(
                                        "<script language=javascript>alert('用户名不存在或密码错误！');window.location.href='./';</script>");

                    }
           }
        }
            System.out.println("登入失败2");



        }
        catch(Exception e){
            e.printStackTrace();

        }
        finally {
            transaction.commit();//提交事务
            session.close();//关闭会话
            sessionFactory.close();//关闭会话工厂
            System.out.println("close session!");
        }
    }
    public void loginout(){
//        sessionFactory = config.buildSessionFactory(service);
//        //会话对象
//        session = sessionFactory.openSession();
//        //开启事务
//        transaction = session.beginTransaction();
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            HttpSession session1 = request.getSession();
            session1.removeAttribute("user");

            response.setCharacterEncoding("utf8");response.setContentType("text/html; charset=utf8");
            response
                    .getWriter()
                    .print(
                            "<script language=javascript>alert('退出成功');window.location.href='./';</script>");


        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    //绑定qq号
    public String attachQQ(){
        sessionFactory = config.buildSessionFactory(service);
        //会话对象
        session = sessionFactory.openSession();
        //开启事务
        transaction = session.beginTransaction();HttpServletRequest request = ServletActionContext.getRequest();
       try{
           HttpSession session1 = request.getSession();
           HttpServletResponse response = ServletActionContext.getResponse();
           String openid=session1.getAttribute("open_id").toString();
        String sid=session1.getAttribute("rid").toString();
        user u=(user)session.get(user.class,sid);
        u.setUsername(u.getQq());
           u.setOpen_id(openid);

           response.setCharacterEncoding("utf-8");
           response.setContentType("text/html; charset=utf8");
           response
                   .getWriter()
                   .print(
                           "<script language=javascript>alert('绑定成功！');window.location.href='index.jsp';</script>");
       return  "success";
       }
       catch (Exception e){
       e.printStackTrace();
           return "failure";
       }
       finally {
           transaction.commit();//提交事务
           session.close();//关闭会话
           sessionFactory.close();//关闭会话工厂
           System.out.println("close session!");
       }
    }

    //登入时检测是否是绑定的QQ号
    public String checkQQ(){
        sessionFactory = config.buildSessionFactory(service);
        //会话对象
        session = sessionFactory.openSession();
        //开启事务
        transaction = session.beginTransaction();
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            HttpSession session1 = request.getSession();
            String openid=session1.getAttribute("open_id").toString();
            String sql=String.format
                    ("select *  from `user` where `open_id` = '%s'",openid);


            Query q=session.createSQLQuery(sql).addEntity(user.class);
            List<user> u1=q.list();
            if(u1.size()<1){
            return "failure";}
            for(user u:u1){
                if( u.getOpen_id().equals(openid)){
                    session1.setAttribute("user",u);
                }
            }
            return "success";
        }
        catch(Exception e){
            e.printStackTrace();
            return "failure";
        }
        finally {
            transaction.commit();//提交事务
            session.close();//关闭会话
            sessionFactory.close();//关闭会话工厂
            System.out.println("close session!");
        }
    }

}
