<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>设置检测条目的具体信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
    <script type="text/javascript">
      var url=location.href;
      /* url = decodeURI(url); */
      var tmp1 = url.split("?")[1]; 
      var tmp2 = tmp1.split("&");
      var tmp3 = tmp2[0].split("=");
      var tmp4 = tmp2[1].split("=");
      /* var data = {"standard":tmp4[1]}; */
      var temp;
      tmp4[1] = decodeURI(tmp4[1]);
     /*  var test = new String(request.getParameter("url").getBytes("8859_1")); */
      /* function biaozhunxiangmu2(){
          $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettmnr",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                
                 //$.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据
                   s += "<tr>";
                   //temp = value;
                   //s += "<td>"+"检测内容："+value+"</td>";
                   s += "<td>"+"检测内容："+tmp2[1]+"</td>";
                   s += "</tr>";
                   $("#result").html(s); 
                 //});    
              },
              complete:function(){
              },
              global:true,
              error: function(){
                  alert("错误");
              }
            });
      } */
      
      $(document).ready(function(){
          $("button").click(function(){
            /* var t = $(":text[name='标准名称']").map(function(){return $(this).val(); }).get(); */
            /* var t = $(":text[name='标准名称']").val(); */ 
            /* var t = $("#日期").val(); */
            var num = $("#样品数量").val();
            var s1 = $("#浸泡面积1").val();
            var v1 = $("#浸泡体积1").val();
            var wareno1 = $("#器皿编号1").val();
            var s2 = $("#浸泡面积2").val();
            var v2 = $("#浸泡体积2").val();
            var wareno2 = $("#器皿编号2").val();
            var data = {"no":tmp3[1],"num":num,"content":tmp4[1],"s1":s1,"s2":s2,"v1":v1,"v2":v2,"wareno1":wareno1,"wareno2":wareno2,};
            /* var count = 0; */
             alert(JSON.stringify(data)); 
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/setinfo",
              data: data,
              success: function(jsonObject){
                 alert(jsonObject.status);
              },
              
              complete:function(){
              },
              global:true,
            });
         });
        });
      
    </script>
  <script> 
function show_child(id) 
{ 
var value = window.showModalDialog("qiminbianhao.jsp","","dialogHeight=460px,dialogWidth=520px,toolbar=no,menubar=no,location=no");
if (value!=null)
{
if(id == 1)
{
document.getElementById("器皿编号1").setAttribute("value", value);
}
if(id == 2)
{
document.getElementById("器皿编号2").setAttribute("value", value);
}
}
} 
</script> 
  </head>
  
  <!-- <body onload="biaozhunxiangmu2()"> -->
    <body>
    <div class="container">
    <div align="center"> <img src="img/TITLE.jpg" width="980" height="150"></div>
    <div class="sidebar1">
  	<nav>
    <ul>
      <c:set var="permission1" value="<%=session.getAttribute(\"permission1\") %>" />
      <c:set var="permission2" value="<%=session.getAttribute(\"permission2\") %>" />
      <c:set var="permission3" value="<%=session.getAttribute(\"permission3\") %>" />
      <c:set var="permission4" value="<%=session.getAttribute(\"permission4\") %>" />
      <li><c:choose>
      <c:when test="${permission1=='true'}"><a href='showAllSpecimen0.jsp'>检测项目分配</a></c:when>
      <c:otherwise><label>检测项目分配</label></c:otherwise>
      </c:choose></li>
      <li>
      <c:choose>
      <c:when test="${permission2=='true'}"><a href='yangpinfenpei.jsp'>检测样品分配</a></c:when>
      <c:otherwise><label>检测样品分配</label></c:otherwise>
      </c:choose>
	  </li>
      <li>
      <c:choose>
      <c:when test="${permission3=='true'}"><a href='shengchengyuanshijilu.jsp'>生成原始记录</a></c:when>
      <c:otherwise><label>生成原始记录</label></c:otherwise>
      </c:choose>
      </li>
      <li>
      <c:choose>
      <c:when test="${permission4=='true'}"><a href='setinfo.jsp'>修改个人信息</a></c:when>
      <c:otherwise><label>修改个人信息</label></c:otherwise>
      </c:choose>
	  </li>
    </ul>
    </nav>
    </div>
	<div style="background:#B5DBFF;">
	<table width='800px'>
	<tr>
	<td align="left">
	&nbsp;
	<input type="submit" value="后退" onclick="javascript:history.go(-1);"/>
	&nbsp;
	<input type="submit" value="前进" onclick="javascript:history.go(1);"/>
	</td>
	<td align="right">
    <form action="logout.action" method="post">
      <font size="4">欢迎进入样品检测系统，<%=session.getAttribute("username") %></font>
      <input type="submit" value="注销">
    </form>
    </td>
    </tr>
    </table>
	</div>
    <div align="center" style="background:#B5DBFF;width:980px">
    <br>
    	<font size="6">设置检测条目的具体信息</font>
    </div>
    <div align="center" style="background:#B5DBFF;width:980px">
    <font size="4">
    样品编号：<script>document.write(tmp3[1]);</script>
    &nbsp; &nbsp;
    检测内容：<script>document.write(tmp4[1]);</script>
    </font>
    </div>
    <div align="center" style="background:#B5DBFF;width:980px">
    <font size="4">
    请输入样品数量：
    </font>
    <input type="text" name="样品数量" id="样品数量" size = "3"/>
    &nbsp; &nbsp;
    <button type="button">确认</button> 
    </div>
    <div align="center" style="background:#B5DBFF;width:980px">
    <table border="1" height="185" width="600">
  		<tr>
  		  <td>
    	        <font size="4">请输入浸泡面积1：</font><input type="text" name="浸泡面积1" id="浸泡面积1" size = "3" value = "100"/>cm<sup>2</sup>
    	  </td>
    	  <td>
    	        <font size="4">请输入浸泡面积2：</font><input type="text" name="浸泡面积2" id="浸泡面积2" size = "3" value = "100"/>cm<sup>2</sup>
    	  </td>
  		</tr>
  		<tr>
  		  <td>
    	        <font size="4">请输入浸泡体积1：</font><input type="text" name="浸泡体积1" id="浸泡体积1" size = "3" value = "200"/>mL
    	  </td>
    	  <td>
    	        <font size="4">请输入浸泡体积2：</font><input type="text" name="浸泡体积2" id="浸泡体积2" size = "3" value = "200"/>mL
    	  </td>
  		</tr>
  		<tr>
  		  <td>
    	        <font size="4">请输入器皿编号1：</font><input type="text" name="器皿编号1" id="器皿编号1" size = "3"/>
    	        <input type="button" value="选择器皿" onclick="javascript:show_child(1);"/>
    	  </td>
    	  <td>
    	        <font size="4">请输入器皿编号2：</font><input type="text" name="器皿编号2" id="器皿编号2" size = "3"/>
    	        <input type="button" value="选择器皿" onclick="javascript:show_child(2);"/>
    	  </td>
  		</tr>
  	</table>
    </div>
  	<div id="result" align="center" style="background:#B5DBFF;min-height:600px"></div>
    </div>
</body>
</html>
