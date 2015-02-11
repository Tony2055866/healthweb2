<%@page import="com.util.BeanUtil"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.dao.User"%>
<%@page import="com.dao.SurveyEatDAO"%>
<%@page import="com.dao.SurveyEat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="head.jsp">
	<jsp:param value="survey page3" name="title"/>
</jsp:include>
<body >
<%
if( session.getAttribute("user") == null ){
	response.sendRedirect("login.jsp?type=6");
	return;
}
User user = (User)session.getAttribute("user");
SurveyEatDAO eatDao = new SurveyEatDAO();
	eatDao.getSession().clear();
SurveyEat eat = eatDao.findById(user.getId());
eat = BeanUtil.getBeanNoNullString(request, SurveyEat.class, eat);
String eatJson = new Gson().toJson(eat);
%>
 <script type="text/javascript">
 var eat = <%=eatJson%>;
 $(function(){
	 updatePage(eat);
 });
	 function changeRadio(o){
		if(arguments.length > 0){
			var showDiv = window.document.getElementById(arguments[0]);
			$(showDiv).show(500);
		}
		 if(arguments.length > 1){
			 var div = window.document.getElementById(arguments[1]);
			 $(div).hide(500);
		 }
		 if(arguments.length > 2){
			 var div = window.document.getElementById(arguments[2]);
			 $(div).hide(500);
		 }
	 }
 </script>
<div class="contentDiv">
	<h1 align="center">个人健康状况及生活方式问卷</h1>
   <form class="form-horizontal" id="submitBtn" method="POST" action="<%=request.getContextPath()%>/servlet/SurveySubmit.jsp">
   <input type="hidden" value="survey_eat" name="type">
   <legend >第三部分：饮食习惯和生活方式
        </legend>
        <!-- 饮食习惯 -->
        <% 
        String labelseat[] ={"谷类(大米，面食,杂粮)","肉类(猪,牛羊,家禽)","鱼类或其他水产品","新鲜蔬菜和水果","牛奶及奶制品",
        "蛋类及其制品","豆类及豆制品","甜食(甜点,糖果等)",
        "油炸食品","腌、熏类食物","谷类(大米,面食,杂粮)",
        "肉类(猪,牛羊,家禽)","新鲜蔬菜和水果类"};
        String nameseat[] = {"eat01","eat02","eat03","eat04","eat05",
        "eat06","eat07","eat08","eat09","eat10","eath01","eath02","eath03"};
        String[][] options = {{"12两以上","5-11两","2-4两","1两以下"},
        {"4两以上","2-3两","1两以下","基本不吃"},{"10两以上","5-9两","4两以下","基本不吃"} };
        %>
        <div class="titleDiv">一般情况下，您平均每周有几天吃下列食物?</div>
        <fieldset>
        <%for(int i=0; i<10; i++){%>
        <div class="row">
        <label  class="col-sm-4 control-label"><%=labelseat[i] %></label>
        <div class="col-sm-8">
        <label class="radio-inline"> <input type="radio" name="<%=nameseat[i] %>"  value="5-7天" >5-7天 </label>
        <label class="radio-inline"> <input type="radio" name="<%=nameseat[i] %>"  value="3-4天" >3-4天 </label>
        <label class="radio-inline"> <input type="radio" name="<%=nameseat[i] %>"  value="1-2天">1-2天 </label>
        <label class="radio-inline"> <input type="radio" name="<%=nameseat[i] %>"  value="小于1天">小于1天 </label>
        </div>
        </div>
        <%} %>
        </fieldset>
        
        <div class="titleDiv">一般情况下，您平均每周有几天吃下列食物?</div>
        <fieldset>
	        <%for(int i=10; i<13; i++){%>
	        <div class="row">
	        <label  class="col-sm-4 control-label"><%=labelseat[i] %></label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="<%=nameseat[i] %>"  value="<%=options[i-10][0] %>" ><%=options[i-10][0] %> </label>
	        <label class="radio-inline"> <input type="radio" name="<%=nameseat[i] %>"  value="<%=options[i-10][1] %>" ><%=options[i-10][1] %> </label>
	        <label class="radio-inline"> <input type="radio" name="<%=nameseat[i] %>"  value="<%=options[i-10][2] %>"><%=options[i-10][2] %> </label>
	        <label class="radio-inline"> <input type="radio" name="<%=nameseat[i] %>"  value="<%=options[i-10][3] %>"><%=options[i-10][3] %> </label>
	        </div>
	        </div>
        <%} %>
        	<div class="row"><div class="titleDiv">您的口味与周围的人相比如何？</div>
        	</div>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="eatt"  value="很淡" >很淡</label>
	        <label class="radio-inline"> <input type="radio" name="eatt"  value="略淡" >略淡</label>
	        <label class="radio-inline"> <input type="radio" name="eatt"  value="相同">相同</label>
	        <label class="radio-inline"> <input type="radio" name="eatt"  value="略咸">略咸</label>
	        <label class="radio-inline"> <input type="radio" name="eatt"  value="很咸">很咸</label>
	        </div>
	     </fieldset>
	     
        <div class="titleDiv">吸烟情况</div>
        <fieldset>
       	  <label  class="col-sm-4 control-label">您是否吸烟？</label>
       	  <div class="col-sm-6">
       	  <label class="radio-inline"> <input type="radio" name="isXiyan"  value="是" onclick="changeRadio('isXiyanDiv','isXiyanNo','isXiyanJie');">是</label>
       	  <label class="radio-inline"> <input type="radio" name="isXiyan"   value="否" onclick="changeRadio('isXiyanNo','isXiyanDiv','isXiyanJie');">否</label>
       	   <label class="radio-inline"> <input type="radio" name="isXiyan"   value="已戒" onclick="changeRadio('isXiyanJie','isXiyanNo','isXiyanDiv');">已戒</label>
       	   </div>
        </fieldset>
	   <%
		   String div1 = "none",div2="none",div3="none";
		   if(eat.getIsXiyan().equals("是"))
			   div1 = "block";
		   else if(eat.getIsXiyan().equals("否"))
			   div2 = "block";
		   else if(eat.getIsXiyan().equals("已戒"))
			   div3 = "block";
	   %>
        <div id="isXiyanDiv" style="display: <%=div1%>">
        	<div class="row">
	        <label  class="col-sm-4 control-label">您主要抽哪种类型的烟?</label>
	        <div class="col-sm-6">
		        <label class="radio-inline"> <input type="radio" name="zhuyaoChou"  value="卷烟" >卷烟</label>
		        <label class="radio-inline"> <input type="radio" name="zhuyaoChou"  value="雪茄" >雪茄</label>
		        <label class="radio-inline"> <input type="radio" name="zhuyaoChou"  value="烟丝">烟丝</label>
	        </div>
	        </div>
	        <div class="row">
	        <label  class="col-sm-4 control-label">您平均每天吸多少支香烟?</label>
	        <div class="col-md-2">
			  <input id="name" name="howManyYan" type="number" min="1" placeholder="" class="form-control input-md" >
			  </div>
	        </div>
	        <div class="row">
	        <label  class="col-sm-4 control-label">您多少岁开始吸烟的?</label>
	        <div class="col-md-2">
			  <input id="name" name="whenXiYan" type="number" min="1" placeholder="" class="form-control input-md" >
			  </div>
	        </div>
        </div>
        
        <div id="isXiyanNo" style="display: <%=div2%>">
        	<div class="row">
	        <label  class="col-sm-4 control-label">您工作场所或居住场所有人吸烟吗?</label>
	        <div class="col-sm-6">
		        <label class="radio-inline"> <input type="radio" name="hasOtherChou"  value="有" >有</label>
		        <label class="radio-inline"> <input type="radio" name="hasOtherChou"  value="没有" >没有</label>
	        </div>
	        </div>
        </div>
        
        <div id="isXiyanJie" style="display: <%=div3%>">
        	<div class="row">
	        <label  class="col-sm-4 control-label">您多少岁开始吸烟的?</label>
	        <div class="col-sm-2">
		       		<input id="name" name="whenXiYan" type="number" min="1" placeholder="" class="form-control input-md" >
	        </div>
	        </div>
	        
	        <div class="row">
	        <label  class="col-sm-4 control-label">您多少岁戒的烟?</label>
	        <div class="col-sm-2">
		       		<input id="name" name="whenJieYan" type="number" min="1" placeholder="" class="form-control input-md" >
	        </div>
	        </div>
	        
	        <div class="row">
	        <label  class="col-sm-4 control-label">戒烟前，您平均每天吸多少支香烟?</label>
	        <div class="col-sm-2">
		       		<input id="name" name="howManyYan" type="number" min="1" placeholder="" class="form-control input-md" >
	        </div>
	        </div>
	       
        	<div class="row">
		        <label  class="col-sm-4 control-label">您工作场所或居住场所所有人吸烟吗?</label>
		        <div class="col-sm-6">
			        <label class="radio-inline"> <input type="radio" name="hasOtherChou"  value="有" >没有</label>
			        <label class="radio-inline"> <input type="radio" name="hasOtherChou"  value="有" >没有</label>
		        </div>
	        </div>
        </div>
        
        <div class="titleDiv">饮酒情况</div>
        <fieldset>
        	<div class="row">
		        <label  class="col-sm-4 control-label">您饮酒吗?</label>
		        <div class="col-sm-6">
			        <label class="radio-inline"> <input type="radio" name="isdrink"  value="不喝" >不喝</label>
			        <label class="radio-inline"> <input type="radio" name="isdrink"  value="以前喝、现在不喝" >以前喝、现在不喝</label>
			        <label class="radio-inline"> <input type="radio" name="isdrink"  value="喝酒" >喝酒</label>
		        </div>
	        </div>
	        
	        <div id="ifHeJiuDiv">
		        <div class="row">
			        <label  class="col-sm-4 control-label">您一般多长时间喝一次酒?</label>
			        <div class="col-sm-8">
				        <label class="radio-inline"> <input type="radio" name="howlongDrink"  value="每天2次" >每天2次</label>
				        <label class="radio-inline"> <input type="radio" name="howlongDrink"  value="每天1次" >每天1次</label>
				        <label class="radio-inline"> <input type="radio" name="howlongDrink"  value="每周3-4次" >每周3-4次</label>
				        <label class="radio-inline"> <input type="radio" name="howlongDrink"  value="每周1-2次" >每周3-4次</label>
				        <label class="radio-inline"> <input type="radio" name="howlongDrink"  value="每周&lt;次" >每周&lt;1次</label>
			        </div>
		        </div>
	        	
	        	<div class="row"><label  class="col-sm-5 control-label">您通常每次饮多少酒(只填写您常喝的酒)?</label></div>
		        <div class="row">
			        <label  class="col-sm-2 control-label">白酒(两)</label>
			        <div class="col-sm-2">
			       		<input id="name" name="howmuchDrink1" type="number" min="1" placeholder="" class="form-control input-md" >
			        </div>
			        <label  class="col-sm-2 control-label">葡萄酒/黄酒(两)</label>
			        <div class="col-sm-2">
			       		<input id="name" name="howmuchDrink2" type="number" min="1" placeholder="" class="form-control input-md" >
			        </div>
			        <label  class="col-sm-2 control-label">啤酒(瓶)</label>
			        <div class="col-sm-2">
			       		<input id="name" name="howmuchDrink3" type="number" min="1" placeholder="" class="form-control input-md" >
			        </div>
		        </div>
		        
		        <div class="row">
			        <label  class="col-sm-4 control-label">如果一天不喝酒，您会感到不舒服吗?</label>
			        <div class="col-sm-6">
				        <label class="radio-inline"> <input type="radio" name="ismustDrink"  value="会" >会</label>
				        <label class="radio-inline"> <input type="radio" name="ismustDrink"  value="不会" >不会</label>
			        </div>
		        </div>
	        </div>
        </fieldset>
        
        <div class="titleDiv">体力活动及体育锻炼</div>
        <fieldset>
        	<div class="row">
			        <label  class="col-sm-4 control-label">工作性质</label>
			        <div class="col-sm-8">
				        <label class="radio-inline"> <input type="radio" name="work"  value="静坐为主" >静坐为主</label>
				        <label class="radio-inline"> <input type="radio" name="work"  value="轻度活动" >轻度活动</label>
			        	<label class="radio-inline"> <input type="radio" name="work"  value="体力劳动" >体力劳动</label>
			        </div>
		    </div>
		    
		    <div class="row">
			        <label  class="col-sm-4 control-label">上班交通</label>
			        <div class="col-sm-8">
				        <label class="radio-inline"> <input type="radio" name="jiaotong" id="jiaotong2" value="步行或骑车" onclick="checkYes(this);">步行或骑车</label>
				        <label class="radio-inline"> <input type="radio" name="jiaotong" id="jiaotong1" value="乘公交车或班车" onclick="checkYes(this);">乘公交车或班车</label>
			        	<label class="radio-inline"> <input type="radio" name="jiaotong" id="jiaotong3" value="自驾车" onclick="checkYes(this);">自驾车</label>
			        	<label class="radio-inline"> <input type="radio" name="jiaotong" id="jiaotong4" value="家庭办公" onclick="checkYes(this);">家庭办公</label>
			        </div>
			        
			       
		    </div>
		    
		     <div id="jiaotongDiv" style="display: none">
			        <label for="jiaotongTime" class="col-sm-8 control-label">如果步行或骑车，每次大概要多长时间?</label>
			        <label class="radio-inline"> <input type="radio" name="jiaotong0"  value="小于20分钟" >小于20分钟</label>
			        <label class="radio-inline"> <input type="radio" name="jiaotong0"  value="大于20分钟" >大于20分钟</label>
		        	</div>
		    
		    <div class="row">
			        <label  class="col-sm-4 control-label">干家务活</label>
			        <div class="col-sm-8">
				        <label class="radio-inline"> <input type="radio" name="jiawu" value="步行或骑车" >从不</label>
				        <label class="radio-inline"> <input type="radio" name="jiawu"  value="乘公交车或班车" >偶尔</label>
			        	<label class="radio-inline"> <input type="radio" name="jiawu"  value="自驾车" >经常</label>
			        </div>
		    </div>
		    
		    <div class="row">
			        <label  class="col-sm-4 control-label">体育锻炼</label>
			        <div class="col-sm-8">
				        <label class="radio-inline"> <input type="radio" name="jiawu" value="步行或骑车" >从不</label>
				        <label class="radio-inline"> <input type="radio" name="jiawu"  value="乘公交车或班车" >偶尔</label>
			        	<label class="radio-inline"> <input type="radio" name="jiawu"  value="自驾车" >经常</label>
			        </div>
		    </div>
		    
		    <div class="row">
			        <label  class="col-sm-4 control-label">近年来，您参加每次持续20分钟以上的体育锻炼吗?</label>
			        <div class="col-sm-8">
				        <label class="radio-inline"> <input type="radio" name="tiyu01" value="否" onclick="$('#tiyu01Div').hide(500);">否</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu01"  value="是" onclick="$('#tiyu01Div').show(500);">是</label>
			        </div>
		    </div>
		    <div id="tiyu01Div" style="display: none">
		    	<div class="row">
			        <label  class="col-sm-4 control-label">您平均每周锻炼多少次?</label>
			        <div class="col-sm-8">
				        <label class="radio-inline"> <input type="radio" name="tiyu02" value="3次或以上" >3次或以上</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu02"  value="1-2次" >1-2次</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu02"  value="小于1次" >小于1次</label>
			        </div>
		    	</div>
		    	
		    	<div class="row">
			        <label  class="col-sm-4 control-label">您平均每次锻炼的时间是?</label>
			        <div class="col-sm-8">
				        <label class="radio-inline"> <input type="radio" name="tiyu03" value="&rt;60分钟" >&gt;60分钟</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu03"  value="30-60分钟" >30-60分钟</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu03"  value="&lt;30分钟" >&lt;30分钟</label>
			        </div>
		    	</div>
		    	
		    	<div class="row">
			        <label  class="col-sm-4 control-label">您常用的体育锻炼方式是什么?</label>
			        <div class="col-sm-8">
				        <label class="radio-inline"> <input type="radio" name="tiyu04" value="&rt;60分钟" >散步/快走</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu04"  value="跑步" >跑步</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu04"  value="游泳" >游泳</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu04"  value="球类" >球类</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu04"  value="室内健身" >室内健身</label>
				        <label class="radio-inline"> <input type="radio" name="tiyu04"  value="其他" >其他</label>
			        </div>
		    	</div>
		    	 </div>
		    	 
		    	<%
		    	String qs[] = {"总的来说，您对目前的生活满意吗?","总的来说，您对目前的工作满意吗?",
		    			"在过去的一年中，您认为您工作和生活中的精神压力大吗?","在过去的一年中，您有过心情沮丧或情绪低落吗?",
		    					"在过去的一年中，您有过心情烦躁或焦虑不安吗?","您目前是否从事以下职业1年或以上?"};
		    	String qsps[][] = { {"很满意","满意","不满意","很不满意"},{"很满意","满意","不满意","很不满意"},
		    			{"没有压力","压力较少","一般","压力较大","压力极大"}, {"没有","偶尔","经常"},{"没有","偶尔","经常"},
		    			{"金属冶炼","煤矿开采","隧道开挖","石化","石棉生产","中餐师傅","均无"} };
		    	
		    	%>
		    	<div class="titleDiv">职业、精神及社会因素</div>
		    	<fieldset>
		    		<%for(int i=0; i<qs.length; i++){ %>
		    		<div class="row">
			        <label  class="col-sm-4 control-label"><%=qs[i] %></label>
			        	<div class="col-sm-8">
				        	<%for(int j=0; j<qsps[i].length; j++){ 
								%>
					        <label class="radio-inline"> <input type="radio" name="zhiye0<%=(i+1) %>" value="<%=qsps[i][j] %>" ><%=qsps[i][j] %></label>
				        	<%} %>
			        </div>
		    		</div>
		    	<%} %>
		    	</fieldset>
		   
		   
        </fieldset>
        <br>
        <div class="control-group">
          <div class="controls" style="margin-left: 200px">
            <input   type="submit"  class="btn btn-success" 
         value="&nbsp;保&nbsp;&nbsp;存&nbsp;">
         	&nbsp;&nbsp;
         	<a class=""  href="survey_check.jsp" role="button">下一页</a>
          </div>
        </div>
  </form>
  
  
</div>

<script type="text/javascript">
	
	//alert(submit.onclick);
</script>
</body>
</html>