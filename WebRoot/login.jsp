<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<link rel="stylesheet" type="text/css" href="resources/container.css">
  </head>
  
  <body>
  <div class="container">
  <div>
    <img src="resources/TITLE.jpg"></img>
    </div>
    <hr>
  <h1 align="center">用户登录</h1>   
  <hr>
    <div align="center">
   <form action="login.action" method="post">   
   <table  cellspacing=5 border=5>
   <tr>
   <td>用户名：</td><td><input type="text" class="message" name="username"></td></tr>   
   <tr><td>密  码：</td><td><input class="message" type="password" name="password"></td></tr>   
    <tr><td colspan="2" align="center"><input type="submit" value="登录">  <input type="reset" value="重置"></td></tr>   
   </table>   
   </form>   
   </div>
   </div>
  </body>
</html>
