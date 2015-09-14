<%@ page contentType="text/html;charset=utf-8" %>


<html>
<head>
    <%@ include file='head.jsp' %>
</head>
<body>
<%@ include file='navbar.jsp' %>


<div class="container bottom-padded">
    <div class="row">
        <div class="col-md-4 top-padded hidden-sm hidden-xs">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>请如实填写以下信息</h4>
                </div>
                <div class="panel-body">
                    <p>　　这些信息将作为你的会员资料，其实手机号与QQ号更是我们与你联系的重要途径。为了能够及时将我们的新活动通知给你，请不要填写错误。</p>
                </div>
            </div>
        </div>

        <script language="javascript" type="text/javascript">


            function register2Check() {

                var value = true;

                if (document.getElementById('inputName').value == "") {
                    $("#inputNameError").text("请输入昵称！");
                    $("#inputName").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else {
                    $("#inputNameError").text("");
                    $("#inputName").parent().parent().attr("class", "form-group");
                }

                if (document.getElementById('inputRealname').value == "") {
                    $("#inputRealnameError").text("请输入真实姓名！");
                    $("#inputRealname").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else {
                    $("#inputRealnameError").text("");
                    $("#inputRealname").parent().parent().attr("class", "form-group");
                }

                if (document.getElementById('inputID').value == "") {
                    $("#inputIDError").text("请输入学号！");
                    $("#inputID").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else if (!$("#inputID").val().match(/^\d{13}$/)) {
                    $("#inputIDError").text("你输入的学号格式不正确！");
                    $("#inputID").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else {
                    $("#inputIDError").text("");
                    $("#inputID").parent().parent().attr("class", "form-group");
                }

                if (document.getElementById('inputTel').value == "") {
                    $("#inputTelError").text("请输入手机号码！");
                    $("#inputTel").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else if (!$("#inputTel").val().match(/^\d{11}$/)) {
                    $("#inputTelError").text("你输入的手机号码格式不正确！");
                    $("#inputTel").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else {
                    $("#inputTelError").text("");
                    $("#inputTel").parent().parent().attr("class", "form-group");
                }
                if (document.getElementById('inputQQ').value == "") {
                    $("#inputQQError").text("请输入QQ号码！");
                    $("#inputQQ").parent().parent().attr("class", "form-group has-error");
                    value = false;
                }
                else {
                    $("#inputQQError").text("");
                    $("#inputQQ").parent().parent().attr("class", "form-group");
                }

                return value;

            }


            function secondSelect(index) {
                if (index == 0) {
                    $("#school").html("<option value='101'>哲学学院</option><option value='102'>国学院</option><option value='103'>文学院</option><option value='104'>外国语言文学学院</option><option value='105'>新闻与传播学院</option><option value='106'>艺术学系</option><option value='107'>历史学院</option><option value='108'>经济与管理学院</option><option value='109'>法学院</option><option value='110'>马克思主义学院</option><option value='111'>社会学系</option><option value='112'>政治与公共管理学院</option><option value='113'>教育科学研究院</option><option value='114'>信息管理学院</option><option value='115'>国际教育学院</option><option value='116'>数学与统计学院</option><option value='117'>物理科学与技术学院</option><option value='118'>化学与分子科学学院</option><option value='119'>生命科学学院</option><option value='120'>资源与环境科学学院</option>");
                }
                else if (index == 1) {
                    $("#school").html("<option value='201'>动力与机械学院</option><option value='202'>电气工程学院</option><option value='203'>城市设计学院</option><option value='204'>土木建筑工程学院</option><option value='205'>水利水电学院</option>");
                }
                else if (index == 2) {
                    $("#school").html("<option value='301'>电子信息学院</option><option value='302'>计算机学院</option><option value='303'>国际软件学院</option><option value='304'>测绘学院</option><option value='305'>遥感信息工程学院</option><option value='306'>印刷与包装系</option>");

                }
                else if (index == 3) {
                    $("#school").html("<option value='401'>基础医学院</option><option value='402'>公共卫生学院</option><option value='403'>第一临床学院</option><option value='404'>第二临床学院</option><option value='405'>口腔医学院</option><option value='406'>HOPE护理学院</option><option value='407'>药学院</option><option value='408'>医学职业技术学院</option>");
                }
            }


        </script>
        <div class="col-md-8">
            <div class="page-header row text-center">
                <div class="col-xs-12 col-sm-4">
                    <h2>资料填写</h2>
                </div>
                <div class="hidden-xs col-sm-4">
                    <h2>
                        <small>设置账号</small>
                    </h2>
                </div>
                <div class="hidden-xs col-sm-4">
                    <h2>
                        <small>完成注册</small>
                    </h2>
                </div>
            </div>
            <div class="panel panel-primary visible-sm-block visible-xs-block">
                <div class="panel-heading">
                    <p>手机号与QQ号是我们与你联系的重要途径。为了能够及时将我们的新活动通知给你，请不要填写错误。</p>
                </div>
            </div>
            <form action="register.action" class="form-horizontal" method="post" onsubmit="return register2Check()">
                <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">昵称</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="inputName" name="showname"
                               placeholder="展示给他人的社交名称，可修改"></div>
                    <div class="col-sm-4">
                        <p class="form-control-static" id="inputNameError"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputRealname" class="col-sm-2 control-label">真实姓名</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="inputRealname" name="realname"
                               placeholder="请如实填写，不可修改"></div>
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
                        <input type="text" class="form-control" id="inputID" name="stu_id" placeholder="请输入13位武汉大学学号">
                    </div>
                    <div class="col-sm-4">
                        <p class="form-control-static" id="inputIDError"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-2 control-label">学部与院系</label>

                    <div class="col-xs-6 col-sm-3">
                        <select class="form-control" name="department" id="depart"
                                onchange="secondSelect(this.selectedIndex)">
                            <option>文理学部</option>
                            <option>工学部</option>
                            <option>信息学部</option>
                            <option>医学部</option>
                        </select>
                    </div>
                    <div class="col-xs-6 col-sm-3">
                        <select class="form-control" id="school">
                            <option value='101'>哲学学院</option>
                            <option value='102'>国学院</option>
                            <option value='103'>文学院</option>
                            <option value='104'>外国语言文学学院</option>
                            <option value='105'>新闻与传播学院</option>
                            <option value='106'>艺术学系</option>
                            <option value='107'>历史学院</option>
                            <option value='108'>经济与管理学院</option>
                            <option value='109'>法学院</option>
                            <option value='110'>马克思主义学院</option>
                            <option value='111'>社会学系</option>
                            <option value='112'>政治与公共管理学院</option>
                            <option value='113'>教育科学研究院</option>
                            <option value='114'>信息管理学院</option>
                            <option value='115'>国际教育学院</option>
                            <option value='116'>数学与统计学院</option>
                            <option value='117'>物理科学与技术学院</option>
                            <option value='118'>化学与分子科学学院</option>
                            <option value='119'>生命科学学院</option>
                            <option value='120'>资源与环境科学学院</option>
                        </select>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <p class="form-control-static" id="inputSelSchoolError"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputTel" class="col-sm-2 control-label">手机号码</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="phone" id="inputTel" placeholder="这是我们与你联系的重要方式">
                    </div>
                    <div class="col-sm-4">
                        <p class="form-control-static" id="inputTelError"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputQQ" class="col-sm-2 control-label">QQ号</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="inputQQ" name="qq" placeholder="我们会将你拉入会员QQ群中">
                    </div>
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
    </div>
</div>

<%@ include file='footer.jsp' %>

</body>
</html>