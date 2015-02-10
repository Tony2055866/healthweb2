<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Formdata"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.FormdataDAO"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<jsp:include page="head.jsp"></jsp:include>

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

<div class="contentDiv">
<%--<h1 align="center">个人健康状况及家族病史</h1>
   --%>
   <h1 align="center">体检项目表</h1>
   
   <form class="form-horizontal" id="submitBtn">
   <div id="legend" class="">
        <legend >第一部分：体格检查
        </legend>
    </div>
		<div class="titleDiv">一般项目</div>
	<table>
	<%for(int i=1; i<=24; i+=2){ Formdata form = dao.findById(i);
	Formdata form2 = dao.findById(i+1);
	String label1 = form.getLabel()+ "(" +form.getUnit() + ")"; String label2 = form2.getLabel()+ "(" +form2.getUnit() + " )";
	if(form.getUnit().equals("无") || StringUtils.isNullOrEmpty(form.getUnit())){
		label1 = form.getLabel();
	}
	if(form2.getUnit().equals("无") || StringUtils.isNullOrEmpty(form2.getUnit())){
		label2 = form2.getLabel();
	}
	%>
		<tr>
			<td>
				<div class="form-group">
				  <label class="col-md-6 control-label" for="textinput"><%=label1 %></label>  
				  <div class="col-md-6">
				  <input id="textinput" name="textinput" type="text" placeholder="" class="form-control input-md">
				  </div>
				</div>
			</td>
			<td>
				<div class="form-group">
				  <label class="col-md-6 control-label" for="textinput"><%=label2 %></label>  
				  <div class="col-md-6">
				  <input id="textinput" name="textinput" type="text" placeholder="" class="form-control input-md">
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
				  <label class="col-md-3 control-label" for="textinput"><%=form.getLabel() %>：</label>  
				  <div class="col-md-8">
				  <textarea id="textinput" name="textinput" type="text" placeholder="" class="form-control input-md"></textarea>
				  </div>
		</div>
		<%} %>
		
  </form>
  
</div>

<script type="text/javascript">
	
	//alertsubmit.onclick);
</script>
</body>
</html>