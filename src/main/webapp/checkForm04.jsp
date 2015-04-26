<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<%@ page import="org.hibernate.Query" %>
<%@ page import="com.util.PageUtil" %>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="com.dao.*" %>
<%request.setCharacterEncoding("UTF-8") ;  %>
<jsp:include page="head.jsp">
	<jsp:param name="title" value="体检项目-04页"></jsp:param>
</jsp:include>

<body style="background-color:#f8f8f8">
<%
	request.setCharacterEncoding("UTF-8") ;
	if (session.getAttribute("user") == null) {
		response.sendRedirect("login.jsp?type=6");
		return;
	}
	User user = (User) session.getAttribute("user");
	Check04DAO check04DAO = new Check04DAO();
	check04DAO.getSession().clear();
	Check04 check = check04DAO.findById(user.getId());
	check = BeanUtil.getBeanNoNullString(request, Check04.class, check);

Query query = HibernateSessionFactory.getSession().createQuery("from Formdata f where f.id > 212 and f.id < 238");
	List<Formdata> forms = query.list();
%>
<jsp:include page="tophead.jsp"></jsp:include>

<div class="contentDiv">

   <h3 align="center">体检项目表</h3>
   
   <form class="form-horizontal" id="submitBtn" method="post" action="servlet/CheckformSubmit.jsp">
	   <input type="hidden" name="type" value="check04">
   <div id="legend" class="">
        <legend >第四部分：仪器检查
		</legend>
    </div>
		   <%
			   for(Formdata form:forms){
				   String val1 = BeanUtil.getField(check.getClass(), form.getName(), check);
		   %>
	   <div class="form-group">
		   <label class="col-md-3 control-label" ><%=form.getLabel() %>：</label>
		   <div class="col-md-8">
			   <textarea name="<%=form.getName()%>" type="text" placeholder="文本"
						 class="form-control input-md"><%=val1%></textarea>
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