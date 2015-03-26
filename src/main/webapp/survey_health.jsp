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
"痛风","肺癌","胃癌","肝癌","大肠癌"};
String names3[] = {"hasZhiQiGuan","hasXiaoChuan","hasFeiQiZhong",
		"hasFeiJieHe","hasFeiBing","hasFeiXinBing","hasGaoXieYa","hasGuanXinBing",
		"hasXinLiShuaiJie","hasZhongFeng","hasTangNiaoBing","hasWeiYan","hasChangDao",
		"hasZhiChuang","hasGanYan","hasGanYingHua","hasPinXue","hasShenShuaiJie","hasGuShuSong",
		"hasTongFeng","hasFeiAi","hasWeiAi","hasGanAi","hasDaChangAi"};

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

<jsp:include page="tophead.jsp"></jsp:include>

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
	      <%for(int i=0; i<labels.length; i+=2){
	       %>
			  <div class="row">
				  <label class="col-sm-3 control-label"><%=labels[i] %>:</label>
				  <div class="col-sm-2">
					  <select class="input-xlarge" style="width: 100px;" name="<%=names[i] %>">
						  <%
							  Field f = health.getClass().getDeclaredField(names[i]);
							  f.setAccessible(true);
							  //System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
							  out.println(PageUtil.getOptions(new String[]{"没有", "偶尔",
									  "经常"}, f.get(health).toString() )); %>
					  </select>
				  </div>

                  <%if( i+1 < labels.length){%>
                    <label class="col-sm-3 control-label"><%=labels[i+1] %>:</label>
                     <div class="col-sm-2">
                      <select class="input-xlarge" style="width: 100px;" name="<%=names[i+1] %>">
                          <%
                               f = health.getClass().getDeclaredField(names[i+1]);
                              f.setAccessible(true);
                              out.println(PageUtil.getOptions(new String[]{"没有", "偶尔",
                                      "经常"}, f.get(health).toString() )); %>
                      </select>
                    </div>
                  <%}%>
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
					<select class="input-xlarge" style="width: 100px;" name="<%=names3[i] %>" onchange="selectChange(this,'<%=names3[i] %>',2)">
						<%
                            
							Field f = health.getClass().getDeclaredField(names3[i]);
							f.setAccessible(true);
                            String values[] = f.get(health).toString().trim().split(";");
							//System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
							out.println(PageUtil.getOptions(new String[]{"从未患过", "曾经患过", "目前患有"},
                                    values[0]));
							String showDiv = "none";
							if(values[0].equals("目前患有")){
								showDiv = "block";
							}
						%>
					</select>
				</div>

				<div id="<%=names3[i] %>Div" style="display:<%=showDiv%>;">
					<label class="col-sm-2 control-label">您如何治疗的:</label>
					<div class="col-sm-3">
						<select class="input required-xlarge" style="width: 160px;" name="<%=names3[i] %>0" >
							<%
								f.setAccessible(true);
                                String val2 = values.length > 1 ? values[1]:"";
								out.println(PageUtil.getOptions(new String[]{"在医生指导下治疗", "自我治疗","未治疗"},
                                        val2 )); %>
						</select>
					</div>
				</div>

			</div>
       <%} %>
		</fieldset>

	   <div style="margin-top: 6px">
       <label class="col-sm-4 control-lxabel">其他疾病（如有，请列出）</label>
        <div class="col-sm-8">
            <input  type="text" value="" class="form-control col-sm-4" name="hasOther" placeholder="其他疾病"/>
        </div>
        <br>
		</div>

        <div class="titleDiv">您父母或兄弟姐妹患有或患过以下疾病吗?</div>
        <fieldset>
         <%for(int i=0; i<labels2.length; i+=2){
       %>
			<div class="row">
				<label class="col-sm-3 control-label"><%=labels2[i] %>:</label>
				<div class="col-sm-2">
					<select class="input required-xlarge" style="width: 100px;" name="<%=names2[i] %>">
						<%
							Field f = health.getClass().getDeclaredField(names2[i]);
							f.setAccessible(true);
                            //logger.info("get options:" + f.get(health).toString() + "   names[i]:" +names[i] );
							out.println(PageUtil.getOptions(new String[]{"否", "是",
									"不知道"}, f.get(health).toString() )); %>
					</select>
				</div>

                <%if(i+1 < labels2.length){%>
                <label class="col-sm-3 control-label"><%=labels2[i+1] %>:</label>
                <div class="col-sm-2">
                    <select class="input required-xlarge" style="width: 100px;" name="<%=names2[i+1] %>">
                        <%
                             f = health.getClass().getDeclaredField(names2[i+1]);
                            f.setAccessible(true);
                            out.println(PageUtil.getOptions(new String[]{"否", "是",
                                    "不知道"}, f.get(health).toString() )); %>
                    </select>
                </div>
                <%}%>
			</div>
   
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
	        
           <%
               String namesWoman[] = {"isJueJing","isHasChild","isWeiNai","hasGongJing",
                       "fuyongCiJs","hasRuXianZs", "hasRuXianAi","hasOruXianAi","howCheckRuXianAi",
               "isCookOfthen"};
            String labelsWoman[] = {"您是否已经绝经:","您是否已经生育小孩:","您是否哺养过孩子（喂奶）:","您是否做过宫颈细胞学涂片检查:",
            "您是否在服用雌激素类药物:","您患有或患过乳腺增生症吗:","您患有或患过乳腺癌吗:","您母亲和姐妹患过乳腺癌吗:","您多长时间做一次乳腺检查:",
                    "您是否经常下厨(每周5天以上):"};
               String sublabelsWoman[] = {"绝经年龄:","生第一胎的年龄:", null,null,"您服用的时间(年):"};
               for(int i=0; i<labelsWoman.length; i++){
           %>
                <div class="row">
                    <label  class="col-sm-4 control-label"><%=labelsWoman[i]%></label>
                    <div class="col-sm-2">
                        <select class="input required-xlarge" style="width: 100px; height: 2.2em; " name="<%=namesWoman[i]%>" onchange="selectChange(this,'<%=namesWoman[i] %>',1)">
                            <%
                                String isJueJingShow = "none";
                                String values[] = null;
                                try{
                                    
                                    Field f = health.getClass().getDeclaredField(namesWoman[i]);
                                    f.setAccessible(true);
                                     values = f.get(health).toString().split(";");
                                    String value = values[0];
                                    if("是".equals( value ))
                                        isJueJingShow = "block";
                                    out.println(PageUtil.getOptions(new String[]{"否", "是"}, value ));
                                }catch (Exception e){
                                    e.printStackTrace();
                                }
                                String val2 = "";
                                if(values.length > 1) val2 = values[1];
                            %>
                        </select>
                    </div>
                    <% if(sublabelsWoman.length > i && sublabelsWoman[i] != null){ %>
                        <div class="form-group " id="<%=namesWoman[i]%>Div" style="display: <%=isJueJingShow%>">
                        <label  class="col-sm-2 control-label"><%=sublabelsWoman[i]%></label>
                        <div class="col-sm-2"><input  type="number" class="form-control"  name="<%=namesWoman[i]%>0" value="<%=val2%>" /></div>
                       </div>
                    <%} %>
               </div>

           <%}%>
           
	       </fieldset>
       
        <br>
        <div class="control-group">
          <div class="controls" style="margin-left: 200px">
            <input    type="submit" name="submit" class="btn btn-success"
         value="&nbsp;保&nbsp;&nbsp;存&nbsp;">
         	&nbsp;&nbsp;
			  <input    type="submit" name="submit"  class="btn btn-link"
					   value="&nbsp;下一页&nbsp;">
              &nbsp;&nbsp;
              <a   class="btn btn-link" href="survey.jsp" >&nbsp;上一页&nbsp;</a>
          </div>
        </div>
  </form>
  
  
</div>

<script type="text/javascript">
	
	//alert(submit.onclick);
</script>
</body>
</html>