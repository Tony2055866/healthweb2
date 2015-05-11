<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="com.dao.User"%>
<%@page import="com.util.PageUtil"%>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="com.dao.CureDAO" %>
<%@ page import="com.dao.Cure" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>治疗情况</title>

	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<link href="topmenu.css" rel="stylesheet">

	<link href="http://cdn.bootcss.com/twitter-bootstrap/2.0.4/css/bootstrap.min.css" rel="stylesheet">
	<link href="http://cdn.bootcss.com/twitter-bootstrap/2.0.4/css/bootstrap-responsive.min.css" rel="stylesheet">
	<script src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/twitter-bootstrap/2.0.4/bootstrap.min.js"></script>
	<script src="boots/js/date1.js"></script>
	<script src="boots/js/date2.js"></script>
	<link href="boots/css/date.css" rel="stylesheet">
	<script type="text/javascript">
		<% if("success".equals( request.getParameter("result")) ){ %>
		alert("操作成功！");
		<% }else if("success".equals( request.getParameter("result"))){ %>
		alert("操作失败！");
		<%}%>

		function nextClick(){
			document.getElementById("myform").submit();
		}
	</script>
	<style type="text/css">
		.titleDiv{
			background: #eff1f3;
			font-size: 14px;
		}
		.contentDiv{
			width: 860px; margin-left: auto; margin-right: auto;
			background: #ffffff;
			padding: 20px;
			border: 1px solid #ddd;
			margin-top: 20px;
			margin-bottom: 20px;
		}
		.next-step {
			background: #5cb85c;
			display: inline-block;
			width: 400px;
			height: 44px;
			line-height: 44px;
			color: #fff;
			margin-left: 20px;
			*margin-left: 0;
			border: 0;
		}
	</style>
</head>
<body style="background-color:#f8f8f8">
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("check.jsp : " +session.getAttribute("user"));
	if( session.getAttribute("user") == null ){
		response.sendRedirect("login.jsp?errortype=4");
		return;
	}
	User user = (User)session.getAttribute("user") ;
	user = BeanUtil.getBeanNoNullString(request, User.class, user);
	CureDAO cureDAO = new CureDAO();
	cureDAO.getSession().clear();
	Cure cure = cureDAO.findById(user.getId());
	cure = BeanUtil.getBeanNoNullString(request, Cure.class, cure);

%>

<jsp:include page="tophead.jsp"></jsp:include>
<div class="contentDiv">

	<form class="form-horizontal" id="myform" method="POST" action="servlet/CureSubmit.jsp">
		<fieldset>
			<h4 style="margin-left: 200px">治疗情况: &nbsp;<%=user.getNameZh()%></h4><hr>
			<div class="control-group">
				<label class="control-label">治疗时间</label>
				<div class="controls input-append date form_date" style="margin-left:20px; "
					 data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
					<input name="time"  type="text" value="<%=cure.getTime() %>" readonly >
					<span class="add-on"><i class="icon-th"></i></span>
				</div>
				<input type="hidden" name="birth" id="dtp_input2" value="<%=cure.getTime() %>" required/><br/>
			</div>
			<script type="text/javascript">
				$('.form_date').datetimepicker({
					language:'cn',
					weekStart: 1,
					autoclose: 1,
					startView: 2,
					minView: 2,
					forceParse: 0,
					initialDate:"2015-01-01",
					pickerPosition: "left-bottom"
				});
			</script>



			<div class="control-group">
				<label class="control-label" >治疗医院：</label>
				<div class="controls">
					<input type="text"   value="<%=cure.getAddress() %>" name="address" required class="input-xlarge">
				</div>
			</div>

			<div class="control-group">

				<!-- Text input-->
				<label class="control-label" >治疗科室：</label>
				<div class="controls">
					<input type="text" name="cate" value="<%=cure.getCate() %>" class="input-xlarge" required>
					<p class="help-block"></p>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">主治医师：</label>
				<div class="controls">
					<input type="text" value="<%=cure.getDoc() %>" name="doc" placeholder="" class="input-xlarge" required>
					<p class="help-block"></p>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">治疗情况：</label>
				<div class="controls">
					<input type="text" value="<%=cure.getRes() %>" name="res" placeholder="" class="input-xlarge" required>
					<p class="help-block"></p>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">备注：</label>
				<div class="controls">
					<input type="text" value="<%=cure.getOther() %>" name="other" placeholder="" class="input-xlarge" required>
					<p class="help-block"></p>
				</div>
			</div>
		</fieldset>

		<div class="control-group">
			<div class="controls">
				<input   type="submit" name="submit"  class="btn btn-success"
						 value="&nbsp;保&nbsp;&nbsp;存&nbsp;">

			</div>
		</div>

	</form>

</div>

</body>
</html>