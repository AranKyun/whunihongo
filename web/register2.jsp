<%@ page contentType="text/html;charset=utf-8" %>



<html>
<head>
    <%@ include file='head.jsp' %>
    <meta http-equiv="refresh" content="5;URL=index.jsp"/>
</head>
<body>
    <%@ include file='navbar.jsp' %>
    <div class="container bottom-padded">
        <div class="row">
            <div class="col-md-4">
                <div class="list-group top-padded hidden-sm hidden-xs">
                    <%--<a href="#" class="list-group-item active">--%>
                        <%--<h4>我是新会员</h4>--%>
                        <%--<p>　　自2015年9月入会的会员，请注册账号，并填写真实的资料以完成验证。</p>--%>
                    <%--</a>--%>
                    <%--<a href="#" class="list-group-item"><h4>我是老会员</h4></a>--%>
                </div>
            </div>
            
            <%@ include file='register-clip3.jsp' %>
        </div>
    </div>

    <%@ include file='footer.jsp' %>
    
</body>
</html>