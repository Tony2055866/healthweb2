<%@ page import="java.lang.reflect.Field" %>
<%@ page import="com.util.PageUtil" %>
<%@ page import="com.dao.User" %>
<%@ page import="com.dao.SurveyEatDAO" %>
<%@ page import="com.dao.SurveyEat" %>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/3/27
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  User user = (User)session.getAttribute("user");
  SurveyEatDAO eatDao = new SurveyEatDAO();
  eatDao.getSession().clear();
  SurveyEat eat = eatDao.findById(user.getId());
  eat = BeanUtil.getBeanNoNullString(request, SurveyEat.class, eat);
%>
<fieldset>
  <div class="titleDiv">一般情况下，您平均每周有几天吃下列食物?</div>
  <table width="98%">
  <%for(int i=0; i<10; i+=2){%>
  <tr>
    <td>
    <label  style="width: 200px"><%=labelseat[i] %></label>
    <select  style="width: 100px;" name="<%=nameseat[i] %>">
      <%
        Field f = eat.getClass().getDeclaredField(nameseat[i]);
        f.setAccessible(true);
        //System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
        out.println(PageUtil.getOptions(new String[]{"5-7天", "3-4天",
                "1-2天", "小于1天"}, f.get(eat).toString())); %>
      %>
    </select>
  </td>
    <td>
      <label  style="width: 200px"><%=labelseat[i+1] %></label>
      <select  style="width: 100px;" name="<%=nameseat[i+1] %>">
        <%
           f = eat.getClass().getDeclaredField(nameseat[i+1]);
          f.setAccessible(true);
          //System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
          out.println(PageUtil.getOptions(new String[]{"5-7天", "3-4天",
                  "1-2天", "小于1天"}, f.get(eat).toString())); %>
        %>
      </select>
    </td>
  </tr>
  <%} %>

    <tr>
      <td>
        <label  style="width: 200px">谷类(大米,面食,杂粮)</label>
        <select  style="width: 100px;" name="eath01">
          <%
            out.println(PageUtil.getOptions(options[0], eat.getEath01())); %>
          %>
        </select>
      </td>
      <td>
        <label  style="width: 200px">肉类(猪,牛羊,家禽)</label>
        <select  style="width: 100px;" name="eath02">
          <%
            out.println(PageUtil.getOptions(options[1], eat.getEath02())); %>
          %>
        </select>
      </td>
    </tr>

    <tr>
      <td>
        <label  style="width: 200px">新鲜蔬菜和水果类</label>
        <select  style="width: 100px;" name="eath03">
          <%
            out.println(PageUtil.getOptions(options[2], eat.getEath03())); %>
          %>
        </select>
      </td>
    </tr>
  </table>


  <div class="titleDiv">您的口味与周围的人相比如何？</div>
  <div class="col-sm-12" style="margin-left: 50px">
    <label class="radio-inline"> <input <%out.println(eat.getEatt().equals("很淡") ? "checked":"");%> type="radio" name="eatt"  value="很淡" >很淡</label>
    <label class="radio-inline"> <input <%out.println(eat.getEatt().equals("略淡") ? "checked":"");%>  type="radio" name="eatt"  value="略淡" >略淡</label>
    <label class="radio-inline"> <input <%out.println(eat.getEatt().equals("相同") ? "checked":"");%> type="radio" name="eatt"  value="相同">相同</label>
    <label class="radio-inline"> <input <%out.println(eat.getEatt().equals("略咸") ? "checked":"");%> type="radio" name="eatt"  value="略咸">略咸</label>
    <label class="radio-inline"> <input <%out.println(eat.getEatt().equals("很咸") ? "checked":"");%> type="radio" name="eatt"  value="很咸">很咸</label>
  </div>

</fieldset>

  <div class="titleDiv">吸烟情况</div>
  <fieldset>
    <label  class="col-sm-4 control-label">您是否吸烟？</label>
    <div class="col-sm-6">
      <label class="radio-inline"> <input required type="radio" name="isXiyan" <%out.println(eat.getIsXiyan().equals("是") ? "checked":"");%> value="是" >是</label>
      <label class="radio-inline"> <input required type="radio" name="isXiyan"  <%out.println(eat.getIsXiyan().equals("否") ? "checked":"");%> value="否" >否</label>
      <label class="radio-inline"> <input required type="radio" name="isXiyan"  <%out.println(eat.getIsXiyan().equals("已戒") ? "checked":"");%> value="已戒" >已戒</label>
    </div>


</fieldset>

<%
  String div1 = "none",div2="none",div3="none";
  String isRequire1 = "",isRequire2 = "",isRequire3 = "";
  if(eat.getIsXiyan().equals("是")) {
    div1 = "block";
    isRequire1 = "required";
  }
  else if(eat.getIsXiyan().equals("否")){
    div2 = "block";
    isRequire2 = "required";
  }

  else if(eat.getIsXiyan().equals("已戒")){
    div3 = "block";
    isRequire2 = "required";
  }

%>
<div id="isXiyanDiv" style="display: <%=div1%>">
  <div >
    <label   style="width:250px;">您主要抽哪种类型的烟?</label>
      <select class="input-xlarge" style="width: 100px;" name="zhuyaoChou">
        <%
          out.println(PageUtil.getOptions(new String[]{"卷烟", "雪茄",
                  "烟丝"}, eat.getZhuyaoChou())); %>
      </select>
  </div>
  <div >
    <label  style="width:250px;">您平均每天吸多少支香烟?</label>
      <input name="howManyYan" type="number" min="1" placeholder="" style="width: 100px;" >
  </div>
  <div >
    <label  style="width:250px;">您多少岁开始吸烟的?</label>
      <input required id="name" name="whenXiYan" type="number" min="1" placeholder="" style="width: 100px;" >
    </div>
  </div>

<div id="isXiyanNo" style="display: <%=div2%>">
  <div>
    <label style="width:250px;">您工作场所或居住场所有人吸烟吗?</label>
      <select class="input-xlarge" style="width: 100px;" name="hasOtherChou">
        <% out.println(PageUtil.getOptions(new String[]{"有", "没有"}, eat.getHasOtherChou())); %>
      </select>
  </div>
</div>

<div id="isXiyanJie" style="display: <%=div3%>">
  <div >
    <label   style="width:350px;">您多少岁开始吸烟的?</label>
      <input required id="name" name="whenXiYan" value="<%=eat.getWhenXiYan()%>" type="number" min="1" placeholder="" style="width: 100px;"  >
  </div>

  <div>
    <label   style="width:350px;">您多少岁戒的烟?</label>
      <input required id="name" name="whenJieYan" type="number" min="1" placeholder="" value="<%=eat.getWhenJieYan()%>" style="width: 100px;"  >
  </div>

  <div >
    <label   style="width:350px;">戒烟前，您平均每天吸多少支香烟?</label>
      <input required id="name" name="howManyYan" type="number" min="1" value="<%=eat.getHowManyYan()%>" placeholder="" style="width: 100px;" >
  </div>

  <div >
    <label   style="width:350px;">您工作场所或居住场所所有人吸烟吗?</label>
      <select  style="width: 100px;" name="hasOtherChou">
        <%
          out.println(PageUtil.getOptions(new String[]{"有", "没有"}, eat.getHasOtherChou())); %>
      </select>
  </div>
</div>

<div class="titleDiv">饮酒情况</div>
<fieldset>
  <div>
    <label   style="width: 300px;">您饮酒吗?</label>
      <select class="input-xlarge" style="width: 200px" name="isdrink" onchange="selectChange(this,'isdrink',0)">
        <%
          String drinkShow = "none";
          String isRequired = "";
          if( "喝酒".equals(eat.getIsdrink()) ){
            drinkShow = "block";
            isRequired = "required";
          }
          out.println(PageUtil.getOptions( new String[]{"喝酒","不喝","以前喝、现在不喝"} , eat.getIsdrink() ));
        %>
      </select>
  </div>

  <div id="isdrinkDiv" style="display:<%=drinkShow%>">
    <div >
      <label  style="width: 300px;">您一般多长时间喝一次酒?</label>
        <select class="input-xlarge" style="width: 80px;" name="howlongDrink" >
          <% out.println(PageUtil.getOptions(new String[]{"每天2次", "每天1次", "每周3-4次", "每周3-4次", "每周小于1次"}, eat.getHowlongDrink())); %>
        </select>
    </div>

    <div >
      <label   style="width: 300px;">您通常每次饮多少酒? (只填写您常喝的酒)</label>
    </div>
    <div >
      <input <%=isRequired%> value="<%=eat.getHowmuchDrink1()%>" name="howmuchDrink1" type="number" min="1" placeholder="" style="width: 80px;margin-left: 20px;">
      两白酒
      <input <%=isRequired%> value="<%=eat.getHowmuchDrink2()%>" name="howmuchDrink2" type="number" min="1" placeholder="" style="width: 80px;margin-left: 20px;">
      两葡萄酒/黄酒
      <input <%=isRequired%> value="<%=eat.getHowmuchDrink3()%>" name="howmuchDrink3" type="number" min="1" placeholder="" style="width: 80px;margin-left: 20px;">
     瓶啤酒
    </div>

    <div >
      <label  style="width: 300px;">如果一天不喝酒，您会感到不舒服吗?</label>
        <select class="input-xlarge" style="width:80px;" name="ismustDrink" >
          <% out.println(PageUtil.getOptions(new String[]{"会", "不会"}, eat.getIsmustDrink() )); %>
        </select>
    </div>
  </div>
</fieldset>


<% String label3[] = {"干家务活", "体育锻炼", "近年来，您参加每次持续20分钟以上的体育锻炼吗?","您平均每周锻炼多少次?",
        "您平均每次锻炼的时间是?","您常用的体育锻炼方式是什么?"};
  String options3[][] = { {"从不", "偶尔","经常"}, {"从不", "偶尔","经常"} , {"是", "否"}, {"3次或以上","1-2次","小于1次" },
          {"大于60分钟","30-60分钟","小于30分钟"},{"散步/快走","跑步","游泳","球类","室内健身","其他"}  };
  String names[] = {"jiawu","tiyu01", "tiyu02", "tiyu03", "tiyu04", "tiyu05"};

  String isshow = "none"; %>

<div class="titleDiv">体力活动及体育锻炼</div>
<fieldset>
  <table width="100%">
    <tr>
      <td>
        <label style="width:200px;" >工作性质</label>
        <select class="input-xlarge" style="width: 100px;" name="work" >
          <% out.println(PageUtil.getOptions(new String[]{"静坐为主", "轻度活动", "体力劳动"}, eat.getWork() )); %>
        </select>

      </td>
      <td>
        <label  style="width:200px;">上班交通</label>
        <select class="input-xlarge" style="width: 100px;" name="jiaotong" >
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
      </td>
    </tr>
    <tr>
      <td>
        <label  style="width: 200px;">每次上班大概要多长时间?</label>
        <select class="input-xlarge" style="width: 100px;" name="jiaotong0">
          <%
            out.println(PageUtil.getOptions(new String[]{"小于20分钟", "大于20分钟"}, val2 ));
          %>
        </select>
      </td>
      <td>
        <label  style="width: 200px;"><%=label3[0]%></label>
        <select class="input-xlarge" style="width: 100px;" >
          <%
            out.println(PageUtil.getOptions(options3[0], eat.getJiawu() ));
          %>
        </select>
      </td>
    </tr>
<%for(int i=1; i<6; i+=2){

%>
    <tr>
      <td>
        <label  style="width: 200px;"><%=label3[i]%></label>
        <select class="input-xlarge" style="width: 100px;" >
          <%
            Field f = eat.getClass().getDeclaredField(names[i]);
            f.setAccessible(true);
            val1 = f.get( eat ).toString();
            out.println(PageUtil.getOptions(options3[1],val1 ));
          %>
        </select>
      </td>
      <%if(i+1 < 6){%>
      <td>
        <label  style="width: 200px;"><%=label3[i+1]%></label>
        <select class="input-xlarge" style="width: 100px;" >
          <%
            f = eat.getClass().getDeclaredField(names[i+1]);
            f.setAccessible(true);
            val1 = f.get( eat ).toString();
            out.println(PageUtil.getOptions(options3[i+1], val1 ));
          %>
        </select>
      </td>
      <%}%>
    </tr>
    <%}%>
  </table>


    <% String qs[] = {"总的来说，您对目前的生活满意吗?","总的来说，您对目前的工作满意吗?",
		    			"在过去的一年中，您认为您工作和生活中的精神压力大吗?","在过去的一年中，您有过心情沮丧或情绪低落吗?",
		    					"在过去的一年中，您有过心情烦躁或焦虑不安吗?","您目前是否从事以下职业1年或以上?"};
		    	String qsps[][] = { {"很满意","满意","不满意","很不满意"},{"很满意","满意","不满意","很不满意"},
		    			{"没有压力","压力较少","一般","压力较大","压力极大"}, {"没有","偶尔","经常"},{"没有","偶尔","经常"},
		    			{"金属冶炼","煤矿开采","隧道开挖","石化","石棉生产","中餐师傅","均无"} };

		    	%>
  <div class="titleDiv">职业、精神及社会因素</div>
  <fieldset>
    <%for(int i=0; i<qs.length; i++){ %>
    <div>
      <label  style="width:400px;"><%=qs[i] %></label>
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
    <%} %>
  </fieldset>



</fieldset>