<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.util.BeanUtil"%>
<%@page import="com.dao.User"%>
<%@page import="com.dao.SurveyHealthDAO"%>
<%@page import="com.dao.SurveyHealth"%>
<%@ page import="com.util.PageUtil" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="head.jsp">
	<jsp:param value="survey health" name="title"/>
</jsp:include>
<body style="background-color:#f8f8f8">

<%
if( session.getAttribute("user") == null ){
	response.sendRedirect("login.jsp?type=6");
	return;
}

Logger logger = LoggerFactory.getLogger(this.getClass());
String[] labels = {"发热","疲乏无力","食欲不振","头痛",
"头晕、站立不稳","胸部疼痛","活动时呼吸困难","咳嗽","咳痰带血或咯血",
"睡觉时打呼噜","白天打瞌睡","吞咽困难","上腹部胀、痛",
"便秘","腹泻","大便中带血","排尿困难","尿痛","关节疼痛",
"腰痛","失眠"}
;

String[] names = {"isFaRe","isTried","isInappetence","isTouTong","isTouYun","isXiongTong","isHuXi","isKeSou","isKeTan","isDaHuLu","isKeShui","isTunYanKunNan","isShangFuTong","isBianMi","isFuXie","isDaBian","isPaiNiaoNan","isNiaoTong","isGuanJieTong","isYaoTong","isShiMian"}
;

//您父母或兄弟姐妹患有或患过以下疾病吗?
String labels2[] = {"慢性支气管炎或肺气肿","肺结核","糖尿病",
"父母都患有糖尿病","高血压病","父母都患有高血压病","冠心病","中风","慢性肝炎",
"肺癌","肝癌","胃癌","大肠癌"};

String names2[] = 
{"hasQiGuanYan","hasAllFeiJieHe","hasAtangNiaoBing","hasAllTangNiao","hasGaoXueYa","hasAllGaoXueYa","hasAguanXinBing","hasAzhongFeng","hasAganYan",
		"hasAfeiAi","hasAganAi","hasAweiAi","hasAdaChangAi"}
;
 %>
         <%
         //您目前或曾经患过以下疾病吗?. 确认
        String labels3[] = {"慢性支气管炎","哮喘","肺气肿","肺结核",
"慢性职业性肺病","肺心病","高血压病","冠心病或心肌梗死","心力衰竭","中风",
"糖尿病","慢性胃炎或溃疡病","慢性肠道疾病","痔疮","慢性肝炎","肝硬化","贫血","慢性肾衰竭","骨质疏松症",
"痛风","肺癌","胃癌","肝癌","大肠癌","其他"};
String names3[] = {"hasZhiQiGuan","hasXiaoChuan","hasFeiQiZhong",
		"hasFeiJieHe","hasFeiBing","hasFeiXinBing","hasGaoXieYa","hasGuanXinBing",
		"hasXinLiShuaiJie","hasZhongFeng","hasTangNiaoBing","hasWeiYan","hasChangDao",
		"hasZhiChuang","hasGanYan","hasGanYingHua","hasPinXue","hasShenShuaiJie","hasGuShuSong",
		"hasTongFeng","hasFeiAi","hasWeiAi","hasGanAi","hasDaChangAi","hasOther"};

User user = (User)session.getAttribute("user");
SurveyHealthDAO dao = new SurveyHealthDAO();
dao.getSession().clear();
SurveyHealth health = dao.findById(user.getId());
health = BeanUtil.getBeanNoNullString(request, SurveyHealth.class, health);
 String healthJson = new Gson().toJson(health);
 logger.info("healthJson from db:" + health.toString());
         %>
         
 <script type="text/javascript">
 var heal = <%=healthJson%>;
 $(function(){
	 updatePage(heal);
 });
 </script>
<div class="contentDiv">
<%--<h1 align="center">个人健康状况及家族病史</h1>
   --%>
   <h1 align="center">个人健康状况及生活方式问卷</h1>
   
   <form class="form-horizontal" id="submitBtn" method="POST" action="<%=request.getContextPath()%>/servlet/SurveySubmit.jsp">
   <input  type="hidden" value="survey_health" name="type">
   <div id="legend" class="">
        <legend >第二部分：个人健康状况及家族病史
        </legend>
      </div>
       <div class="titleDiv">您最近半年来出现过下述症状吗?</div>
       <fieldset>
	      <div style="display: block">
	      <%for(int i=0; i<labels.length; i++){
	       %>
	       <%--<label class="col-sm-4 control-label"><%=labels[i] %>:</label>
	    	<div class="col-sm-8">
	        <label class="radio-inline"> <input required  type="radio" name="<%=names[i] %>"  value="没有" > 没有 </label>
	        <label class="radio-inline"> <input required type="radio" name="<%=names[i] %>"  value="偶尔"> 偶尔 </label>
	        <label class="radio-inline"> <input required type="radio" name="<%=names[i] %>"  value="经常"> 经常 </label>
	        </div>--%>
			  <div class="row">
				  <label class="col-sm-3 control-label"><%=labels[i] %>:</label>
				  <div class="col-sm-7">
					  <select class="input required-xlarge" style="width: 100px;" name="<%=names[i] %>">
						  <%
							  Field f = health.getClass().getDeclaredField(names[i]);
							  f.setAccessible(true);
							  //System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
							  out.println(PageUtil.getOptions(new String[]{"没有", "偶尔",
									  "经常"}, f.get(health).toString() )); %>
					  </select>
				  </div>
			  </div>
	       <%} %>
	    </div>
    </fieldset>
      	<div class="titleDiv">您目前或曾经患过以下疾病吗?</div>
      	<fieldset>
      <%for(int i=0; i<labels3.length; i++){
       %>
			<div class="row">
				<label class="col-sm-3 control-label"><%=labels3[i] %>:</label>
				<div class="col-sm-2">
					<select class="input required-xlarge" style="width: 100px;" name="<%=names3[i] %>" onchange="selectChange(this,'<%=names3[i] %>',2)">
						<%
							Field f = health.getClass().getDeclaredField(names3[i]);
							f.setAccessible(true);
							//System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
							out.println(PageUtil.getOptions(new String[]{"从未患过", "曾经患过", "目前患有"},
									f.get(health).toString() ));
							String showDiv = "none";
							if(f.get(health).toString().equals("目前患有")){
								showDiv = "block";
							}
						%>
					</select>
				</div>

				<div id="<%=names3[i] %>Div" style="display:<%=showDiv%>;">
					<label class="col-sm-2 control-label">您如何治疗的:</label>
					<div class="col-sm-3">
						<select class="input required-xlarge" style="width: 160px;" name="<%=names3[i] %>" >
							<%
								f.setAccessible(true);
								out.println(PageUtil.getOptions(new String[]{"在医生指导下治疗", "自我治疗","未治疗"},
										f.get(health).toString() )); %>
						</select>
					</div>
				</div>

			</div>
       <%} %>
		</fieldset>

	   <fieldset>

       <label class="col-sm-4 control-label">其他疾病（如有，请列出）</label>
        <div class="col-sm-8">
            <input required type="text" class="form-control col-sm-4" name="hasOther" placeholder="其他疾病"/>
        </div>
        <br>
		</fieldset>


        <div class="titleDiv">您父母或兄弟姐妹患有或患过以下疾病吗?</div>
        <fieldset>
         <%for(int i=0; i<labels2.length; i++){
       %>
			<div class="row">
				<label class="col-sm-3 control-label"><%=labels2[i] %>:</label>
				<div class="col-sm-7">
					<select class="input required-xlarge" style="width: 100px;" name="<%=names2[i] %>">
						<%
							Field f = health.getClass().getDeclaredField(names[i]);
							f.setAccessible(true);
							out.println(PageUtil.getOptions(new String[]{"否", "是",
									"不知道"}, f.get(health).toString() )); %>
					</select>
				</div>
			</div>
      <%-- <label class="col-sm-4 control-label"><%=labels2[i] %>:</label>
    	<div class="col-sm-8">
        <label class="radio-inline"> <input required type="radio" name="<%=names2[i] %>"  value="否" >否 </label>
        <label class="radio-inline"> <input required type="radio" name="<%=names2[i] %>"  value="是"> 是 </label>
        <label class="radio-inline"> <input required type="radio" name="<%=names2[i] %>" value="不知道"> 不知道 </label>
        </div>--%>
       <%} %>
       </fieldset>
       
       <div class="titleDiv">如果您是女性，请回答以下问题?</div>

       <fieldset>
	       <div class="row">
		       <label  class="col-sm-4 control-label">您第一次来月经的年龄是(岁)：</label>
		        <div class="col-sm-2"><input required type="number" class="form-control "  name="firstYj" />
		        </div>
	        </div>
	        
	        <div class="row">
		        <label  class="col-sm-4 control-label">如果已婚，您结婚年龄是：</label>
		        <div class="col-sm-2"><input required type="number" class="form-control"  name="ageOfM" />
		        </div>
	        </div>
	        
	        <div class="row">
		        <label  class="col-sm-4 control-label">您是否已经绝经：</label>
		       <%-- <div class="col-sm-8">
			        <label class="radio-inline"> <input required type="radio" name="isJueJing" id="isJueJing1" value="否" onclick="checkYes(this);">否 </label>
			        <label class="radio-inline"> <input required type="radio" name="isJueJing" id="isJueJing2" value="是" onclick="checkYes(this);"> 是 </label>
		        <div class="form-group " id="isJueJingDiv" style="display: none">
			        <label for="isJueJing0" class="col-sm-4 control-label">绝经年龄?</label>
			        <label><input required type="number"  class="form-control"  name="isJueJing0" id="ageOfJueJing" /></label>
		        </div>
		        </div>--%>
				<div class="col-sm-2">
					<select class="input required-xlarge" style="width: 100px;" name="isJueJing">
						<%
							String isJueJingShow = "none";
							if("是".equals( health.getIsJueJing() ))
								isJueJingShow = "block";
							out.println(PageUtil.getOptions(new String[]{"否", "是",
									"不知道"}, health.getIsJueJing() )); %>
					</select>
				</div>

				<label  class="col-sm-4 control-label">绝经年龄：</label>
				<div class="col-sm-2"><input required type="number"  class="form-control"
							  name="isJueJing0" id="ageOfJueJing" /></div>
			</div>

	         
	         <div class="row">     
	        <label for="isJueJing" class="col-sm-4 control-label">您是否已经生育小孩?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input required type="radio" name="isHasChild" id="isHasChild1" value="否" onclick="checkYes(this);">否 </label>
	        <label class="radio-inline"> <input required type="radio" name="isHasChild" id="isHasChild2" value="是" onclick="checkYes(this);"> 是 </label>
	        <div class="form-group" id="isHasChildDiv" style="display: none;">
		        <label for="isHasChildYes" class="col-sm-4 control-label">生第一胎的年龄?</label>
		        <label><input required type="number" class="form-control" name="isHasChild0" /></label>
	        </div>
	        </div></div>
	         
	         <div class="row">       
	        <label for="isWeiNai" class="col-sm-4 control-label">您是否哺养过孩子（喂奶）?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input required type="radio" name="isWeiNai" id="isWeiNai1" value="否" >否 </label>
	        <label class="radio-inline"> <input required type="radio" name="isWeiNai" id="isWeiNai2" value="是"> 是 </label>
	        </div></div>
	        
	        <label for="hasGongJing" class="col-sm-4 control-label">您是否做过宫颈细胞学涂片检查?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input required type="radio" name="hasGongJing" id="hasGongJing1" value="否" >否 </label>
	        <label class="radio-inline"> <input required type="radio" name="hasGongJing" id="hasGongJing2" value="是" > 是 </label>
	        <label class="radio-inline"> <input required type="radio" name="hasGongJing" id="hasGongJing2" value="不知道"> 不知道 </label>
	        </div>
	        
	       <div class="row">
	        <label for="fuyongCiJs" class="col-sm-4 control-label"> 您是否在服用雌激素类药物?</label>
	        <div class="col-sm-8" id="isHasChildpdiv">
	        <label class="radio-inline"> <input required type="radio" name="fuyongCiJs" id="fuyongCiJs1" value="否" onclick="checkYes(this);">否 </label>
	        <label class="radio-inline"> <input required type="radio" name="fuyongCiJs" id="fuyongCiJs2" value="是" onclick="checkYes(this);"> 是 </label>
	        <div class="form-group " id="fuyongCiJsDiv" style="display: none">
	        <label for="ageOfJueJing" class="col-sm-4 control-label">您服用的时间(年)?</label>
	        <label><input required type="number" class="form-control" name="fuyongCiJs0"  /></label>
	        </div>
	        </div></div>
	        
	        <div class="row">
	        <label for="hasRuXianZs" class="col-sm-4 control-label">您患有或患过乳腺增生症吗?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input required type="radio" name="hasRuXianZs" value="否" >否 </label>
	        <label class="radio-inline"> <input required type="radio" name="hasRuXianZs"  value="是" > 是 </label>
	        <label class="radio-inline"> <input required type="radio" name="hasRuXianZs"  value="不知道"> 不知道 </label>
	        </div></div>
	        
	        <div class="row">
	        <label  class="col-sm-4 control-label">您患有或患过乳腺癌吗? </label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input required type="radio" name="hasRuXianAi"  value="否" >否 </label>
	        <label class="radio-inline"> <input required type="radio" name="hasRuXianAi"  value="是" > 是 </label>
	        <label class="radio-inline"> <input required type="radio" name="hasRuXianAi" value="不知道"> 不知道 </label>
	        </div></div>
	        
	        <div class="row">
	        <label  class="col-sm-4 control-label">您母亲和姐妹患过乳腺癌吗?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input required type="radio" name="hasOruXianAi"  value="否" >否 </label>
	        <label class="radio-inline"> <input required type="radio" name="hasOruXianAi"  value="是" > 是 </label>
	        <label class="radio-inline"> <input required type="radio" name="hasOruXianAi"  value="不知道"> 不知道 </label>
	        </div></div>
	       
	       <div class="row">
	        <label for="howCheckRuXianAi" class="col-sm-4 control-label"> 您多长时间做一次乳腺检查?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input required type="radio" name="howCheckRuXianAi"  value="1年及以下" >1年及以下 </label>
	        <label class="radio-inline"> <input required type="radio" name="howCheckRuXianAi"  value="2年" >2年 </label>
	        <label class="radio-inline"> <input required type="radio" name="howCheckRuXianAi"  value="3年及以上">3年及以上</label>
	        <label class="radio-inline"> <input required type="radio" name="howCheckRuXianAi"  value="不做">不做 </label>
	        </div></div>
	        
	        <div class="row">
	        <label for="isCookOfthen" class="col-sm-4 control-label">您是否经常下厨(每周5天以上)?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input required type="radio" name="isCookOfthen"  value="否" >否 </label>
	        <label class="radio-inline"> <input required type="radio" name="isCookOfthen"  value="是" > 是 </label>
	        <label class="radio-inline"> <input required type="radio" name="isCookOfthen"  value="不知道"> 不知道 </label>
	        </div>
	        </div>
	       </fieldset>
       
        <br>
        <div class="control-group">
          <div class="controls" style="margin-left: 200px">
            <input    type="submit" name="submit" class="btn btn-success"
         value="&nbsp;保&nbsp;&nbsp;存&nbsp;">
         	&nbsp;&nbsp;
			  <input    type="submit" name="submit"  class="btn btn-link"
					   value="&nbsp;下一页&nbsp;">
          </div>
        </div>
  </form>
  
  
</div>

<script type="text/javascript">
	
	//alert(submit.onclick);
</script>
</body>
</html>