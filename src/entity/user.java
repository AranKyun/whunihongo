package entity;

/**
 * Created by lazier on 2015/8/24 0024.
 */
public class user {
    private String username="";
    private String password="";
    private String showname;
    private String realname;
    private  String gender;
    private String stu_id;
    private String department;
    private String phone;
    private String qq;
    private int score=0;

    public user(){}

    public user(String sname,String rname,String gend,String stu,String depar,String ph,String q){
       showname=sname;
        gender=gend;
        realname=rname;
        stu_id=stu;
        department=depar;
        phone=ph;
        qq=q;

    }
    public String getUsername() {
        return username;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
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
