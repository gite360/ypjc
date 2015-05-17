<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <base href="<%=basePath%>">
    
    <title>生成原始记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
    <script type="text/javascript">
        
        $(document).ready(function(){
          $("button").click(function(){
            var t = $("#日期").val();
            var data = {"date":t};
            var count = 0;
            var count0 = 0;
            var temp = new Array();
            var href;
            
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettask",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'  height='100'>";
                 s += "<tr><td width='150'><font size='4'>样品编号</font></td><td width='350'><font size='4'>样品名称</font></td><td width='100'><font size='4'>标准编号</font></td><td width='100'><font size='4'>样品数量</font></td></tr>";
                  /* for(i = ) */
                  $.each(jsonObject,function(key,value){
                	  temp.push(value);
                  });
                  /* alert(temp.toString()); */
                   $.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据  
                     if(count%4 == 0){
                        s+="<tr>";
                         /* s += "<td>"+"<a href=\"jiancexiangmu3.jsp?no="+value+"&sampleName="+temp[count+1]+"&standard="+temp[count+2]+"\"target=\"view_window\">"+value+"</td>"; */ 
                        /* s += "<td>"+"<a href=\"jiancexiangmu3.jsp?no="+value+"&sampleName="+temp[count+1]+"&standard="+temp[count+2]+"\">"+value+"</td>"; */
                        href="href=jiancexiangmu3.jsp?no="+value+"&sampleName="+temp[count+1]+"&standard="+temp[count+2];
                        href = encodeURI(href); 
                        s += "<td>"+"<a "+href+">"+"<font size='4'>"+value+"</font>"+"</td>";
                     }
                    /*  else if(count%4 == 2){
                         s += "<td>"+"<a href=\"biaozhunxiangmu.jsp?"+value+ "\">"+value+"</td>";
                     } */
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
         });
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
  	<font size="6">生成原始记录</font>
    <br>
  </div>
  <hr>
  <br>
  	<div id="result" align="center"></div>
  </div>
</body>
</html>
