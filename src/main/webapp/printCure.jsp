<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mysql.jdbc.StringUtils" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="com.util.PageUtil" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.lang.reflect.Field" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="head.jsp">
  <jsp:param name="title" value="调查表-打印预览"></jsp:param>
</jsp:include>

<%
  request.setCharacterEncoding("UTF-8");
  System.out.println("check.jsp : " + session.getAttribute("user"));
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp?type=6");
    return;
  }
  User user = (User) session.getAttribute("user");
  Cure cure = new CureDAO().findById(user.getId());
  cure = BeanUtil.getBeanNoNullString(request, Cure.class, cure);
%>


<body style="background-color:#f8f8f8">

<jsp:include page="tophead.jsp"></jsp:include>

<div class="printDvi" >

  <label>打印预览</label>
  <input type="button" style="margin-left: 100px" class="btn btn-success" value="确认打印" onclick="myPrint();">
</div>

<div class="contentDiv" id="print">
  <link href="boots/css/bootstrap.min.css" rel="stylesheet">
  <link href="boots/mycss.css" rel="stylesheet">
  <style type="text/css">
    .control-label1{
      width: 120px;
    }
    .control-label2{
      width: 150px;
    }
    .control-label3{
      width: 200px;
    }
    .smallInput{
      width: 80px;
    }
    .titleDiv{
      margin-top: 5px;
    }

  </style>

  <h4 style="margin-left: 200px">治疗情况: &nbsp;<%=user.getNameZh()%></h4><hr>


  <table width="100%" style="text-align: left">
    <tr width="90%">
      <td>
        <label class="control-label1">治疗时间：</label>
        <input type="text" name="nameZh" value="<%=cure.getTime() %>"
               >
      </td>
    </tr>


    <tr width="90%">
      <td>
        <label class="control-label1">治疗医院：</label>

        <input name="birth" type="text" value="<%=cure.getAddress() %>" >
      </td>
    </tr>

    <tr width="90%">
      <td>
        <label class="control-label1">治疗科室：</label>

        <input name="birth" type="text" value="<%=user.getBirth() %>" >
      </td>
    </tr>

    <tr width="90%">
      <td>
        <label class="control-label1">主治医师：</label>

        <input name="birth" type="text" value="<%=cure.getDoc() %>" >
      </td>
    </tr>

    <tr width="90%">
      <td>
        <label class="control-label1">治疗情况：</label>

        <input name="birth" type="text" value="<%=cure.getRes() %>" >
      </td>
    </tr>

    <tr width="90%">
      <td>
        <label class="control-label1">备注：</label>

        <input name="birth" type="text" value="<%=cure.getOther() %>" >
      </td>
    </tr>

  </table>

</div>

<div class="printDvi" >
  <label>打印预览</label>
  <input type="button" style="margin-left: 100px" class="btn btn-success" value="确认打印"  onclick="myPrint();">
</div>
</body>
</html>
