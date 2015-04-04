<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<%@ page import="com.dao.*" %>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="java.lang.reflect.Field" %>

<%request.setCharacterEncoding("UTF-8") ;
	if (session.getAttribute("user") == null) {
		response.sendRedirect("login.jsp?type=6");
		return;
	}
	User user = (User) session.getAttribute("user");
	Check01DAO check01DAO = new Check01DAO();
	check01DAO.getSession().clear();
	Check01 check = check01DAO.findById(user.getId());
	check = BeanUtil.getBeanNoNullString(request, Check01.class, check);

%>
<jsp:include page="head.jsp">
	<jsp:param name="title" value="体检项目-01页"></jsp:param>
</jsp:include>

<body style="background-color:#f8f8f8">

<%
List<Formdata> forms = new ArrayList<Formdata>();
FormdataDAO dao = new FormdataDAO();
for(int i=1; i<=31; i++){
	//Formdata form = dao.findById(i);
	//System.out.println(form);
	//forms.add( form );
}

%>
<jsp:include page="tophead.jsp"></jsp:include>
<div class="contentDiv">
<%--<h1 align="center">个人健康状况及家族病史</h1>
   --%>
   <h3 align="center">体检项目表</h3>
   
   <form class="form-horizontal" id="submitBtn" method="post" action="servlet/CheckformSubmit.jsp">
	   <input type="hidden" name="type" value="check01">

   <div id="legend" class="">
        <legend >第一部分：体格检查
        </legend>
    </div>
		<div class="titleDiv">一般项目</div>
	<table width="100%">
	<%for(int i=1; i<=24; i+=2){ Formdata form = dao.findById(i);
		Formdata form2 = dao.findById(i+1);
		String label1 = form.getLabel()+ "(" +form.getUnit() + ")";
		String label2 = form2.getLabel()+ "(" +form2.getUnit() + " )";
		if(form.getUnit().equals("无") || StringUtils.isNullOrEmpty(form.getUnit())){
			label1 = form.getLabel();
		}
		if(form2.getUnit().equals("无") || StringUtils.isNullOrEmpty(form2.getUnit())){
			label2 = form2.getLabel();
		}
		String name1 = form.getName();
		String name2 = form2.getName();
		String val1 = BeanUtil.getField(check.getClass(), name1, check);
		String val2 = BeanUtil.getField(check.getClass(), name2,check);
	%>
		<tr>
			<td >
				<div class="form-group">
				  <label class="col-md-7 control-label" ><%=label1 %></label>
				  <div class="col-md-3">
				  <input  name="<%=name1%>" style="width: 100px;" type="text" placeholder="" class="form-control input-md" value="<%=val1%>">
				  </div>
				</div>
			</td>
			<td width="50%">
				<div class="form-group">
				  <label class="col-md-7 control-label" ><%=label2 %></label>
				  <div class="col-md-3">
				  <input  name="<%=name2%>" style="width: 100px;" type="text" placeholder="" class="form-control input-md" value="<%=val2%>">
				  </div>
				</div>
		    </td>
		</tr>
	<%} %>
		
		</table>
      <div class="titleDiv">其他项目</div>
      <%for(int i=25; i<=31; i++){
    	  Formdata form = dao.findById(i);
    	  
      %>
      <div class="form-group">
				  <label class="col-md-3 control-label" ><%=form.getLabel() %>：</label>  
				  <div class="col-md-8">
				  <textarea name="<%=form.getName()%>" type="text"  class="form-control input-md"><%=BeanUtil.getField(check.getClass(),form.getName(), check).trim()%></textarea>
				  </div>
		</div>
		<%} %>

	   <br>
	   <div class="control-group">
		   <div class="controls" style="margin-left: 200px">
			   <input   type="submit"  class="btn btn-success"
						value="&nbsp;保&nbsp;&nbsp;存&nbsp;">
			   &nbsp;&nbsp;
               <input   type="submit" name="submit"  class="btn btn-link"
                        value="&nbsp;下一页&nbsp;">
		   </div>
	   </div>
  </form>
  
</div>

<script type="text/javascript">
	
</script>
</body>
</html>