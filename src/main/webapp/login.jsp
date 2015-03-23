<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="boots/css/bootstrap.min.css" rel="stylesheet">
   <script src="boots/js/jquery.min.js"></script>
   <script src="boots/js/bootstrap.min.js"></script>
	  <link href="topmenu.css" rel="stylesheet">
   <%
   if(session.getAttribute("user") != null){
	   response.sendRedirect("ucenter.jsp");
	   return;
   }
   String[] msgs = {"",
		   "注册成功，进入登录界面",
		   "",
		   "该邮箱已经注册过了，请直接登录", 
		   "请先登录！",
		   "",
		   "该用户名不存在",
		   "密码错误"}; 
	  String type = request.getParameter("errortype");
	  String msg = "";
	  if(type != null && type != ""){
		  msg = msgs[Integer.parseInt(type)];
	  }
	 %>
	 <script type="text/javascript">
	 	var msg = "<%=msg %>";	
	 	if(msg != "")
	 		alert(msg);
	 </script>

	  <link rel="stylesheet" type="text/css" href="ucenter.css"/>
  </head>
  <body >
  <jsp:include page="tophead.jsp"></jsp:include>


  <div class="contentDiv">
  	<form class="form-horizontal" method="post" role="form"
				data-toggle="validator" action="loginResProcess.jsp">
<fieldset>
<!-- Form Name -->
<legend>登录账户</legend>

<div class="form-group">
  <label class="col-md-4 control-label" for="passwordinput">邮箱：</label>
  <div class="col-md-5">
    <input id="passwordinput" name="email" 
     type="email" placeholder="邮箱" class="form-control input-md" required>
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">密码:</label>  
  <div class="col-md-5">
  <input id="password" name="password" type="password" placeholder="输入密码" class="form-control input-md" required>
  </div>
</div>

</fieldset>
<div class="form-group">
  <label class="col-md-3 control-label" for="button1id"></label>
  <div class="col-md-8">
    <button id="button1id" type="submit" name="button1id" class="btn btn-success">&nbsp;&nbsp;&nbsp;   登    &nbsp;&nbsp; 录  &nbsp;&nbsp;&nbsp; </button>
    <a class="btn btn-info" href="index.jsp" role="button">注册新用户</a>
    <a class="btn btn-default" href="login.jsp" role="button">找回密码</a>
  </div>
</div>
</form>
  
  </div>
  
  
  </body>
</html>
