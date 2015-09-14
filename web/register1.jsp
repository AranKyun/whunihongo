<%@ page contentType="text/html;charset=utf-8" %>


<html>
<head>
    <%@ include file='head.jsp' %>

</head>
<body>
<%@ include file='navbar.jsp' %>
<div class="container bottom-padded">
    <div class="row">
        <div class="col-md-4 top-padded  hidden-sm hidden-xs">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>注册新账号 或者 QQ登陆 或者 跳过</h4>
                </div>
                <div class="panel-body">
                    <p>　　这是为了让你有管理你的会员信息与会员积分的权限。你可以注册一个新账号，也可以直接绑定你的QQ来登陆。如果你实在觉得不必，可以选择跳过。</p>
                </div>
            </div>

        </div>

        <script language="javascript" type="text/javascript">


            function register1Check() {

                var value = true;

                if ($("#inputUsername").val() == "") {
                    $("#inputUsernameError").text("请输入用户名！");
                    $("#inputUsername").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else {
                    $("#inputUsernameError").text("");
                    $("#inputUsername").parent().parent().attr("class", "form-group");
                }
                if ($("#inputPassword").val() == "") {
                    $("#inputPasswordError").text("请输入密码！");
                    $("#inputPassword").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else if (!$("#inputPassword").val().match(/^.{6,10}$/)) {
                    $("#inputPasswordError").text("密码不能少于6位！");
                    $("#inputPassword").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else {
                    $("#inputPasswordError").text("");
                    $("#inputPassword").parent().parent().attr("class", "form-group");
                }
                if ($("#inputCheckPassword").val() == "") {
                    $("#inputCheckPasswordError").text("请再次输入密码！");
                    $("#inputCheckPassword").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else if ($("#inputCheckPassword").val() != $("#inputPassword").val()) {
                    $("#inputCheckPasswordError").text("两次输入的密码不符！");
                    $("#inputCheckPassword").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else {
                    $("#inputCheckPasswordError").text("");
                    $("#inputCheckPassword").parent().parent().attr("class", "form-group");
                }

                if(value == true){
                    var pw_sha1 = $.md5($("#inputPassword").val());
                    $("#inputPassword").val(pw_sha1);
                    $("#inputCheckPassword").val(pw_sha1);
                }


                return value;
            }

            function confirmSkip() {
                var v = confirm("你真的要跳过吗？如果之后想要找回该账户，请与QQ群的管理员联系。");
                if (v == true) {

                    window.location.href='register2.jsp';
                }
            }


        </script>

        <div class="col-md-8">
            <div class="page-header row text-center">
                <div class="hidden-xs col-sm-4">
                    <h2>
                        <small>资料填写</small>
                    </h2>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <h2>设置账号</h2>
                </div>
                <div class="hidden-xs col-sm-4">
                    <h2>
                        <small>完成注册</small>
                    </h2>
                </div>
            </div>

            <%--<div class="col-md-8">--%>
            <%--<div class="page-header row text-center">--%>
            <%--<div class="col-sm-4">--%>
            <%--<h2>资料填写</h2>--%>
            <%--</div>--%>
            <%--<div class="col-sm-4">--%>
            <%--<h2>--%>
            <%--<small>设置账号</small>--%>
            <%--</h2>--%>
            <%--</div>--%>
            <%--<div class="col-sm-4">--%>
            <%--<h2>--%>
            <%--<small>完成注册</small>--%>
            <%--</h2>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%
                //        String Sapp_id = "101225709";
//        String Sapp_secret = "d36c04b79ddfc2503a5ff09aa994aba3";
//        String Smy_url = "http://whunihongo.azurewebsites.net/test.jsp";
//
//        String code = UUID.randomUUID().toString();
//        session.setAttribute("state", code);
//        String dialog_url = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=" + Sapp_id + "&redirect_uri=" + URLEncoder.encode(Smy_url) + "&state=" + code;
                session.setAttribute("operation",2);
                System.out.println("myurl:"+dialog_url);
            %>

            <div class="panel panel-primary visible-sm-block visible-xs-block">
                <div class="panel-heading">
                    <p>这将使你能够管理会员账户，你可以选择以下两种方式 或者 跳过本步骤。</p>
                </div>
            </div>
            <p>　　使用QQ账号来登陆：<a class="bg-blue" href="<%=dialog_url%>">绑定你的QQ号码</a></p>

            <p>　　或者，注册一个新账号：</p>

            <form action="register1.action" class="form-horizontal" method="post" onsubmit="return register1Check()">
                <div class="form-group">
                    <label for="inputUsername" class="col-sm-2 control-label" name="username">用户名</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="inputUsername" placeholder="请输入用户名"
                               name="username"/></div>
                    <div class="col-sm-4">
                        <p class="form-control-static" id="inputUsernameError"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">密码</label>

                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码"
                               name="password"/>
                    </div>
                    <div class="col-sm-4">
                        <p class="form-control-static" id="inputPasswordError"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputCheckPassword" class="col-sm-2 control-label">确认密码</label>

                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="inputCheckPassword" placeholder="请再次输入密码"></div>
                    <div class="col-sm-4">
                        <p class="form-control-static" id="inputCheckPasswordError"></p>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">注册新账号</button>
                        <span>　　或者：</span>
                        <button class="btn btn-default" type="button" onclick="confirmSkip()">跳过本步骤</button>
                    </div>

                </div>

            </form>

        </div>
    </div>
</div>

<%@ include file='footer.jsp' %>

</body>
</html>