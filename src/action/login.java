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
import javax.servlet.http.HttpSession;
/**
 * Created by lazier on 2015/8/25 0025.
 */
public class login {
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction transaction;
    Configuration config = new Configuration().configure();
    //��������ע�����
    ServiceRegistry service = new ServiceRegistryBuilder().applySettings(config.getProperties()).buildServiceRegistry();
    public String login1(){
        sessionFactory = config.buildSessionFactory(service);
        //�Ự����
        session = sessionFactory.openSession();
        //��������
        transaction = session.beginTransaction();
        try{


            return "success";
        }
        catch(Exception e){
            return "failure";
        }
    }
    public String loginout(){
        sessionFactory = config.buildSessionFactory(service);
        //�Ự����
        session = sessionFactory.openSession();
        //��������
        transaction = session.beginTransaction();
        try{


            return "success";
        }
        catch(Exception e){
            return "failure";
        }
    }
}
