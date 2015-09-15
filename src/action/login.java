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

        //�Ự����
        Session session = hibernateUtil.getSession();
        //��������
        Transaction transaction = session.beginTransaction();
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            String sql = String.format
                    ("select *  from `user` where `username` = '%s'", request.getParameter("lusername"));

            Query q = session.createSQLQuery(sql).addEntity(user.class);
            System.out.println("��ʼ��ѯ");
            List<user> u1 = q.list();
            HttpSession session1 = request.getSession();
            if (u1.size() != 0) {
                for (user u : u1) {
                    if (u.getPassword().equals(request.getParameter("lpassword"))) {
                        session1.setAttribute("user", u);
                        System.out.println("����ɹ�����ӭ" + u.getShowname());
                        response.setCharacterEncoding("utf8");
                        response.setContentType("text/html; charset=utf8");
                        response
                                .getWriter()
                                .print(
                                        "<script language=javascript>alert('����ɹ���');window.location.href='./';</script>");

                    } else {
                        System.out.println("����ʧ��1");
                        response.setCharacterEncoding("utf8");
                        response.setContentType("text/html; charset=utf8");
                        response
                                .getWriter()
                                .print(
                                        "<script language=javascript>alert('�û��������ڻ��������');window.location.href='./';</script>");

                    }
                }
            }
            System.out.println("����ʧ��2");


        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            transaction.commit();//�ύ����
            hibernateUtil.closeSession(session);//�رջỰ

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
                            "<script language=javascript>alert('�˳��ɹ�');window.location.href='./';</script>");


        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }

    //��qq��
    public String attachQQ() {
        //�Ự����
        Session session = hibernateUtil.getSession();
        //��������
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
            transaction.commit();//�ύ����
            hibernateUtil.closeSession(session);//�رջỰ

            System.out.println("close session!");
        }
    }

    //����ʱ����Ƿ��ǰ󶨵�QQ��
    public String checkQQ() {
        //�Ự����
        Session session = hibernateUtil.getSession();
        //��������
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
                session1.setAttribute("qqVisitor", true); //ʧ�ܺ���Ϊqq�ο�
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
            transaction.commit();//�ύ����
            hibernateUtil.closeSession(session);//�رջỰ

            System.out.println("close session!");
        }
    }

}
