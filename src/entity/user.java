package entity;

import java.util.Date;

/**
 * Created by lazier on 2015/8/24 0024.
 */
public class user {
    private String username = "";
    private String password = "";
    private String showname;
    private String realname;
    private String gender;
    private String stu_id;
    private String phone;
    private String qq;
    private String open_id = "";
    private String major;
    private Date register_date;
    private int role=1;
    private boolean paid = false;

    public user() {
    }

    public user(String sname, String rname, String gend, String stu, String ph, String q, String m, Date d) {
        showname = sname;
        gender = gend;
        realname = rname;
        stu_id = stu;
        phone = ph;
        qq = q;
        major = m;
        register_date = d;
    }

    public boolean getPaid(){return paid;}

    public void setPaid(boolean b){this.paid = paid;}


    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Date getRegister_date() {
        return register_date;
    }

    public void setRegister_date(Date d) {
        register_date = d;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getOpen_id() {
        return open_id;
    }

    public void setOpen_id(String open_id) {
        this.open_id = open_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getShowname() {
        return showname;
    }

    public void setShowname(String showname) {
        this.showname = showname;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStu_id() {
        return stu_id;
    }

    public void setStu_id(String stu_id) {
        this.stu_id = stu_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }
}
