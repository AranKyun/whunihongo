<%@ page contentType="text/html;charset=utf-8" %>
<script language="javascript" type="text/javascript">


    function register1Check(){

        var value = true;

        if($("#inputUsername").val() == ""){
            $("#inputUsernameError").text("请输入用户名！");
            $("#inputUsername").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else{
            $("#inputUsernameError").text("");
            $("#inputUsername").parent().parent().attr("class", "form-group");
        }
        if($("#inputPassword").val() == ""){
            $("#inputPasswordError").text("请输入密码！");
            $("#inputPassword").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else if(!$("#inputPassword").val().match(/^.{6,10}$/)){
            $("#inputPasswordError").text("密码不能少于6位！");
            $("#inputPassword").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else{
            $("#inputPasswordError").text("");
            $("#inputPassword").parent().parent().attr("class", "form-group");
        }
        if($("#inputCheckPassword").val() == ""){
            $("#inputCheckPasswordError").text("请再次输入密码！");
            $("#inputCheckPassword").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else if($("#inputCheckPassword").val() != $("#inputPassword").val()) {
            $("#inputCheckPasswordError").text("两次输入的密码不符！");
            $("#inputCheckPassword").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else{
            $("#inputCheckPasswordError").text("");
            $("#inputCheckPassword").parent().parent().attr("class", "form-group");
        }


        return value;
    }

    function confirmSkip(){
        var v = confirm("你真的要跳过吗？如果之后想要找回该账户，请与QQ群的管理员联系。");
        if(v == true){
            alert("敬请期待！");
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
    <p>　　你可以注册一个账号或者<a class="bg-blue"> 绑定你的QQ号码 </a>来管理你的会员信息与积分。</p>
    <p>　　本步骤可以跳过，但我们还是强烈建议你选择一种方法来管理你的账号。</p>

    <form action="register1.action" class="form-horizontal" method="post" onsubmit="return register1Check()">
        <div class="form-group">
            <label for="inputUsername" class="col-sm-2 control-label" name="username">用户名</label>

            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputUsername" placeholder="请输入用户名" name="username"/></div>
            <div class="col-sm-4">
                <p class="form-control-static" id="inputUsernameError"></p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">密码</label>

            <div class="col-sm-6">
                <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码" name="password"/>
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
                <button class="btn btn-default" type="button" onclick="confirmSkip()">跳过本步骤</button>
            </div>

        </div>

    </form>

</div>