<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Formdata"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.FormdataDAO"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<%request.setCharacterEncoding("UTF-8") ;  %>
<jsp:include page="head.jsp">
	<jsp:param name="title" value="体检项目-02页"></jsp:param>
</jsp:include>

<body style="background-color:#f8f8f8">

<%
List<Formdata> forms = new ArrayList<Formdata>();
FormdataDAO dao = new FormdataDAO();


%>
<jsp:include page="tophead.jsp"></jsp:include>

<div class="contentDiv">

   <h3 align="center">体检项目表</h3>
   
   <form class="form-horizontal" id="submitBtn" method="post">
   <div id="legend" class="">
        <legend >第二部分：实验室检查
        </legend>
    </div>
		<div class="titleDiv">基本常规项目</div>
	<table width="100%">
	<%for(int i=32; i<77; i+=2){
		Formdata form = dao.findById(i);
		Formdata form2 = dao.findById(i+1);
		if(form.getType().equals("num")) form.setType("number");
		if(form2.getType().equals("num")) form2.setType("number");
		
		String label1 = form.getLabel() ; //+ "(" +form.getUnit() + ")";
		String label2 = form2.getLabel(); //+ "(" +form2.getUnit() + " )";
		String unit1 = form.getUnit();
		String unit2 = form2.getUnit();
		
		String ph1 = form.getType().equals("text") ? "文本":"数值";
		String ph2 = form2.getType().equals("text") ? "文本":"数值";
	if( StringUtils.isNullOrEmpty(form.getUnit()) || form.getUnit().equals("无")){
		label1 = form.getLabel();
		unit1 = "";
	}
	if( StringUtils.isNullOrEmpty(form2.getUnit()) || form2.getUnit().equals("无")){
		label2 = form2.getLabel();
		unit2 = "";
	}
	%>
		<tr>
			<td>
				<div class="row">
				  <label class="col-md-5 control-label" ><%=label1 %></label>
				  <div class="col-md-4">
				  <input name="textinput" type="<%=form.getType()%>"  placeholder="<%=ph1%>"
						 placeholder="" class="form-control input-md" /> 
				 </div> <span style="height: 2em; line-height: 2em"><%=unit1%></span>
					<!-- kg -->
				</div>
			</td>
			<%if(i+1 < 77){%>
			<td>
				<div class="form-group">
				  <label class="col-md-5 control-label" ><%=label2 %></label>
				  <div class="col-md-4">
				  <input  name="textinput" type="<%=form2.getType()%>"  placeholder="<%=ph2%>"
						  placeholder="" class="form-control input-md">
				  </div> <span style="height: 2em; line-height: 2em"><%=unit2%></span>
				</div>
		    </td>
			<%}%>
		</tr>
	<%} %>
		</table>

	   <br>
	   <div class="control-group">
		   <div class="controls" style="margin-left: 200px">
			   <input   type="submit"  class="btn btn-success"
						value="&nbsp;保&nbsp;&nbsp;存&nbsp;">
			   &nbsp;&nbsp;
			   <a class="button-link"  href="checkForm03.jsp" role="button">下一页</a>
		   </div>
	   </div>
  </form>
  
</div>

<script type="text/javascript">
	
	//alertsubmit.onclick);
</script>
</body>
</html>