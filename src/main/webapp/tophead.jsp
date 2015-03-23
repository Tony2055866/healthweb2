<%@ page import="com.dao.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  User user = (User)session.getAttribute("user");
  String f = "(未完成)";

  if(user!= null && "true".equals(user.getFinish()))
    f = "(已完成)";
  if(user == null){
    f = "";
  }

%>
<div class="header">
  <div class="wrapper">
    <a href="<%=request.getContextPath()%>" class="logo"></a>

    <ul class="main-nav">
      <li>
        <a href="survey.jsp">问卷调查<%=f%></a>
      </li>
      <li>
        <a href="checkForm01.jsp">体检项目表</a>
      </li>
    </ul>


    <div class="entry">
      <ul class="util-nav">
      <% if(user == null){%>

        <li>
          <a  href="login.jsp">登录</a>
        </li>
        <li>|</li>
        <li>
          <a href="index.jsp">注册</a>
        </li>

      <%}else{%>
        <li>
          <a class="login_but" href="ucenter.jsp">个人中心</a>
        </li>
        <li>|</li>
        <li>
          <a href="logout.jsp">退出</a>
        </li>
      <%}%>
      </ul>
  </div>
</div>
  </div>