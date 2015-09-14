package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * Created by lazier on 2015/9/14 0014.
 */
public class hibernateUtil {
    private static SessionFactory sessionFactory;
    private static Session session;
    static {
        //����configuration���󣬶�ȡhibernate.cfg.xml�ļ�����ɳ�ʼ��
        Configuration config = new Configuration().configure();
        ServiceRegistry service = new ServiceRegistryBuilder().applySettings(config.getProperties()).buildServiceRegistry();
        sessionFactory = config.buildSessionFactory(service);
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }


    public static Session getSession() {
        session=sessionFactory.openSession();
        return session;
    }

 //�ر�session
    public static void closeSession(Session session){
        if(session!=null){
            session.close();
        }
    }
}
