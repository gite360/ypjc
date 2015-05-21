<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>样品检测系统登陆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="样品检测系统登陆">
	<link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/supersized.css">
    <link rel="stylesheet" href="css/loginstyle.css">
  </head>
  
  <body>
  <div align="center">
    <img src="img/TITLE.jpg"></img>
  </div>
   <div class="page-container" style="background-image:url(img/login_pic.png);background-repeat:no-repeat;background-position: center;">
            <br><br><br><br><h1>登录</h1>
            <form action="login.action" method="post">
                <input type="text" name="username" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <button type="submit">提交</button>
            </form>
   </div>
   <c:if test="${flag==1}"><script type="text/javascript">alert("用户名密码错误，请重新登陆")</script></c:if>
   <script src="js/scripts.js"></script>
  </body>
</html>
