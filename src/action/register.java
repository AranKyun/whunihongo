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

/**
 * Created by lazier on 2015/8/24 0024.
 */
public class register {
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction transaction;
    Configuration config = new Configuration().configure();
    //��������ע�����
    ServiceRegistry service = new ServiceRegistryBuilder().applySettings(config.getProperties()).buildServiceRegistry();
    user u = new user();

    public String register1() throws IOException {

        //�����Ự��������
        sessionFactory = config.buildSessionFactory(service);
        //�Ự����
        session = sessionFactory.openSession();
        //��������
        transaction = session.beginTransaction();

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session1 = request.getSession();
        session1.setAttribute("rid",request.getParameter("stu_id"));



       try {
            u = new user(request.getParameter("showname"), request.getParameter("realname"),
                   request.getParameter("gender"), request.getParameter("stu_id"), request.getParameter("department"), request.getParameter("phone"), request.getParameter("qq"),request.getParameter("major"));
        System.out.println("stuid is��" + request.getParameter("stu_id"));

           session.save(u);

        return "success";
       }
       catch (Exception e){
           response.setCharacterEncoding("utf8");response.setContentType("text/html; charset=utf8");
           response
                   .getWriter()
                   .print(
                           "<script language=javascript>alert('ѧ���ѱ�ע�ᣡ');window.location.href='register.jsp';</script>");
         return null;
        }
       finally {
           transaction.commit();//�ύ����
           session.close();//�رջỰ
           sessionFactory.close();//�رջỰ����
           System.out.println("close session!");
       }
    }
    public String register2(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session1 = request.getSession();


        sessionFactory = config.buildSessionFactory(service);
        //�Ự����
        session = sessionFactory.openSession();
        //��������
        transaction = session.beginTransaction();

        try {
          String rid=session1.getAttribute("rid").toString();
            u = (user)session.load(user.class,rid);
            u.setUsername(request.getParameter("username"));
            u.setPassword(request.getParameter("password"));
            System.out.println("��õ�user��naem�ǣ�" + u.getRealname());
            session.update(u);

            return "success";
        }
        catch (Exception e){
            return null;
        }
        finally {
            transaction.commit();//�ύ����
            session.close();//�رջỰ
            sessionFactory.close();//�رջỰ����
            System.out.println("close session!");
        }
    }
}
