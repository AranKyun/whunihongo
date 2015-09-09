<%@ page contentType="text/html;charset=utf-8" %>

<%--<div class="col-md-8">--%>
    <%--<div class="page-header row text-center">--%>
        <%--<div class="hidden-xs col-sm-4">--%>
            <%--<h2>--%>
                <%--<small>资料填写</small>--%>
            <%--</h2>--%>
        <%--</div>--%>
        <%--<div class="col-xs-12 col-sm-4">--%>
            <%--<h2>设置账号</h2>--%>
        <%--</div>--%>
        <%--<div class="hidden-xs col-sm-4">--%>
            <%--<h2>--%>
                <%--<small>完成注册</small>--%>
            <%--</h2>--%>
        <%--</div>--%>
    <%--</div>--%>
<script language="javascript" type="text/javascript">


    function register2Check() {

        var value = true;

        if (document.getElementById('inputName').value == "") {
            $("#inputNameError").text("请输入昵称！");
            $("#inputName").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else{
            $("#inputNameError").text("");
            $("#inputName").parent().parent().attr("class", "form-group");
        }

        if (document.getElementById('inputRealname').value == "") {
            $("#inputRealnameError").text("请输入真实姓名！");
            $("#inputRealname").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else{
            $("#inputRealnameError").text("");
            $("#inputRealname").parent().parent().attr("class", "form-group");
        }

        if (document.getElementById('inputID').value == "") {
            $("#inputIDError").text("请输入学号！");
            $("#inputID").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else if(!$("#inputID").val().match(/^\d{13}$/)){
            $("#inputIDError").text("你输入的学号格式不正确！");
            $("#inputID").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else{
            $("#inputIDError").text("");
            $("#inputID").parent().parent().attr("class", "form-group");
        }

        if (document.getElementById('inputTel').value == "") {
            $("#inputTelError").text("请输入手机号码！");
            $("#inputTel").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else if(!$("#inputTel").val().match(/^\d{11}$/)){
            $("#inputTelError").text("你输入的手机号码格式不正确！");
            $("#inputTel").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else{
            $("#inputTelError").text("");
            $("#inputTel").parent().parent().attr("class", "form-group");
        }
        if (document.getElementById('inputQQ').value == "") {
            $("#inputQQError").text("请输入QQ号码！");
            $("#inputQQ").parent().parent().attr("class", "form-group has-error");
            value = false;
        }
        else{
            $("#inputQQError").text("");
            $("#inputQQ").parent().parent().attr("class", "form-group");
        }
        return value;
    }



</script>
<div class="col-md-8">
    <div class="page-header row text-center">
        <div class="col-sm-4">
            <h2>资料填写</h2>
        </div>
        <div class="col-sm-4">
            <h2>
                <small>设置账号</small>
            </h2>
        </div>
        <div class="col-sm-4">
            <h2>
                <small>完成注册</small>
            </h2>
        </div>
    </div>
    <form action="register.action" class="form-horizontal" method="post" onsubmit="return register2Check()">
        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">昵称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputName" name="showname" placeholder="展示给他人的社交名称，可修改"></div>
            <div class="col-sm-4">
                <p class="form-control-static" id="inputNameError"></p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputRealname" class="col-sm-2 control-label">真实姓名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputRealname" name="realname" placeholder="请如实填写，不可修改"></div>
            <div class="col-sm-4">
                <p class="form-control-static" id="inputRealnameError"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <label class="radio-inline">
                    <input type="radio" name="gender" id="inlineRadio1" value="保密" checked="checked">保密</label>
                <label class="radio-inline">
                    <input type="radio" name="gender" id="inlineRadio2" value="男">男</label>
                <label class="radio-inline">
                    <input type="radio" name="gender" id="inlineRadio3" value="女">女</label>
            </div>
        </div>
        <div class="form-group">
            <label for="inputID" class="col-sm-2 control-label">学号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputID" name="stu_id" placeholder="请输入13位武汉大学学号"></div>
            <div class="col-sm-4">
                <p class="form-control-static" id="inputIDError"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-12 col-sm-2 control-label">学部与院系</label>
            <div class="col-xs-6 col-sm-3">
                <select class="form-control" name="department" id="depart">
                    <option value="文理学部">文理学部</option>
                    <option value="工学部">工学部</option>
                    <option value="信息学部">信息学部</option>
                    <option value="医学部">医学部</option>
                </select>    
            </div>
            <div class="col-xs-6 col-sm-3">
                <select class="form-control">
                </select>    
            </div>
            <div class="col-xs-12 col-sm-4">
                <p class="form-control-static" id="inputSelSchoolError"></p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputTel" class="col-sm-2 control-label">手机号码</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="phone" id="inputTel" placeholder="这是我们与你联系的重要方式"></div>
            <div class="col-sm-4">
                <p class="form-control-static" id="inputTelError"></p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputQQ" class="col-sm-2 control-label">QQ号</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputQQ" name="qq" placeholder="我们会将你拉入会员QQ群中"></div>
            <div class="col-sm-4">
                <p class="form-control-static" id="inputQQError"></p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">提交资料</button>
            </div>
        </div>
    </form>
</div>