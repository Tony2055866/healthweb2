<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/27
  Time: 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="com.dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  User user = null;
  request.setCharacterEncoding("UTF-8");
  if( request.getSession().getAttribute("user") != null){
    user = (User) request.getSession().getAttribute("user");
  }else{
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
  }

  try {
    Cure cure = BeanUtil.getBeanNoNullStringFromRequest(request, Cure.class, null);
    CureDAO dao = new CureDAO();
    cure.setUid(user.getId());
    dao.saveOrUpdate(cure);
      response.sendRedirect(request.getContextPath() + "/cure.jsp?result=success");
    return;
  } catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect(request.getContextPath() + "/cure.jsp?result=error");
  }

%>