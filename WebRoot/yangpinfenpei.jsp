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
    
    <title>样品分配</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/showGetTask1.js"></script>
    <script type="text/javascript">
        
        /* $(document).ready(function(){
            var t = $("#日期").val();
            var data = {"date":t};
            var count = 0;
             
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettask",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'  height='100'>";
                 s += "<tr><td width='150'><font size='4'>样品编号</font></td><td width='350'><font size='4'>样品名称</font></td><td width='100'><font size='4'>标准编号</font></td><td width='100'><font size='4'>样品数量</font></td></tr>";
                   $.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据  
                     if(count%4 == 0){
                        s+="<tr>";
                        s += "<td>"+"<a href=\"jiancexiangmu2.jsp?no="+value+"\">"+"<font size='4'>"+value+"</font>"+"</td>";
                     }
                     else{
                         s += "<td>"+"<font size='4'>"+value+"</font>"+"</td>";
                     }   
                      
                    count++;
                   });  
                   s += "</table>";
                   $("#result").html(s);    
              },
              
              complete:function(){
              },
              global:true,
            });
        }); */
   </script>
  </head>
  
  <body>
  <div class="container">
  	<div align="center">
    <img src="img/TITLE.jpg" width="980" height="150"> </div>
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
    	<font size="6">样品分配</font>
    </div>
  	<div id="result" align="center" style="background:#B5DBFF;min-height:600px"></div>
    </div>
</body>
</html>
