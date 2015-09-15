<%@ page import="entity.user" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HEADER>
    <%
        session.setAttribute("operation", 1);
        user u1 = (user) session.getAttribute("user");

        if (u1 == null) {

            System.out.println("空用户！");
        } else {
            System.out.println("login user：" + u1.getShowname());
        }
    %>

    <script language="javascript" type="text/javascript">
        var code; //在全局 定义验证码
        function lcreateCode() {


            code = "";
            var codeLength = 4;//验证码的长度
            var checkCode = document.getElementById("lcheckCode");
            checkCode.value = "";
            var selectChar = new Array(2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');

            for (var i = 0; i < codeLength; i++) {
                var charIndex = Math.floor(Math.random() * 32);
                code += selectChar[charIndex];
            }
            if (code.length != codeLength) {
                lcreateCode();
            }
            lcheckCode.value = code;


        }

        function loginCheck() {

            var inputCode = document.getElementById("input2").value.toUpperCase();

            if (document.getElementById('lusernameid').value == "") {
                alert("用户名不能为空");
                return false;
            }
            if (document.getElementById('lpasswordid').value == "") {
                alert("密码不能为空");
                return false;
            }

            if (inputCode.length <= 0) {
                alert("请输入验证码！");
                return false;
            }
            else if (inputCode != code) {
                alert("验证码输入错误！");
                lcreateCode();
                return false;
            }
            return true;
        }
    </script>


    <div class='navbg'>
        <div class='container'>

            <nav class="navbar navbar-default">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class='navbar-brand' href='index.jsp' style="padding-top: 15px; padding-bottom: 0px;">
                            <img alt="Brand" src='images/icon.png' width='50px'/>
                        </a>

                        <p class="navbar-text"
                           style='color: #FFFFFF; font-size: 20px; margin-top: 12px; margin-bottom: 12px;'><font
                                face="Nico">武漢大学
                            <br>日本語クラブ</font>
                        </p>
                    </div>


                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <%
                            boolean isQQVisitor;
                            try{
                                isQQVisitor = session.getAttribute("qqVisitor").equals(true);
                            }
                            catch(Exception e){
                                isQQVisitor = false;
                            }


                            if (u1 != null) {
                                System.out.println("user log");
                                String realname = u1.getRealname();
                        %>
                        <ul class="nav navbar-nav navbar-right">

                            <li>
                                <A href=""><font size="+1">
                                    个人中心</font>
                                </A>
                            </li>

                            <li>
                                <a> <font size="+1"><%=realname%>，您好！</font></a>
                            </li>

                            <li>
                                <A href="logout.action"> <font size="+1">退出</font></A>
                            </li>
                        </ul>


                        <%
                        } else if (isQQVisitor == true) { //如果qq暂时登录
                        %>
                        <ul class="nav navbar-nav navbar-right">

                            <li>
                                <A href=""><font size="+1">
                                    个人中心</font>
                                </A>
                            </li>

                            <li>
                                <a> <font size="+1"><%=session.getAttribute("nickname")%>，您好！</font></a>
                            </li>

                            <li>
                                <A href="logout.action"> <font size="+1">退出</font></A>
                            </li>
                        </ul>
                        <%

                        } else { //如果没有用户登录


                        %>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="register.jsp"> <font size="+1" face='Nico'>入会</font>
                                    <br>报名</a>
                            </li>
                            <li id="userLogin">
                                <a href="#">
                                    <font size="+1" face='Nico'>会員ログイン</font>
                                    <br>会员登录</a>
                            </li>
                        </ul>

                        <%
                            }
                        %>
                    </div>

                    <!-- /.navbar-collapse --> </div>
                <!-- /.container-fluid --> </nav>
        </div>
    </div>

    <%--登录弹出框--%>
    <div class="modal fade" id="loginModal" tabindex="-2" role="dialog" style="margin-top:30px; padding:0 30px;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">用户登录</h4>
                </div>
                <div class="modal-body">
                    <%--登录的表单--%>
                    <form class="form-horizontal" role="form" action="login!login1.action" onsubmit="return loginCheck()" method="post">

                        <div class="form-group">
                            <label for="lusernameid" class="col-sm-3 control-label">账　号</label>

                            <div class="col-sm-7">
                                <input type="text" name="lusername" id="lusernameid" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">密　码</label>

                            <div class="col-sm-7 ">
                                <input type="password" name="lpassword" id="lpasswordid" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="input2">验证码</label>

                            <div class="col-sm-4">
                                <input type="text" id="input2" class="form-control" placeholder="">
                            </div>
                            <div class="col-md-3">
                                <input type="text" id="lcheckCode" class="form-control text-center" style="font-size:1.4em"
                                       readonly="readonly" oncontextmenu="return false" onclick="lcreateCode()">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3 col-sm-offset-3">
                                <div class="checkbox">
                                    <label style="font-size:0.8em">
                                        <input name="passerby" type="hidden" id="passerby" value="passerby"/>

                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="checkbox">
                                    <label style="font-size:0.8em">
                                        忘记密码？<a href="forgetPassword.jsp">找回密码</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-3">
                                <button type="submit" class="btn btn-success btn-block"><strong><font size="+1">登　录</font></strong></button>

                            </div>

                            <%
                                String Sapp_id = "101225709";
                                String Sapp_secret = "d36c04b79ddfc2503a5ff09aa994aba3";
                                String Smy_url = "http://whunihongo.azurewebsites.net/test.jsp";

                                String code = UUID.randomUUID().toString();
                                session.setAttribute("state", code);
                                String dialog_url = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=" + Sapp_id + "&redirect_uri=" + URLEncoder.encode(Smy_url) + "&state=" + code;

                            %>
                            <a href="<%=dialog_url%>" ><img src="http://qzonestyle.gtimg.cn/qzone/vas/opensns/res/img/Connect_logo_5.png" height="39px" class="qq-link"/></a>


                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#userLogin").click(function () {
            $("#loginModal").modal("show");
            lcreateCode();

        });


    </script>
</HEADER>