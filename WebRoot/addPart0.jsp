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
    
    <title>检测项目分配</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="单日项目分">
	
	
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	  
	</style>
	
	
	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/showGetTask0.js"></script> --%>
    <script type="text/javascript">
    function requestURLParameter(strParame) { //获得URL参数
  	  var args = new Object( ); 
  	  var query = location.search.substring(1); 
  	  var standardNum0;
  	  var standardNum1;
  	  

  	  var pairs = query.split("&"); // Break at ampersand 
  	  for(var i = 0; i < pairs.length; i++) { 
  	  var pos = pairs[i].indexOf('='); 
  	  if (pos == -1) continue; 
  	  var argname = pairs[i].substring(0,pos); 
  	  var value = pairs[i].substring(pos+1); 
  	  value = decodeURIComponent(value); 
  	  args[argname] = value; 
  	  } 
  	  return args[strParame]; 
    } 
    
    standardNum0 = requestURLParameter('standardName');
    standardNum1 = standardNum0.split(",");
    /* alert(standardNum1.length); */
    
    
    function selectFunction(){
      var s;
      $.each(standardNum1,function(key,value){
          s += "<option value=\""+value+"\">"+value+"</option>";
      });
      return s;
    }
    
    function savePart0(){
    	var specimenName = requestURLParameter('specimenName');
    	var specimenNo = requestURLParameter('no');
    	var s1=new Array();
    	var s2=new Array();
    	/* $('#table1 tr td').each (function (){
    	    alert($("input[type='text']").val());
    	 }); */
    	$("input[type='text']").each(function(){
    		/* alert(this.value); */
    		if(this.value != ""){
    			s1.push(this.value);
    		}
    		
    		/* s1 += this.value; */
    	}); 
    	 
    	 
    	 
    	$("select").each(function(){
      		/* alert(this.value); */
      		/* s2 += this.value; */
      		s2.push(this.value);
      	});
    	/*  alert(s1.length);  */
    	/* alert(s2); */
    	/* $("input[type='text']", $("#aaa")) */
    	for(x in s1){
    		/* alert(NUM(x)+1); */
    		x = parseInt(x);
    		if(x%2==0){
    			/* var y = x;
        		y+=1;
        		alert(y); */
    			var partInfo = {"no":specimenName,"name":specimenNo,"part":s1[x],"num":s1[x+1],"standard":s2[x]};
    			/* alert(JSON.stringify(partInfo)); */
    			$.ajax({
                    dataType:"json",
                    type: "POST",
                    url: "servlet/setpart",
                    data: partInfo,
                    success: function(jsonObject){
                    	if(jsonObject.status == "success"){
                            alert("保存成功!"); 
                        }
                        if(jsonObject.status == "fail"){
                            alert(jsonObject.status); 
                        }      
                    },
                    
                    error: function(){
                        alert("没有收到后台的数据！");
                    },
                    complete:function(){
                    },
                    global:true,
                  });
    		}
    		/* x++; */
    		
    	}
    }
    
    
    /* function savePart(){
    	alert($("#select0").val());
    	
    	var specimenName = requestURLParameter('specimenName');
    	var specimenNo = requestURLParameter('no');
    	var partName;
    	var parNum;
    	var standardNo;
    	
    	var partInfo = {"no":specimenName,"name":specimenNo,"part":partName,"num":parNum,"standard":standardNo,};
    	
    	/* $.ajax({
            dataType:"json",
            type: "POST",
            url: "servlet/setpart",
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
          }); */
   /*  } */ 
    
    $(document).ready(function(){
    	
    	
    });
        /* $(document).ready(function(){
            /* var t = $("#endtime").val(); */
            /* var data = {"date":t}; */
            
           /*  var data = null; 
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
       /*  }); */ 
   </script>
  </head>
  
  <body>
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
   	  <font size="6">检测项目分配</font>
    </div>
    <div id="result" align="center" style="background:#B5DBFF;min-height:600px">
      <table id = "table1" width = "800">
        <tr>
          <th>样品编号</th><th>样品名称</th><th>部件名称</th><th>数量</th><th>标准编号</th><th><button type="button0" onclick="savePart0()">保存</button></th>
        </tr>
        <tr>
          <td  width="5"><p name="specimenNo"><script>document.write(requestURLParameter('no'));</script></p></td>
          <td  width="5"><p name="specimenName0"><script>document.write(requestURLParameter('specimenName'));</script></p></td>
          <td width="5"><input type="text" id="partName" style="width:50px"/></td>
          <td width="5"><input type="text" id="partNo" style="width:50px"/></td>
          <td width="5"><select id="select0"><script>document.write(selectFunction());</script></select></td>
        </tr>
        <tr>
          <td  width="5"><p name="specimenNo"><script>document.write(requestURLParameter('no'));</script></p></td>
          <td  width="5"><p name="specimenName"><script>document.write(requestURLParameter('specimenName'));</script></p></td>
          <td width="5"><input type="text" id="partName" style="width:50px"/></td>
          <td width="50"><input type="text" id="partNo" style="width:50px"/></td>
          <td width="5"><select><script>document.write(selectFunction());</script></select></td>
        </tr>
        <tr>
          <td  width="5"><p name="specimenNo"><script>document.write(requestURLParameter('no'));</script></p></td>
          <td  width="5"><p name="specimenName"><script>document.write(requestURLParameter('specimenName'));</script></p></td>
          <td width="5"><input type="text" id="partName" style="width:50px"/></td>
          <td width="50"><input type="text" id="partNo" style="width:50px"/></td>
          <td width="5"><select><script>document.write(selectFunction());</script></select></td>
        </tr>
        
      </table>
    </div>
  </div>
</body>
</html>
