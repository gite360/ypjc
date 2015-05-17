<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目分配</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="单日项目分">
	
	
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
    <script type="text/javascript">
        
        $(document).ready(function(){
            /* var t = $("#endtime").val(); */
            /* var data = {"date":t}; */
            
            var data = null; 
            var count = 0;
            var temp;
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettask",
              data: data,
              success: function(jsonObject){
            	  
                  var s = "<table border='1'  height='100'>";
                 s += "<tr><td width='150'><font size='4'>样品编号</font></td><td width='350'><font size='4'>样品名称</font></td><td width='100'><font size='4'>标准编号</font></td><td width='100'><font size='4'>样品数量</font></td><td width='100'><font size='4'>创建日期</font></td><td width='100'><font size='4'>状态</font></td></tr>";
                   $.each(jsonObject,function(key,value){
                     
                     if(count%6 == 0){
                        s+="<tr>";
                        s += "<td>"+"<font size='4'>"+value+"</font>"+"</td>";
                        temp = value;
                     }
                     else if(count%6 == 2){
						s += "<td>"+"<a href=\"jiancexiangmu.jsp?no="+temp+"&standard="+value+"\">"+"<font size='4'>"+value+"</font>"+"</td>";
                     }
                     else{
                         s += "<td>"+value+"</td>";
                     }   
                      
                    count++;
                   });  
                   s += "</table>";
                   $("#result").html(s);  
              },
              
              error: function(){
                  alert("没有收到后台的数据！");
              },
              complete:function(){
              },
              global:true,
            });
         /* }); */
        });
   </script>
  </head>
  
  <body>
    <div class="container">
  	  <div align="center"> 
      <img src="resources/TITLE.jpg" width="980" height="150"> 
    </div>
    <hr>
    <form action="logout.action" method="post">
      <font size="4">欢迎进入样品检测系统，<%=session.getAttribute("username") %></font>
      <input type="submit" value="注销">
    </form>
<hr>
<div align="center">
<br>
   	<font size="6">项目分配</font>
    <br>
  </div>
  <hr>
  <div id="result" align="center"></div>
  </div>
  </body>
</html>
