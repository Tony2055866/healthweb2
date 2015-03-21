<%--
  Created by IntelliJ IDEA.
  User: Gaotong
  Date: 2015/3/14
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% 
session.removeAttribute("user");
  response.sendRedirect("login.jsp");

%>