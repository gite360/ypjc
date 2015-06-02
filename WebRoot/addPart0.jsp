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
.part {
	/* margin:0px auto; */
	border: 1px solid black;
}

td {
	border: 1px
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.query-2.1.7.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/getURLParameter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/addAndShowPart0.js"></script>

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
						<c:when test="${permission1=='true'}">
							<a href='showAllSpecimen0.jsp'>检测项目分配</a>
						</c:when>
						<c:otherwise>
							<label>检测项目分配</label>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${permission2=='true'}">
							<a href='yangpinfenpei.jsp'>检测样品分配</a>
						</c:when>
						<c:otherwise>
							<label>检测样品分配</label>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${permission3=='true'}">
							<a href='shengchengyuanshijilu.jsp'>生成原始记录</a>
						</c:when>
						<c:otherwise>
							<label>生成原始记录</label>
						</c:otherwise>
					</c:choose></li>
				<li><c:choose>
						<c:when test="${permission4=='true'}">
							<a href='setinfo.jsp'>修改个人信息</a>
						</c:when>
						<c:otherwise>
							<label>修改个人信息</label>
						</c:otherwise>
					</c:choose></li>
			</ul>
			</nav>
		</div>

		<div style="background: #B5DBFF;">
			<table width='800px'>
				<tr>
					<td align="left">&nbsp; <input type="submit" value="后退" onclick="javascript:history.go(-1);" /> &nbsp; <input type="submit" value="前进" onclick="javascript:history.go(1);" />
					</td>
					<td align="right">
						<form action="logout.action" method="post">
							<font size="4">欢迎进入样品检测系统，<%=session.getAttribute("username") %></font> <input type="submit" value="注销">
						</form>
					</td>
				</tr>
			</table>
		</div>
		<div align="center" style="background: #B5DBFF; width: 980px">
			<font size="6">检测项目分配</font>
		</div>
		<div id="result" align="center" style="background: #B5DBFF; min-height: 600px">

			<table id="tablePart" width="800" class="part">
				<tr>
					<th>样品编号</th>
					<th>样品名称</th>
					<th>部件名称</th>
					<th>数量</th>
					<th>标准编号</th>
					<th><button type="button" onclick="savePart()">保存部件</button></th>
					<th></th>
				</tr>
				<tr>
					<td><script>
						document.write(requestURLParameter('no'));
					</script></td>
					<td><script>
						document.write(requestURLParameter('specimenName'));
					</script></td>
					<td><input type="text" id="partName" style="width: 100px" /></td>
					<td><input type="text" id="partNo" style="width: 50px" /></td>
					<td><select><script>
						document.write(selectFunction());
					</script></select></td>
					<td><input type="button" class="addTr" value="添加部件" /></td>
					<td><input type="button" class="deleteTr" value="删除部件" onclick="deleteTr()" /></td>
				</tr>
				<tr>
					<th>样品编号</th>
					<th>样品名称</th>
					<th>部件名称</th>
					<th>数量</th>
					<th>标准编号</th>
					<th><button type="button" class="showPart" onclick="showPart()">显示部件</button></th>
					<th></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
