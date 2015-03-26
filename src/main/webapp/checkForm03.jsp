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
	<jsp:param name="title" value="体检项目-03页"></jsp:param>
</jsp:include>

<body style="background-color:#f8f8f8">
<% 
	String tt= "abc";
Query query = HibernateSessionFactory.getSession().createQuery("from Formdata f where f.id > 77 and f.id < 212");
	List<Formdata> forms = query.list();
	String last = "";
	
	List<MyDiv> divs = new ArrayList<MyDiv>();
	for(Formdata form : forms){
		if( !last.equals(form.getOther1())){
			MyDiv myDiv = new MyDiv();
			divs.add(myDiv);
			myDiv.title = form.getOther1();
			last = form.getOther1();
			myDiv.forms.add(form);
		}else{
			divs.get(divs.size()-1).forms.add(form);
			
		}
		if(form.getType().equals("num"))
			form.setType("number");
		if(form.getUnit().equals("无"))
			form.setUnit("");
		if(form.getLabel() == null || form.getLabel().trim().equals(""))
			form.setLabel( last );
	}
	
	System.out.println("divs.size() : " + divs.size());
	
%>
<jsp:include page="tophead.jsp"></jsp:include>

<div class="contentDiv">

   <h3 align="center">体检项目表</h3>
   
   <form class="form-horizontal" id="submitBtn" method="post">
   <div id="legend" class="">
        <legend >第三部分：实验室血液检验
		</legend>
    </div>
	   
	   <div class="titleDiv">血型</div>
	   <div class="row">
		   <label class="col-sm-3 control-label">血型ABO正反定型:</label>
		   <div class="col-sm-7">
			   <select class="input required-xlarge" style="width: 160px; height:2em;" name="labxone0" >
				   <%
					   out.println(PageUtil.getOptions(new String[]{"O型", "A型", "B型", "AB型"},
							   "")); %>
			   </select>
		   </div>
	   </div>
	   
	   <% for(int i=0; i<divs.size(); i++){
		   MyDiv div = divs.get(i);
		   int width = 100;
		   int md2 = 3;
		   if(div.forms.size() == 1){
			   width = 500;
			   md2= 7;
		   }
	   %>
	   <div class="titleDiv"> <%=div.title%></div>
	   <table width="100%">
		   <% for(int j=0; j<div.forms.size(); j+=2){ 
		   		Formdata form1 = div.forms.get(j);
			  	String ph1 = form1.getType().equals("text") ? "文本":"数值";
		   %>
		   <tr>
			   
			   <td>
				   <div class=" row">
					   <label class="col-md-5 control-label" style="width: 200px"><%=form1.getLabel() %></label>
					   <div class=" col-md-<%=md2%>">
						   <input name="textinput" style="width: <%=width%>px" placeholder="<%=ph1%>"
								  type="<%=form1.getType()%>" placeholder="" class="form-control input-md">
						   
					   </div>
					   <% if( !form1.getUnit().equals("") ){ %>
					   <div class=" col-md-1" style="width: 80px;padding: 3px 4px 3px 10px;"><%=form1.getUnit()%></div>
					   <%}%>
					   <!-- kg -->
				   </div>
			   </td>
			   
			   <%if(j+1 < div.forms.size()){
				   Formdata form2 = div.forms.get(j+1);
				   String ph2 = form2.getType().equals("text") ? "文本":"数值";
			   %>
				   <td>
					   <div class="form-group">
						   <label class="col-md-5 control-label" style="width: 200px"><%=form2.getLabel() %></label>
						   <div class=" col-md-3">
							   <input  name="textinput" style="width: 100px" placeholder="<%=ph2%>"
									   type="<%=form2.getType()%>" placeholder="" class="form-control input-md">
							  
						   </div> 
						   <% if( !form2.getUnit().equals("") ){ %>
						  	 <span class=" col-md-1" style="width: 80px;padding: 3px 4px 3px 10px;"><%=form2.getUnit()%></span>
						   <%}%>
					   </div>
				   </td>
			   <%}%>
		   </tr>
		   
		   <%}%>
	   </table>
	   
	   <%}%>

	   <br>
	   <div class="control-group">
		   <div class="controls" style="margin-left: 200px">
			   <input   type="submit"  class="btn btn-success"
						value="&nbsp;保&nbsp;&nbsp;存&nbsp;">
			   &nbsp;&nbsp;
			   <a class="button-link"  href="checkForm04.jsp" role="button">下一页</a>
		   </div>
	   </div>
  </form>
  
</div>

<script type="text/javascript">
	
	//alertsubmit.onclick);
</script>
</body>
</html>