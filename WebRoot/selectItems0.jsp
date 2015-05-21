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
    
    <title>检测项目</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
    <script type="text/javascript">
      var url=location.href;
      var tmp1=url.split("?")[1]; 
      var tmp2=tmp1.split("&");
      var tmp3 = tmp2[0].split("=");
      var tmp4 = tmp2[1].split("=");
      var data = {"standard":tmp4[1]};
      var count = 0;
      function jiancexiangmu(){
         $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/getall",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                 s += "<tr><td width='155' id=\"tdLeft\"><input id=\"checkAll\" type=\"checkbox\" value=\"checkAll\"><font size='1px'>全选（取消）</font></td><td width='350' align=\"left\"><font size='4'>检验内容</font></td></tr>"; 
                 
                 $.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据  
                    if(count%2 == 0){
                        s+="<tr>";
                        s += "<td align=\"left\"> <input name=\"001\" type=\"checkbox\" align=\"left\" value="+value+">"+"<font size='4'>"+value+"</font>"+"</td>";
                     }
                     else{
                         s += "<td align=\"left\">"+"<font size='4'>"+value+"</font>"+"</td>";
                     }
                    count++;
                   });  
                   s += "</table>"; 
                   $("#result").html(s);  
                   
                   $("#checkAll").click(function() { //复选框全选/取消全选 
                	   /* alert(this.checked); */
                       if (this.checked) {  
                    	   /* alert("0"); */
                           $("input[name='001']:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
                        	           /* alert("1"); */
                        	           /* $(this).attr("checked", true); */
                        	           $(this).prop("checked",true);
                                   })  
                       } else {   //反之 取消全选   
                           $("input[name='001']:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
                                       $(this).attr("checked", false);  
                                       //alert("f");  
                                   })  
                       }  
                   })   
              },
              
              complete:function(){
              },
              global:true,
              error: function(){
                  alert("错误");
              }
            });
       
      }
      
      
      $(document).ready(function(){
    	  
    	  
    	 /*  $("#checkAll").click(function() { //复选框全选/取消全选 
              if (this.checked) {  
                  $("input[name='001']:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
                              $(this).attr("checked", true);  
                          })  
              } else {   //反之 取消全选   
                  $("input[name='001']:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
                              $(this).attr("checked", false);  
                              //alert("f");  
                          })  
              }  
          }) */
    	  
    	  
    	  
    	  
          $("button").click(function(){
          
            var t = $(":checkbox[name='001']:checked").map(function(){return $(this).val(); }).get();
            var data = {"no":tmp3[1],"t":t};
            /* alert(JSON.stringify(data)); */  
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/settm",
              data: data,
              success: function(jsonObject){
                  /* var s = "<table border='1' width='500' height='100'>"; */
                 /*  alert(jsonObject.status); */
                  if(jsonObject.status == "success"){
                      alert("保存成功!"); 
                  }
                  if(jsonObject.status == "fail"){
                      alert(jsonObject.status); 
                  }        				
              },
              
              error: function(){
                  alert("错误");
              }
            });
         });
        });
      
      
    </script>
    
  </head>
  
  <body onload="jiancexiangmu()">
    <div class="container">
    <div align="center">
      <img src="img/TITLE.jpg" width="980" height="150"> 
      </div>
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
    	<font size="6">检测项目</font>
        <br>
    </div>
    <div align="center" style="background:#B5DBFF;width:980px">
    <br>
    	<font size="4">
    	样品编号:<script>document.write(tmp3[1]);</script>
        &nbsp; &nbsp;
        标准编号:<script>document.write(tmp4[1]);</script>
        &nbsp; &nbsp;
        </font>
    	<button type="button">确认</button>
    </div>
    <div id="result" align="center" style="background:#B5DBFF;min-height:600px">
    </div>
    </div>
</body>
</html>
