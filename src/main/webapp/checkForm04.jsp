<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Formdata"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.FormdataDAO"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<%@ page import="com.dao.HibernateSessionFactory" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="com.dao.MyDiv" %>
<%@ page import="com.util.PageUtil" %>
<%request.setCharacterEncoding("UTF-8") ;  %>
<jsp:include page="head.jsp">
	<jsp:param name="title" value="体检项目-04页"></jsp:param>
</jsp:include>

<body style="background-color:#f8f8f8">
<% 
Query query = HibernateSessionFactory.getSession().createQuery("from Formdata f where f.id > 212 and f.id < 238");
	List<Formdata> forms = query.list();
%>
<jsp:include page="tophead.jsp"></jsp:include>

<div class="contentDiv">

   <h3 align="center">体检项目表</h3>
   
   <form class="form-horizontal" id="submitBtn" method="post">
   <div id="legend" class="">
        <legend >第四部分：仪器检查
		</legend>
    </div>
	   
		   <%
			   for(Formdata form:forms){
		   %>

	   <div class="form-group">
		   <label class="col-md-3 control-label" ><%=form.getLabel() %>：</label>
		   <div class="col-md-8">
			   <textarea name="textinput" type="text" placeholder="文本" class="form-control input-md"></textarea>
		   </div>
	   </div>
	   
	   <%}%>

	   <br>
	   <div class="control-group">
		   <div class="controls" style="margin-left: 200px">
			   <input   type="submit"  class="btn btn-success"
						value="&nbsp;提&nbsp;&nbsp;交&nbsp;">
			   &nbsp;&nbsp;
		   </div>
	   </div>
  </form>
  
</div>

<script type="text/javascript">
	
	//alertsubmit.onclick);
</script>
</body>
</html>