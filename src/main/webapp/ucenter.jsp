<%@page import="com.dao.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="check.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="boots/css/bootstrap.min.css" rel="stylesheet">
<script src="boots/js/jquery.min.js"></script>
<script src="boots/js/bootstrap.min.js"></script>
<script type="application/javascript">
	<% if("finish1".equals( request.getParameter("result"))){ %>
	alert("恭喜完成问卷调查！");
	<%}%>
</script>
</head>
<%
User user = (User)session.getAttribute("user");
if(user == null){
	response.sendRedirect("login.jsp?type=6");
	return;
}
	System.out.println("user.getFinish(): " + user.getFinish());
	String f = "填写问卷调查(未完成)";
	if("true".equals(user.getFinish()))
		f = "修改问卷调查(已完成)";
%>
<body>

	<div style="width: 600px; text-align: center;margin: 100px auto; border: background: #ffffff; border: 1px solid #ddd;">
		<form class="form-horizontal" method="post" role="form"
			data-toggle="validator" action="loginRegProcess.jsp">
			<fieldset>
				<!-- Form Name -->
				<legend style="padding: 10px; ">个人中心:<%=user.getEmail()%></legend>
				<div class="col-md-8">
					<a class="btn btn-link" href="survey.jsp" role="button"><%=f%></a> 
				</div>
				
				<div class="col-md-8" style="margin-top: 10px;">
					<a	class="btn btn-link" href="checkForm01.jsp" role="button">填写体检项目表</a>
				</div>
			</fieldset>
	</form>

	</div>


</body>
</html>
