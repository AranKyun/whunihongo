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
import java.util.ArrayList;
import java.util.List;
import util.hibernateUtil;
/**
 * Created by lazier on 2015/9/21 0021.
 */
public class query {

    public String querybyid(){
        Session session=hibernateUtil.getSession();
        //开启事务
        Transaction transaction = session.beginTransaction();
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session1 = request.getSession();
            user u = (user)session.get(user.class, request.getParameter("seekbyid"));
            session1.setAttribute("userbyid",u);
            transaction.commit();
            return "success";
        }
        catch(Exception e){
            e.printStackTrace();
            return "failure";
        }
        finally {
            hibernateUtil.closeSession(session);//关闭会话

            System.out.println("seekbyid session close!");
        }
    }
    public String querybyphone(){
        Session session=hibernateUtil.getSession();
        //开启事务
        Transaction transaction = session.beginTransaction();
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session1 = request.getSession();
            String sql=String.format
                    ("select *  from `user` where `phone` = '%s'", request.getParameter("seekbyphone"));
            Query q=session.createSQLQuery(sql).addEntity(user.class);
            List<user> u=q.list();
            for(user u1 :u) {
                System.out.println("对应的学生是" +u1.getRealname());
            }
            session1.setAttribute("userbyphone",u);
            transaction.commit();
            return "success";
        }
        catch(Exception e){
            e.printStackTrace();
            return "failure";
        }
        finally {
            hibernateUtil.closeSession(session);//关闭会话

            System.out.println("seekbyphone session close!");
        }
    }
    public String update(){
        Session session=hibernateUtil.getSession();
        //开启事务
        Transaction transaction = session.beginTransaction();
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session1 = request.getSession();
//            String sql=String.format
//                    ("select *  from `user` where `stu_Id` = '%s'", request.getParameter("sid"));
//            Query q=session.createSQLQuery(sql).addEntity(user.class);
            user u = (user)session.get(user.class,request.getParameter("sid"));
                u.setStu_id(request.getParameter("sid"));
                u.setRealname(request.getParameter("rname"));
                u.setMajor(request.getParameter("major"));
                u.setGender(request.getParameter("gender"));
                u.setQq(request.getParameter("qq"));
                u.setPhone(request.getParameter("phone"));
            u.setPaid(request.getParameter("paid").equals("1"));
                session.update(u);

//            session1.setAttribute("userbyid", u);

                transaction.commit();//提交事务



            return "success";
        }catch(Exception e){
            e.printStackTrace();
            return "failure";
        }
        finally {
            hibernateUtil.closeSession(session);//关闭会话

            System.out.println("seekbyphone session close!");
        }
    }
}
