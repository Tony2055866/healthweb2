<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Formdata"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.FormdataDAO"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<jsp:include page="head.jsp">
	<jsp:param value="form2" name="title"/>
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

<div class="contentDiv">

   <h1 align="center">基本常规项目</h1>
   
   <form class="form-horizontal" id="submitBtn">
   <div id="legend" class="">
        <legend >第二部分：实验室检查
        </legend>
    </div>
		<div class="titleDiv">基本常规项目</div>
	<table>
	<%for(int i=32; i<76; i+=2){ Formdata form = dao.findById(i);
	Formdata form2 = dao.findById(i+1);
	String label1 = form.getLabel()+ "(" +form.getUnit() + ")"; String label2 = form2.getLabel()+ "(" +form2.getUnit() + " )";
	if( StringUtils.isNullOrEmpty(form.getUnit()) || form.getUnit().equals("无")){
		label1 = form.getLabel();
	}
	if( StringUtils.isNullOrEmpty(form2.getUnit()) || form2.getUnit().equals("无")){
		label2 = form2.getLabel();
	}
	%>
		<tr>
			<td>
				<div class="form-group">
				  <label class="col-md-7 control-label" ><%=label1 %></label>  
				  <div class="col-md-3">
				  <input id="textinput" name="textinput" type="text" placeholder="" class="form-control input-md">
				  </div>
				  kg
				</div>
			</td>
			<td>
				<div class="form-group">
				  <label class="col-md-7 control-label" ><%=label2 %></label>  
				  <div class="col-md-3">
				  <input id="textinput" name="textinput" type="text" placeholder="" class="form-control input-md">
				  </div>
				</div>
		    </td>
		</tr>
	<%} %>
		</table>
     
  </form>
  
</div>

<script type="text/javascript">
	
	//alertsubmit.onclick);
</script>
</body>
</html>