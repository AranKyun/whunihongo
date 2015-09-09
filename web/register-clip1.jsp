<%@ page contentType="text/html;charset=utf-8" %>
<script language="javascript" type="text/javascript">


    function register1Check() {


            if (document.getElementById('inputUsername').value == "") {
                alert("汝之名尚未赋予！");
                return false;
            }
            if (document.getElementById('inputPassword').value == "") {
                alert("密码不能为空！");
                return false;
            }
        if (document.getElementById('inputCheckPassword').value != document.getElementById('inputPassword').value) {
            alert("两次输入密码不一致！");
            return false;
        }

        return true;
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
    <h3>注册新账号&nbsp;&nbsp;&nbsp;&nbsp;丨&nbsp;&nbsp;&nbsp;&nbsp;<a href="register2.jsp" >直接使用qq登入</a></h3>
    <form action="register1.action" class="form-horizontal" method="post" onsubmit="return register1Check()">
        <div class="form-group">
            <label for="inputUsername" class="col-sm-2 control-label" name="username">用户名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputUsername" placeholder="请输入用户名" name="username"/></div>
            <div class="col-sm-4">
                <p class="form-control-static"></p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label" >密码</label>
            <div class="col-sm-6">
                <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码" name="password"/></div>
            <div class="col-sm-4">
                <p class="form-control-static"></p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputCheckPassword" class="col-sm-2 control-label">确认密码</label>
            <div class="col-sm-6">
                <input type="password" class="form-control" id="inputCheckPassword" placeholder="请再次输入密码"></div>
            <div class="col-sm-4">
                <p class="form-control-static"></p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">注册新账号</button>
            </div>

        </div>

    </form>

</div>