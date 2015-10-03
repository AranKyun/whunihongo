<%@ page import="entity.user" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: lazier
  Date: 2015/9/21 0021
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
</head>
<body>
<h1>粗糙的管理员界面不要在意~</h1>
<br>
<hr>
<br>
<br>
<form action="queryresult!querybyid.action" method="post">
根据学号查询<input type="text" name="seekbyid"/>
  <input type="submit" value="查询">

  </form>

<table>
  <form action="queryresult!update.action" method="post">
  <tr>
  <td>学号</td>
  <td>姓名</td>
    <td>院系</td>
    <td>性别</td>
    <td>qq</td>
    <td>手机</td>
    <td>是否缴费</td>
  </tr>

    <script>
      var dict = {"101":"哲学学院","102":"国学院","103":"文学院","104":"外国语言文学学院","105":"新闻与传播学院","106":"艺术学系","107":"历史学院","108":"经济与管理学院","109":"法学院","110":"马克思主义学院","111":"社会学系","112":"政治与公共管理学院","113":"教育科学研究院","114":"信息管理学院","115":"国际教育学院","116":"数学与统计学院","117":"物理科学与技术学院","118":"化学与分子科学学院","119":"生命科学学院","120":"资源与环境科学学院","201":"动力与机械学院","202":"电气工程学院","203":"城市设计学院","204":"土木建筑工程学院","205":"水利水电学院","301":"电子信息学院","302":"计算机学院","303":"国际软件学院","304":"测绘学院","305":"遥感信息工程学院","306":"印刷与包装系","401":"基础医学院","402":"公共卫生学院","403":"第一临床学院","404":"第二临床学院","405":"口腔医学院","406":"HOPE护理学院","407":"药学院","408":"医学职业技术学院"};
    </script>

  <%
    user u= (user) session.getAttribute("userbyid");
    if(u!=null){


  %>

  <tr>
    <td><input type="text" value="<%=u.getStu_id()%>" name="sid"></td>
    <td><input type="text"value="<%=u.getRealname()%>"  name="rname"></td>
    <td><input type="text" value="" name="major" id="input1"></td>
    <td><input type="text" value="<%=u.getGender()%>" name="gender"></td>
    <td><input type="text" value="<%=u.getQq()%>" name="qq"></td>
    <td><input type="text" value="<%=u.getPhone()%>" name="phone"></td>
    <td><select id="select1" name="paid">
      <option value="1" <%=(u.getPaid() == true)? "selected='selected'" : ""%>>是</option>
      <option value="0" <%=(u.getPaid() == false)? "selected='selected'" : ""%>>否</option>
    </select></td>

    <td><input type="submit" value="修改"> </td> </tr>
    <script>


    document.getElementById("input1").value = dict["<%=u.getMajor()%>"];

  </script>

  <%
    }
  %>
</form>
  </table>
<br>
<br>
<form action="queryresult!querybyphone.action" method="post">
  根据电话查询<input type="text" name="seekbyphone"/>
  <input type="submit" value="查询">
</form>
<table>
  <form action="queryresult!update.action" method="post">
    <tr>
      <td>学号</td>
      <td>姓名</td>
      <td>院系</td>
      <td>性别</td>
      <td>qq</td>
      <td>手机</td>
      <td>是否缴费</td>
    </tr>

      <%

    List<user> u1= (List<user>) session.getAttribute("userbyphone");
    if(u1!=null){
    for(user u2:u1){

  %>
    <tr>
      <td><input type="text" value="<%=u2.getStu_id()%>" name="sid"></td>
      <td><input type="text" value="<%=u2.getRealname()%>"  name="rname"></td>
      <td><input type="text" value="" name="major" id="input2"></td>
      <td><input type="text" value="<%=u2.getGender()%>" name="gender"></td>
      <td><input type="text" value="<%=u2.getQq()%>" name="qq"></td>
      <td><input type="text" value="<%=u2.getPhone()%>" name="phone"></td>
      <td><select id="select2" name="paid">
        <option value="1" <%=(u2.getPaid() == true)? "selected='selected'" : ""%>>是</option>
        <option value="0" <%=(u2.getPaid() == false)? "selected='selected'" : ""%>>否</option>
      </select></td>
      <script>


        document.getElementById("input2").value = dict["<%=u2.getMajor()%>"];

      </script>

    <td><input type="submit" value="修改"></td>
    </tr>
      <%
    }}
  %>
  </form>
</table>
</body>
</html>
