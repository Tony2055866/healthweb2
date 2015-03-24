<%@page import="com.util.BeanUtil"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.dao.User"%>
<%@page import="com.dao.SurveyEatDAO"%>
<%@page import="com.dao.SurveyEat"%>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="com.util.PageUtil" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
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
			$(showDiv).show();
		}
		 if(arguments.length > 1){
			 var div = window.document.getElementById(arguments[1]);
			 $(div).hide();
		 }
		 if(arguments.length > 2){
			 var div = window.document.getElementById(arguments[2]);
			 $(div).hide();
		 }
	 }
 </script>

<jsp:include page="tophead.jsp"></jsp:include>

<div class="contentDiv">
	<h1 align="center">个人健康状况及生活方式问卷</h1>
   <form class="form-horizontal" id="submitBtn" method="POST" action="<%=request.getContextPath()%>/servlet/SurveySubmit.jsp">
   <input required type="hidden" value="survey_eat" name="type">
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
			<select class="input-xlarge" style="width: 100px;" name="<%=nameseat[i] %>">
			<%
				Field f = eat.getClass().getDeclaredField(nameseat[i]);
				f.setAccessible(true);
				//System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
				out.println(PageUtil.getOptions(new String[]{"5-7天", "3-4天",
						"1-2天","小于1天"}, f.get(eat).toString())); %>
			%>
			</select>
        <%--<label class="radio-inline"> <input required type="radio" name="<%=nameseat[i] %>"  value="5-7天" >5-7天 </label>
        <label class="radio-inline"> <input required type="radio" name="<%=nameseat[i] %>"  value="3-4天" >3-4天 </label>
        <label class="radio-inline"> <input required type="radio" name="<%=nameseat[i] %>"  value="1-2天">1-2天 </label>
        <label class="radio-inline"> <input required type="radio" name="<%=nameseat[i] %>"  value="小于1天">小于1天 </label>--%>
        </div>
        </div>
        <%} %>
        </fieldset>
        
        <fieldset>
	        <%for(int i=10; i<13; i++){%>
	        <div class="row">
	        <label  class="col-sm-4 control-label"><%=labelseat[i] %></label>
	        <div class="col-sm-8">
				<select class="input-xlarge" style="width: 100px;" name="<%=nameseat[i] %>">
					<%
						Field f = eat.getClass().getDeclaredField(nameseat[i]);
						f.setAccessible(true);
						//System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
						out.println(PageUtil.getOptions( options[i-10] , f.get(eat).toString() ));
					%>
				</select>
	        <%--<label class="radio-inline"> <input required type="radio" name="<%=nameseat[i] %>"  value="<%=options[i-10][0] %>" ><%=options[i-10][0] %> </label>
	        <label class="radio-inline"> <input required type="radio" name="<%=nameseat[i] %>"  value="<%=options[i-10][1] %>" ><%=options[i-10][1] %> </label>
	        <label class="radio-inline"> <input required type="radio" name="<%=nameseat[i] %>"  value="<%=options[i-10][2] %>"><%=options[i-10][2] %> </label>
	        <label class="radio-inline"> <input required type="radio" name="<%=nameseat[i] %>"  value="<%=options[i-10][3] %>"><%=options[i-10][3] %> </label>--%>
	        </div>
	        </div>
        <%} %>
			
        	<div class="titleDiv">您的口味与周围的人相比如何？</div>
	        <div class="col-sm-12" style="margin-left: 50px">
	        <label class="radio-inline"> <input required type="radio" name="eatt"  value="很淡" >很淡</label>
	        <label class="radio-inline"> <input required type="radio" name="eatt"  value="略淡" >略淡</label>
	        <label class="radio-inline"> <input required type="radio" name="eatt"  value="相同">相同</label>
	        <label class="radio-inline"> <input required type="radio" name="eatt"  value="略咸">略咸</label>
	        <label class="radio-inline"> <input required type="radio" name="eatt"  value="很咸">很咸</label>
	        </div>
	     </fieldset>
	     
        <div class="titleDiv">吸烟情况</div>
        <fieldset>
       	  <label  class="col-sm-4 control-label">您是否吸烟？</label>
       	  <div class="col-sm-6">
       	  <label class="radio-inline"> <input required type="radio" name="isXiyan"  value="是" onclick="changeRadio('isXiyanDiv','isXiyanNo','isXiyanJie');">是</label>
       	  <label class="radio-inline"> <input required type="radio" name="isXiyan"   value="否" onclick="changeRadio('isXiyanNo','isXiyanDiv','isXiyanJie');">否</label>
       	   <label class="radio-inline"> <input required type="radio" name="isXiyan"   value="已戒" onclick="changeRadio('isXiyanJie','isXiyanNo','isXiyanDiv');">已戒</label>
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
		        <label class="radio-inline"> <input required type="radio" name="zhuyaoChou"  value="卷烟" >卷烟</label>
		        <label class="radio-inline"> <input required type="radio" name="zhuyaoChou"  value="雪茄" >雪茄</label>
		        <label class="radio-inline"> <input required type="radio" name="zhuyaoChou"  value="烟丝">烟丝</label>
	        </div>
	        </div>
	        <div class="row">
	        <label  class="col-sm-4 control-label">您平均每天吸多少支香烟?</label>
	        <div class="col-md-2">
			  <input required id="name" name="howManyYan" type="number" min="1" placeholder="" class="form-control input-md" >
			  </div>
	        </div>
	        <div class="row">
	        <label  class="col-sm-4 control-label">您多少岁开始吸烟的?</label>
	        <div class="col-md-2">
			  <input required id="name" name="whenXiYan" type="number" min="1" placeholder="" class="form-control input-md" >
			  </div>
	        </div>
        </div>
        
        <div id="isXiyanNo" style="display: <%=div2%>">
        	<div class="row">
	        <label  class="col-sm-4 control-label">您工作场所或居住场所有人吸烟吗?</label>
	        <div class="col-sm-6">
		        <label class="radio-inline"> <input required type="radio" name="hasOtherChou"  value="有" >有</label>
		        <label class="radio-inline"> <input required type="radio" name="hasOtherChou"  value="没有" >没有</label>
	        </div>
	        </div>
        </div>
        
        <div id="isXiyanJie" style="display: <%=div3%>">
        	<div class="row">
	        <label  class="col-sm-4 control-label">您多少岁开始吸烟的?</label>
	        <div class="col-sm-2">
		       		<input required id="name" name="whenXiYan" type="number" min="1" placeholder="" class="form-control input-md" >
	        </div>
	        </div>
	        
	        <div class="row">
	        <label  class="col-sm-4 control-label">您多少岁戒的烟?</label>
	        <div class="col-sm-2">
		       		<input required id="name" name="whenJieYan" type="number" min="1" placeholder="" class="form-control input-md" >
	        </div>
	        </div>
	        
	        <div class="row">
	        <label  class="col-sm-4 control-label">戒烟前，您平均每天吸多少支香烟?</label>
	        <div class="col-sm-2">
		       		<input required id="name" name="howManyYan" type="number" min="1" placeholder="" class="form-control input-md" >
	        </div>
	        </div>
	       
        	<div class="row">
		        <label  class="col-sm-4 control-label">您工作场所或居住场所所有人吸烟吗?</label>
		        <div class="col-sm-6">
			        <label class="radio-inline"> <input required type="radio" name="hasOtherChou"  value="有" >没有</label>
			        <label class="radio-inline"> <input required type="radio" name="hasOtherChou"  value="有" >没有</label>
		        </div>
	        </div>
        </div>
        
        <div class="titleDiv">饮酒情况</div>
        <fieldset>
        	<div class="row">
		        <label  class="col-sm-5 control-label">您饮酒吗?</label>
		        <div class="col-sm-6">
					<select class="input-xlarge" style="width: 150px;height: 2em;" name="isdrink" onchange="selectChange(this,'isdrink',0)">
					<%
						String drinkShow = "none";
						if( "喝酒".equals(eat.getIsdrink()) )
							drinkShow = "block";
						out.println(PageUtil.getOptions( new String[]{"喝酒","不喝","以前喝、现在不喝"} , eat.getIsdrink() ));
					%>
					</select>	
			        <%--<label class="radio-inline"> <input required type="radio" name="isdrink"  value="不喝" >不喝</label>
			        <label class="radio-inline"> <input required type="radio" name="isdrink"  value="以前喝、现在不喝" >以前喝、现在不喝</label>
			        <label class="radio-inline"> <input required type="radio" name="isdrink"  value="喝酒" >喝酒</label>--%>
		        </div>
	        </div>
	        
	        <div id="isdrinkDiv" style="display:<%=drinkShow%>">
		        <div class="row">
			        <label  class="col-sm-5 control-label">您一般多长时间喝一次酒?</label>
			        <div class="col-sm-6">
						<select class="input-xlarge" style="width: 150px;height: 2em;" name="howlongDrink" >
							<% out.println(PageUtil.getOptions(new String[]{"每天2次", "每天1次", "每周3-4次", "每周3-4次", "每周小于1次"}, eat.getHowlongDrink())); %>
						</select>
			        </div>
		        </div>
					       
	        	<div class="row">
					<label  class="col-sm-5 control-label">您通常每次饮多少酒? (只填写您常喝的酒)</label>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<input required id="name" name="howmuchDrink1" type="number" min="1" placeholder="" class="form-control input-md" >
						</div>
						<label  class="col-sm-4 " style="font-weight: 500; height: 2em">两白酒</label>
					</div>
				</div>

				<div class="row">
					<label  class="col-sm-5 control-label">&nbsp;&nbsp;&nbsp;</label>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<input required id="name" name="howmuchDrink2" type="number" min="1" placeholder="" class="form-control input-md" >
						</div>
						<label  class="col-sm-4 " style="font-weight: 500; height: 2em">两葡萄酒/黄酒</label>
					</div>
				</div>

				<div class="row">
					<label  class="col-sm-5 control-label">&nbsp;&nbsp;&nbsp;</label>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<input required id="name" name="howmuchDrink3" type="number" min="1" placeholder="" class="form-control input-md" >
						</div>
						<label  class="col-sm-4 " style="font-weight: 500; height: 2em">瓶啤酒</label>
					</div>

				</div>
		       
		        
		        <div class="row">
			        <label  class="col-sm-5 control-label">如果一天不喝酒，您会感到不舒服吗?</label>
			        <div class="col-sm-7">
						<select class="input-xlarge" style="width: 150px; height: 2em" name="work" >
							<% out.println(PageUtil.getOptions(new String[]{"会", "不会"}, eat.getIsmustDrink() )); %>
						</select>
				       <%-- <label class="radio-inline"> <input required type="radio" name="ismustDrink"  value="会" >会</label>
				        <label class="radio-inline"> <input required type="radio" name="ismustDrink"  value="不会" >不会</label>--%>
			        </div>
		        </div>
	        </div>
        </fieldset>
        
        <div class="titleDiv">体力活动及体育锻炼</div>
        <fieldset>
        	<div class="row">
			        <label  class="col-sm-4 control-label">工作性质</label>
			        <div class="col-sm-8">
						<select class="input-xlarge" style="width: 150px;" name="work" >
							<% out.println(PageUtil.getOptions(new String[]{"静坐为主", "轻度活动", "体力劳动"}, eat.getWork() )); %>
						</select>
				        
			        </div>
		    </div>
		    
		    <div class="row">
			        <label  class="col-sm-4 control-label">上班交通</label>
			        <div class="col-sm-8">
						<select class="input-xlarge" style="width: 150px;" name="jiaotong" onchange="selectChange(this,'jiaotong',0)">
							<% 
								String timeShow = "none";
								String values[] = eat.getJiaotong().split(";");
								String val1 = values[0];
								String val2 = "";
								if(values.length > 1)
									 val2 = values[1];
								if( StringUtils.isEmpty(eat.getJiaotong()) || eat.getJiaotong().contains("步行"))
									timeShow = "block";
								out.println(PageUtil.getOptions(new String[]{"步行或骑车", "乘公交车或班车", "自驾车", "家庭办公"}, val1 )); %>
						</select>
			        </div>
		    </div>

			<div class="row">
			<div id="jiaotongDiv" style="display: <%=timeShow%>">
				<label  class="col-sm-4 control-label">每次上班大概要多长时间?</label>
				<div class="col-sm-8">
				<select class="input-xlarge" style="width: 150px;" name="jiaotong0">
					<%
						out.println(PageUtil.getOptions(new String[]{"小于20分钟", "大于20分钟"}, val2 ));
					%>
				</select>
					</div>
				<%--<label class="radio-inline"> <input required type="radio" name="jiaotong0"  value="小于20分钟" >小于20分钟</label>
				<label class="radio-inline"> <input required type="radio" name="jiaotong0"  value="大于20分钟" >大于20分钟</label>--%>
			</div>
				</div>
		    
			<% String label3[] = {"干家务活", "体育锻炼", "近年来，您参加每次持续20分钟以上的体育锻炼吗?","您平均每周锻炼多少次?",
					"您平均每次锻炼的时间是?","您常用的体育锻炼方式是什么?"};
				String options3[][] = { {"从不", "偶尔","经常"}, {"从不", "偶尔","经常"} , {"是", "否"}, {"3次或以上","1-2次","小于1次" },
									{"大于60分钟","30-60分钟","小于30分钟"},{"散步/快走","跑步","游泳","球类","室内健身","其他"}  };
				String names[] = {"jiawu","tiyu01", "tiyu02", "tiyu03", "tiyu04", "tiyu05"};

				String isshow = "none";
				
				for(int i=0; i<3; i++){
			%>
			<div class="row">
				<label  class="col-sm-4 control-label"><%=label3[i]%></label>
				<div class="col-sm-8">
					<select class="input-xlarge" style="width: 150px;" name="<%=names[i]%>">
						<%
							Field f = eat.getClass().getDeclaredField(names[i]);
							f.setAccessible(true);
							val1 = f.get( eat ).toString();
							out.println(PageUtil.getOptions( options3[i] , val1 ));
							if( i == 2){
								if(val1.equals("是"))
									isshow = "block";
							}
						%>
					</select>
				</div>
			</div>
			<% }%>
		   
		    <div  style="display: <%=isshow%>">
		    	<% for(int i=3; i<label3.length; i++){%>
				<div class="row">
					<label  class="col-sm-4 control-label"><%=label3[i]%></label>
					<div class="col-sm-8">
						<select class="input-xlarge" style="width: 150px;" name="<%=names[i]%>">
							<%
								Field f = eat.getClass().getDeclaredField(names[i]);
								f.setAccessible(true);
								val1 = f.get( eat ).toString();
								out.println(PageUtil.getOptions( options3[i] , val1 ));
							%>
						</select>
					</div>
				</div>
				<%}%>
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
				        	<%--<%for(int j=0; j<qsps[i].length; j++){ 
								%>
					        <label class="radio-inline"> <input required type="radio" name="zhiye0<%=(i+1) %>" value="<%=qsps[i][j] %>" ><%=qsps[i][j] %></label>
				        	<%} %>--%>
								<select class="input-xlarge" style="width: 150px;" name="zhiye0<%=(i+1) %>">
									<%
										String name = "zhiye0" + (i+1);
										Field f = eat.getClass().getDeclaredField(name);
										f.setAccessible(true);
										val1 = f.get( eat ).toString();
										out.println(PageUtil.getOptions( qsps[i] , val1 ));
									%>
								</select>
			        </div>
		    		</div>
		    	<%} %>
		    	</fieldset>
        </fieldset>
        <br>
        <div class="control-group">
			<input required   type="submit" name="submit" class="btn btn-success"
					 value="&nbsp;保&nbsp;&nbsp;存&nbsp;">
			&nbsp;&nbsp;
			<input required   type="submit" name="submit"  class="btn btn-link"
					 value="&nbsp;下一页&nbsp;">
			&nbsp;&nbsp;
			<input      class="btn btn-link" href="survey_health.jsp"
				   value="&nbsp;上一页&nbsp;">
        </div>
  </form>
  
</div>

<script type="text/javascript">
	
	//alert(submit.onclick);
</script>
</body>
</html>