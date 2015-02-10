<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="boots/css/bootstrap.min.css" rel="stylesheet">
   <script src="boots/js/jquery.min.js"></script>
   <script src="boots/js/bootstrap.min.js"></script>
   
   <style type="text/css">
   	.titleDiv{
   		background: #eff1f3;
   		font-size: 14px;
   	}
   </style>
</head>
<body >

<%
String[] labels = {"发热","疲乏无力","食欲不振","头痛",
"头晕、站立不稳","胸部疼痛","活动时呼吸困难","咳嗽","咳痰带血或咯血",
"睡觉时打呼噜","白天打瞌睡","吞咽困难","上腹部胀、痛",
"便秘","腹泻","大便中带血","排尿困难","尿痛","关节疼痛",
"腰痛","失眠"}
;

String[] names = {"isFaRe","isTried","isInappetence","isTouTong","isTouYun","isXiongTong","isHuXi","isKeSou","isKeTan","isDaHuLu","isKeShui","isTunYanKunNan","isShangFuTong","isBianMi","isFuXie","isDaBian","isPaiNiaoNan","isNiaoTong","isGuanJieTong","isYaoTong","isShiMian"}
;

String labels2[] = {"慢性支气管炎或肺气肿","肺结核","糖尿病",
"父母都患有糖尿病","高血压病","父母都患有高血压病","冠心病","中风","慢性肝炎",
"肺癌","肝癌","胃癌","大肠癌"};

String names2[] = 
{"hasQiGuanYan","hasFeiJieHe","hasTangNiaoBing","hasAllTangNiao","hasGaoXueYa","hasAllGaoXueYa","hasGuanXinBing","hasZhongFeng","hasGanYan","hasFeiAi","hasGanAi","hasWeiAi","hasDaChangAi",}
;
 %>
         <%
        String labels3[] = {"慢性支气管炎","哮喘","肺气肿","肺结核",
"慢性职业性肺病","肺心病","高血压病","冠心病或心肌梗死","心力衰竭","中风",
"糖尿病","慢性胃炎或溃疡病","慢性肠道疾病","痔疮","慢性肝炎","肝硬化","贫血","慢性肾衰竭","骨质疏松症",
"痛风","肺癌","胃癌","肝癌","大肠癌","其他"};

String names3[] = {"hasZhiQiGuan","hasXiaoChuan","hasFeiQiZhong","hasFeiJieHe","hasFeiBing","hasFeiXinBing","hasGaoXieYa","hasGuanXinBing","hasXinLiShuaiJie","hasZhongFeng","hasTangNiaoBing","hasWeiYan","hasChangDao","hasZhiChuang","hasGanYan","hasGanYingHua","hasPinXue","hasShenShuaiJie","hasGuShuSong","hasTongFeng","hasFeiAi","hasWeiAi","hasGanAi","hasDaChangAi","hasOther",}
;
         %>
 
 <script type="text/javascript">
 function check(element){
 	alert(element);
 	var strid = element.id.substring(5);
 	var div = window.document.getElementById("nestedDiv"+strid);
 	if(element.checked){
 		div.style.display = "block";
 		//alert(div)
 	}else{
 		div.style.display = "none";
 	}
 }
 
 function divclick(div){
 	var strid = div.id.substring(6);
 	//alert(strid);
 	var radiobtn = window.document.getElementById("input3"+strid);
 	var div = window.document.getElementById("nestedDiv"+strid);
 	if(radiobtn.checked){
 		div.style.display = "block";
 		//alert(div)
 	}else{
 		div.style.display = "none";
 	}
 }
 
 function checkYes(ele){
 	var radiobtn = window.document.getElementById(ele.name+"2");
 	var div = window.document.getElementById(ele.name+"Div");
 	
 	if(radiobtn.checked){
 		div.style.display = "block";
 	}else{
 		div.style.display = "none";
 	}
 }
 </script>
<div style="width: 800px; margin-left: auto; margin-right: auto;">
<h1 align="center">个人健康状况及家族病史</h1>

   <form class="form-horizontal" id="submitBtn">
   
   <div class="form-group">
	  <label class="col-md-4 control-label" for="name">姓名</label>  
	  <div class="col-md-4">
	  <input id="name" name="name" type="text" placeholder="" class="form-control input-md" >
	  </div>
	</div>
	
       <div class="titleDiv">您最近半年来出现过下述症状吗?</div>
       <fieldset>
	      <div style="display: block">
	      <%for(int i=0; i<labels.length; i++){
	       %>
	       <label class="col-sm-4 control-label"><%=labels[i] %>:</label>
	    	<div class="col-sm-8">
	        <label class="radio-inline"> <input  type="radio" name="<%=names[i] %>" id="seasonSummer" value="没有" > 没有 </label>
	        <label class="radio-inline"> <input type="radio" name="<%=names[i] %>" id="seasonWinter" value="偶尔"> 偶尔 </label>
	        <label class="radio-inline"> <input type="radio" name="<%=names[i] %>" id="seasonSpringFall" value="经常"> 经常 </label>
	        </div>
	       <%} %>
	    </div>
    </fieldset>
      	<div class="titleDiv">您目前或曾经患过以下疾病吗?</div>
      	<fieldset>
      <%for(int i=0; i<labels3.length; i++){
       %>
	     <label class="col-sm-4 control-label"><%=labels3[i] %>:</label>
	      <div class="col-sm-8" onclick="divclick(this);" id="outdiv<%=i %>">
	      <label class="radio-inline">
	        <input type="radio" value="从未患过" name="<%=names3[i] %>" id="input1<%=i%>">从未患过</label>
	      <label class="radio-inline">
	      <input type="radio" value="曾经患过" name="<%=names3[i] %>" id="input2<%=i%>">曾经患过</label>
	      	<label class="radio-inline">
	        <input type="radio" value="目前患有" name="<%=names3[i]%>" id="input3<%=i%>" >目前患有
	        </label>
	        
	        <div id="nestedDiv<%=i%>" style="display: none; padding-left: 0px;" >
	        <label class="col-sm-3 control-label">您如何治疗的</label>
		        <label class="radio-inline">
		        <input type="radio" value="在医生指导下治疗" name="<%=names3[i] %>0" >在医生指导下治疗</label>
		      <label class="radio-inline">
		      <input type="radio" value="曾经患过" name="<%=names3[i] %>0">自我治疗</label>
		      	<label class="radio-inline">
		        <input type="radio" value="未治疗" name="<%=names3[i] %>0" >未治疗
		        </label>
	        </div>
	     </div>
       <%} %>
       <label for="name" class="col-sm-4 control-label">其他疾病（如有，请列出）</label>
        <div class="col-sm-8">
            <input type="text" class="form-control col-sm-5" name="name" placeholder="其他疾病"/>
        </div>
        <br>
		</fieldset>
        <div class="titleDiv">您父母或兄弟姐妹患有或患过以下疾病吗?</div>
        <fieldset>
         <%for(int i=0; i<labels2.length; i++){
       %>
       <label class="col-sm-4 control-label"><%=labels2[i] %>:</label>
    	<div class="col-sm-8">
        <label class="radio-inline"> <input type="radio" name="<%=names2[i] %>" id="seasonSummer" value="否" >否 </label>
        <label class="radio-inline"> <input type="radio" name="<%=names2[i] %>" id="seasonWinter" value="是"> 是 </label>
        <label class="radio-inline"> <input type="radio" name="<%=names2[i] %>" id="seasonSpringFall" value="不知道"> 不知道 </label>
        </div>
       <%} %>
       </fieldset>
       
       <div class="titleDiv">如果您是女性，请回答以下问题?</div>
       <fieldset>
	       <div class="row">
		       <label for="FirstYJ" class="col-sm-4 control-label">您第一次来月经的年龄是(岁)：</label>
		        <div class="col-sm-2"><input type="text" class="form-control "  name="FirstYJ" />
		        </div>
	        </div>
	        
	        <div class="row">
		        <label for="name" class="col-sm-4 control-label">如果已婚，您结婚年龄是：</label>
		        <div class="col-sm-2"><input type="text" class="form-control"  name="ageOfM" />
		        </div>
	        </div>
	        
	        <div class="row">
		        <label for="isJueJing" class="col-sm-4 control-label">您是否已经绝经：</label>
		        <div class="col-sm-8">
			        <label class="radio-inline"> <input type="radio" name="isJueJing" id="isJueJing1" value="否" onclick="checkYes(this);">否 </label>
			        <label class="radio-inline"> <input type="radio" name="isJueJing" id="isJueJing2" value="是" onclick="checkYes(this);"> 是 </label>
		        <div class="form-group " id="isJueJingDiv" style="display: none">
			        <label for="ageOfJueJing" class="col-sm-4 control-label">绝经年龄?</label>
			        <label><input type="number" data-bind="value:replyNumber" class="form-control"  name="ageOfJueJing" id="ageOfJueJing" /></label>
		        </div>
		        </div>
	        </div>
	         
	         <div class="row">     
	        <label for="isJueJing" class="col-sm-4 control-label">您是否已经生育小孩?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="isHasChild" id="isHasChild1" value="否" onclick="checkYes(this);">否 </label>
	        <label class="radio-inline"> <input type="radio" name="isHasChild" id="isHasChild2" value="是" onclick="checkYes(this);"> 是 </label>
	        <div class="form-group" id="isHasChildDiv" style="display: none;">
		        <label for="isHasChildYes" class="col-sm-4 control-label">生第一胎的年龄?</label>
		        <label><input type="text" class="form-control" name="isHasChildYes" /></label>
	        </div>
	        </div></div>
	         
	         <div class="row">       
	        <label for="isWeiNai" class="col-sm-4 control-label">您是否哺养过孩子（喂奶）?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="isWeiNai" id="isWeiNai1" value="否" >否 </label>
	        <label class="radio-inline"> <input type="radio" name="isWeiNai" id="isWeiNai2" value="是"> 是 </label>
	        </div></div>
	        
	        <label for="hasGongJing" class="col-sm-4 control-label">您是否做过宫颈细胞学涂片检查?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="hasGongJing" id="hasGongJing1" value="否" >否 </label>
	        <label class="radio-inline"> <input type="radio" name="hasGongJing" id="hasGongJing2" value="是" > 是 </label>
	        <label class="radio-inline"> <input type="radio" name="hasGongJing" id="hasGongJing2" value="不知道"> 不知道 </label>
	        </div>
	        
	       <div class="row">
	        <label for="FuyongCiJS" class="col-sm-4 control-label"> 您是否在服用雌激素类药物?</label>
	        <div class="col-sm-8" id="isHasChildpdiv">
	        <label class="radio-inline"> <input type="radio" name="FuyongCiJS" id="FuyongCiJS1" value="否" onclick="checkYes(this);">否 </label>
	        <label class="radio-inline"> <input type="radio" name="FuyongCiJS" id="FuyongCiJS2" value="是" onclick="checkYes(this);"> 是 </label>
	        <div class="form-group " id="FuyongCiJSDiv" style="display: none">
	        <label for="ageOfJueJing" class="col-sm-4 control-label">您服用的时间(年)?</label>
	        <label><input type="text" class="form-control" name="FuyongCiJSYes"  /></label>
	        </div>
	        </div></div>
	        
	        <div class="row">
	        <label for="hasRuXianZS" class="col-sm-4 control-label">您患有或患过乳腺增生症吗?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="hasRuXianZS" value="否" >否 </label>
	        <label class="radio-inline"> <input type="radio" name="hasRuXianZS"  value="是" > 是 </label>
	        <label class="radio-inline"> <input type="radio" name="hasRuXianZS"  value="不知道"> 不知道 </label>
	        </div></div>
	        
	        <div class="row">
	        <label for="hasRuXianAi" class="col-sm-4 control-label">您患有或患过乳腺癌吗? </label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="hasRuXianAi"  value="否" >否 </label>
	        <label class="radio-inline"> <input type="radio" name="hasRuXianAi"  value="是" > 是 </label>
	        <label class="radio-inline"> <input type="radio" name="hasRuXianAi" value="不知道"> 不知道 </label>
	        </div></div>
	        
	        <div class="row">
	        <label for="hasORuXianAi" class="col-sm-4 control-label">您母亲和姐妹患过乳腺癌吗?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="hasORuXianAi"  value="否" >否 </label>
	        <label class="radio-inline"> <input type="radio" name="hasORuXianAi"  value="是" > 是 </label>
	        <label class="radio-inline"> <input type="radio" name="hasORuXianAi"  value="不知道"> 不知道 </label>
	        </div></div>
	       
	       <div class="row">
	        <label for="howCheckRuXianAi" class="col-sm-4 control-label"> 您多长时间做一次乳腺检查?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="howCheckRuXianAi"  value="1年及以下" >1年及以下 </label>
	        <label class="radio-inline"> <input type="radio" name="howCheckRuXianAi"  value="2年" >2年 </label>
	        <label class="radio-inline"> <input type="radio" name="howCheckRuXianAi"  value="3年及以上">3年及以上</label>
	        <label class="radio-inline"> <input type="radio" name="howCheckRuXianAi"  value="不做">不做 </label>
	        </div></div>
	        
	        <div class="row">
	        <label for="isCookOfthen" class="col-sm-4 control-label">您是否经常下厨(每周5天以上)?</label>
	        <div class="col-sm-8">
	        <label class="radio-inline"> <input type="radio" name="isCookOfthen"  value="否" >否 </label>
	        <label class="radio-inline"> <input type="radio" name="isCookOfthen"  value="是" > 是 </label>
	        <label class="radio-inline"> <input type="radio" name="isCookOfthen"  value="不知道"> 不知道 </label>
	        </div>
	        </div>
	       </fieldset>
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
       	  <label class="radio-inline"> <input type="radio" name="isXiyan"  value="是" >是</label>
       	  <label class="radio-inline"> <input type="radio" name="isXiyan"  value="否" >否</label>
       	   <label class="radio-inline"> <input type="radio" name="isXiyan"  value="已戒" >已戒</label>
        </fieldset>
        
        <div id="isXiyanYes" style="display: block">
        	
        </div>
        
        <input type="submit" value="提交" >
  </form>
  
  
</div>

<script type="text/javascript">
	
	//alert(submit.onclick);
</script>
</body>
</html>