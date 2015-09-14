<%--
  Created by IntelliJ IDEA.
  User: Aran
  Date: 2015/9/3
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<html>
<head>
    <title>test</title>
</head>
<body>

<%!
    public static String sendGet(String url) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }


%>

<%
    String code = "";
    String access_token = "";
    String openid = "";

    if(session.getAttribute("state").equals(request.getParameter("state"))) {
        String app_id = "101225709";
        String app_secret = "d36c04b79ddfc2503a5ff09aa994aba3";
        String my_url = "http://whunihongo.azurewebsites.net/test.jsp";
        code = request.getParameter("code");

        //获取Access Token
        String token_url = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&" + "client_id=" + app_id + "&redirect_uri=" + URLEncoder.encode(my_url, "UTF-8") + "&client_secret=" + app_secret + "&code=" + code;

        String response_flow = sendGet(token_url);
        String[] values = response_flow.split("access_token=|&expires_in=");
        access_token = "";
        try {
            access_token = values[1];
        } catch (ArrayIndexOutOfBoundsException e) {

        }

        //获取OpenID
        openid = "";
        if (!access_token.equals("")) {
            String graph_url = "https://graph.qq.com/oauth2.0/me?access_token=" + access_token;
            String json_raw = sendGet(graph_url);
            Pattern pJson = Pattern.compile("\\{.+\\}");
            Matcher mJson = pJson.matcher(json_raw);

            if (mJson.find()) {
                String json_processed = mJson.group();
                JSONObject jsob = JSONObject.fromObject(json_processed);
                openid = jsob.get("openid").toString();
                session.setAttribute("open_id",openid);
            }

            String infourl="https://graph.qq.com/user/get_user_info?access_token="+access_token+"&oauth_consumer_key="+app_id+"&openid="+openid;
            String info=sendGet(infourl);
            String nickname="";
            Matcher infoJson = pJson.matcher(info);
            if (mJson.find()) {

                String jp = infoJson.group();
                JSONObject userjson = JSONObject.fromObject(jp);
                nickname = userjson.get("nickname").toString();
                session.setAttribute("nickname",nickname);
            }
        }
    }

    session.setAttribute("qqlog",true);
    System.out.println(session.getAttribute("operation"));
    int i=Integer.parseInt(session.getAttribute("operation").toString().trim());
    System.out.println("Authorization code is:"+code+" ,Access token is:"+access_token+" ,OpenID is:"+openid);

    if(i==2){
        session.setAttribute("operation",1);
        response.sendRedirect("attach.action");}
    else{
        response.sendRedirect("check.action");
    }


%>

</body>
</html>
