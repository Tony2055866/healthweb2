<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="check.jsp"></jsp:include>
<%

Logger logger = LoggerFactory.getLogger(this.getClass());
String email = request.getParameter("email");
String password = request.getParameter("password");
String password2 = request.getParameter("password2");
UserDAO dao = new UserDAO();
int type = 0;
List list = dao.findByEmail(email);
User user = null;
logger.info("login success request: email:" + email + " password:"+password + " password2:" + password2);
//注册 和 登录的逻辑放在一块了。 根据password2判断是注册还是登录
if(password2 != null && password2 != ""){
	logger.info("user regist : {}", email
			);
	if(list == null || list.size() == 0){
		try{
			user = new User();
			user.setEmail(email);
			user.setPassword(password);
			dao.save(user);
			type = 1;
		}catch(Exception e){
			type = 2; //
			e.printStackTrace();
			out.println("服务器错误，请联系管理员");
			return;
		}
		
	}else{
		type = 3;//已经被注册
	}
}else{
	if(list == null || list.size() == 0){
		type = 6; //登录失败，用户不存在
	}else{
		 user = (User)list.get(0);
		if(user.getPassword().equals(password)){
			type = 5;
		}else{
			type = 7;
		}
	}
}

if(type != 5){
	response.sendRedirect("login.jsp?errortype="+type);
}else{
	session.setAttribute("user", user);
	response.sendRedirect("ucenter.jsp");
%>

<%} %>
</body>
</html>