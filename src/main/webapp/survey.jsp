<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.User"%>
<%@page import="com.util.PageUtil"%>
<%@ page import="com.util.BeanUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="http://cdn.bootcss.com/twitter-bootstrap/2.0.4/css/bootstrap.min.css" rel="stylesheet">
		<link href="http://cdn.bootcss.com/twitter-bootstrap/2.0.4/css/bootstrap-responsive.min.css" rel="stylesheet">
   <script src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/twitter-bootstrap/2.0.4/bootstrap.min.js"></script>
<script src="boots/js/date1.js"></script>
<script src="boots/js/date2.js"></script>
	<link href="boots/css/date.css" rel="stylesheet">
<script type="text/javascript">


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
%>
<div class="contentDiv">
<br><br>
<h1 align="center">个人健康状况及生活方式问卷</h1>
<p>尊敬的先生/女士：<br>
您好!<br>
本问卷是这次健康管理的重要组成部分，旨在对您的健康状况进行全面的评估。为了使您的评估结果更为可靠，请您尽可能按实际情况完整填写。通过评估，您将获得健康风险信息提示和几种常见病发病风险预测报告。
为保持信息的完整和准确，请不要用铅笔填写，尽量保持字迹清晰，不缺项漏项。谢谢您的合作！
</p>

<form class="form-horizontal" method="POST" action="servlet/SurveySubmit.jsp">
    <fieldset>
      <div id="legend" class="">
        <legend >第一部分：一般信息
        </legend>
      </div>
	<input name="type" value="survey" type="hidden">
    <div class="control-group">
          <!-- Text input-->
          <label class="control-label" >姓名</label>
          <div class="controls">
            <input type="text" name="nameZh" value="<%=user.getNameZh() %>" required placeholder="输入姓名" class="input-xlarge">
          </div>
        </div>
        
        <div class="control-group">
          <label class="control-label">性别</label>
          <div class="controls">
      <!-- Multiple Radios -->
		      <label class="radio inline">

		      <%String check1 = user.getGender().equals("男") ? "checked=\"checked\"":"";%>
		      <%String check2 = user.getGender().equals("女") ? "checked=\"checked\"":"";%>
		        <input type="radio" name="gender" required value="男" <%=check1 %>>
		        男
		      </label>
		      <label class="radio inline">
		        <input type="radio" name="gender"  required value="女" >
		        女
		      </label>
		  </div>
        </div>

		<div class="control-group">
          <!-- Text input-->
          <label class="control-label" for="company">工作单位</label>
          <div class="controls">
            <input type="text" name="company" value="<%=user.getCompany() %>" required  class="input-xlarge">
          </div>
        </div>
   
    <div class="control-group">
          <!-- Select Basic -->
          <label class="control-label">民族</label>
          <div class="controls">
            <select class="input-xlarge" name="nation" >
                <% out.println( PageUtil.getOptions(new String[]{"汉族","壮族","满族","回族","其他"}, user.getNation())); %>

             </select>
          </div>

        </div>

 	<div class="control-group">
          <label class="control-label" >贯籍</label>
          <div class="controls">
            <input type="text"  placeholder="贯籍" value="<%=user.getHome() %>" class="input-xlarge" name="home" required>
          </div>
        </div>

	    <div class="control-group">
                <label class="control-label">出生日期</label>
                <div class="controls input-append date form_date" style="margin-left:20px; "
                 data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input name="birth"  type="text" value="<%=user.getBirth() %>" readonly >
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
				<input type="hidden" name="birth" id="dtp_input2" value="<%=user.getBirth() %>" required/><br/>
            </div>
        <script type="text/javascript">
            $('.form_date').datetimepicker({
                language:'cn',
                weekStart: 1,
                autoclose: 1,
                startView: 2,
                minView: 2,
                forceParse: 0,
                initialDate:"1990-01-01",
                pickerPosition: "top-right"
            });
        </script>

    <div class="control-group">

          <!-- Select Basic -->
          <label class="control-label">职业</label>
          <div class="controls">
            <select class="input-xlarge" name="job">
            	<%out.println( PageUtil.getOptions(new String[]{"行政人员","自由职业者",
            			"技术人员","专职司机","专职司机","特殊行业工人","在校学生","家庭主妇","其他"}, user.getJob()) ); %>
            </select>
          </div>

        </div>


    <div class="control-group">

          <!-- Select Basic -->
          <label class="control-label">文化程度</label>
          <div class="controls">
            <select class="input-xlarge" name="education">
      		<%out.println( PageUtil.getOptions(new String[]{"高中及以下","大专","本科","硕士及以上"}, user.getEducation()) ); %>
      </select>
        </div>
	</div>
	
    <div class="control-group">
          <label class="control-label">婚姻状况</label>
          <div class="controls">
     <select class="input-xlarge" name="marriage">
      <%out.println( PageUtil.getOptions(new String[]{"未婚","未婚","离异","丧偶","其它"}, user.getMarriage()) ); %>
      </select>
  </div>
        </div>
        
        <div class="control-group">
          <label class="control-label" >通讯地址</label>
          <div class="controls">
            <input type="text"  placeholder="xx省xx市xx区xx路xx号" value="<%=user.getAddress() %>" name="address" required class="input-xlarge">
          </div>
        </div>

        <div class="control-group">

          <!-- Text input-->
          <label class="control-label" >手机</label>
          <div class="controls">
            <input type="text" name="phone" placeholder="手机号" value="<%=user.getPhone() %>" class="input-xlarge" required>
            <p class="help-block"></p>
          </div>
        </div>
        
        <div class="control-group">
          <label class="control-label" for="input01">Email</label>
          <div class="controls">
            <input type="text" value="<%=user.getEmail() %>" name="email" placeholder="" class="input-xlarge" required>
            <p class="help-block"></p>
          </div>
        </div>
    </fieldset>
    
    	<div class="control-group">
          <div class="controls">
            <input   type="submit"  class="btn btn-success" 
         value="&nbsp;保&nbsp;&nbsp;存&nbsp;">
         	&nbsp;&nbsp;
         	<a class=""  href="survey_health.jsp" role="button">下一页</a>
          </div>
        </div>
    
  </form>

</div>

</body>
</html>