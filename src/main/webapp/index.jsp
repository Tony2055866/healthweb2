<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<script src="boots/js/jquery.min.js">
</script>
		<script src="boots/js/bootstrap.min.js">
</script>
		<script src="boots/js/validator.js">
</script>

		<script type="text/javascript">
function Check() // 验证表单数据有效性
{
	var pass = document.getElementById("password");
	var pass2 = document.getElementById("password2");
	if (pass.value == "") {
		alert('请输入密码!');
		return false;
	}
	if (document.send.password.value.length < 6) {
		alert('密码长度必须大于6!');
		return false;
	}
	if (pass2.value != pass.value) {
		alert('确认密码与密码不一致!');
		return false;
	}
	
	return true;
}
</script>
		
</script>
		<script type="text/javascript" src="boots/js/jquery.validate.min.js">
</script>

		<link rel="stylesheet" type="text/css" href="ucenter.css"/>
		
		
	</head>
	<body>

		<div class="contentDiv">
			<form id="myForm" name="send" class="form-horizontal" role="form"
				data-toggle="validator" action="loginResProcess.jsp" method="POST"
				onsubmit="return Check();">
				<fieldset>
					<!-- Form Name -->
					<legend>
						新注册用户
					</legend>

					<div class="form-group">
						<label class="col-md-4 control-label" for="passwordinput">
							邮箱：
						</label>
						<div class="col-md-5">
							<input data-error="Bruh, that ema" id="passwordinput"
								name="email" type="email" placeholder="邮箱"
								class="form-control input-md" required>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">
							密码:
						</label>
						<div class="col-md-5">
							<input id="password" name="password" type="password"
								placeholder="至少6位数字或字母" class="form-control input-md" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">
							确认密码:
						</label>
						<div class="col-md-5">
							<input id="password2" name="password2" type="password"
								placeholder="重复上面密码" class="form-control input-md" required>
						</div>
					</div>

				</fieldset>
				<div class="form-group">
					<label class="col-md-3 control-label" for="button1id"></label>
					<div class="col-md-8">
						<button id="button1id" type="submit" name="button1id"
							class="btn btn-success">
							&nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;&nbsp;册&nbsp;&nbsp;&nbsp;
						</button>
						<a class="btn btn-info" href="login.jsp" role="button">登录</a>
					</div>
				</div>
			</form>

		</div>


	</body>
</html>
