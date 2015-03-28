<%@ page import="com.dao.User" %>
<%@ page import="com.dao.SurveyCheckDAO" %>
<%@ page import="com.dao.SurveyCheck" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  User user = (User)session.getAttribute("user");
  SurveyCheckDAO dao = new SurveyCheckDAO();
  dao.getSession().clear();
  SurveyCheck check = dao.findById(user.getId());
%>
<div id="legend" class="">
  <legend >第四部分：体检指标
  </legend>
</div>

<div class="titleDiv">一般检查</div>
<table width="100%">
  <tr>
    <td>
        <label style="width: 200px;" >身高(cm)</label>
          <input required  name="high" type="text" value="<%=check.getHigh()%>" placeholder="" style="width: 80px">
    </td>
    <td>
        <label style="width: 200px;" >体重(kg)</label>
          <input required  name="weight" type="text" value="<%=check.getWeight()%>" style="width: 80px">
      </div>
    </td>

  </tr>
  <tr>
    <td>
        <label style="width: 200px" >收缩压(高压)mmHg</label>
          <input required  name="gaoya" type="text" placeholder="" value="<%=check.getGaoya()%>" style="width: 80px">
    </td>

    <td>
        <label style="width: 200px" >舒张压(低压)mmHg</label>
          <input required  name="diya" type="text" placeholder="" value="<%=check.getDiya()%>" style="width: 80px">
    </td>
  </tr>

  <tr>
    <td>
        <label style="width: 200px" >腰围(cm)</label>
          <input required  name="xiongwei" type="text" placeholder="" value="<%=check.getXiongwei()%>" style="width: 80px">
    </td>
  </tr>
</table>


<div class="titleDiv">心电图检查</div>
<table width="100%" >
  <tr  >
    <td >
        <label  style="width: 100px">早博</label>
          <label class="radio-inline"> <input required type="radio" name="zaobo" <%out.println(check.getZaobo().equals("有") ? "checked":"");%>  value="有" >有 </label>
          <label class="radio-inline"> <input required type="radio" name="zaobo" <%out.println(check.getZaobo().equals("无") ? "checked":"");%> value="无"> 无 </label>
    </td>
    <td >
        <label  style="width: 100px">ST- T改变</label>
          <label class="radio-inline"> <input required type="radio" name="stt"  <%out.println(check.getStt().equals("有") ? "checked":"");%>  value="有" >有 </label>
          <label class="radio-inline"> <input required type="radio" name="stt"  <%out.println(check.getStt().equals("无") ? "checked":"");%> value="无"> 无 </label>
    </td>
  </tr>
  <tr>
    <td>
        <label style="width: 100px" >房颤</label>
          <label class="radio-inline"> <input required type="radio" name="fangchan"  <%out.println(check.getFangchan().equals("有") ? "checked":"");%> value="有" >有 </label>
          <label class="radio-inline"> <input required type="radio" name="fangchan"  <%out.println(check.getFangchan().equals("无") ? "checked":"");%>  value="无"> 无 </label>
    </td>
    <td>
        <label style="width: 100px" >左心室肥大 </label>
          <label class="radio-inline"> <input required type="radio" name="zuoxinshi"  <%out.println(check.getZuoxinshi().equals("有") ? "checked":"");%> value="有" >有 </label>
          <label class="radio-inline"> <input required type="radio" name="zuoxinshi"  <%out.println(check.getZuoxinshi().equals("无") ? "checked":"");%> value="无"> 无 </label>
    </td>
  </tr>
</table>


<div class="titleDiv">X线和B超检查</div>
<table width="100%">
  <%
    String labels[]  ={"肺部阴影","心界扩大","肝脏肿大","肝脏肿块","脂肪肝","胆结石","肾结石","乳房良性结节或肿块"} ;
    for(int i=0; i<4; i++){
      Field f = check.getClass().getDeclaredField("xb0"+(i*2+1));
      f.setAccessible(true);
      String val1 = f.get(check).toString();
       f = check.getClass().getDeclaredField("xb0"+(i*2+2));
      f.setAccessible(true);
      String val2 = f.get(check).toString();
  %>
  <tr width="100%">
    <td>
        <label style="width:100px;" ><%=labels[i*2] %></label>
          <label class="radio-inline"> <input required type="radio" name="xb0<%=(i*2+1)%>" <%out.println(val1.equals("有") ? "checked":"");%> value="有" >有 </label>
          <label class="radio-inline"> <input required type="radio" name="xb0<%=(i*2+1)%>" <%out.println(val1.equals("无") ? "checked":"");%>  value="无"> 无 </label>
    </td>
    <td>
        <label style="width:150px;" ><%=labels[i*2+1] %> </label>
          <label class="radio-inline"> <input required type="radio" name="xb0<%=(i*2+2)%>" <%out.println(val2.equals("有") ? "checked":"");%> value="有" >有 </label>
          <label class="radio-inline"> <input required type="radio" name="xb0<%=(i*2+2)%>" <%out.println(val2.equals("无") ? "checked":"");%> value="无"> 无 </label>
    </td>
  </tr>
  <%} %>
</table>

<div class="titleDiv">实验室检查</div>
<table width="100%" >
  <%
    String labels2[]  ={"血红蛋白(HGB)","血尿酸(UA)","谷丙转氨酶(ALT)","乙肝表面抗原(HBsAg)", "谷草转氨酶AST)",
            "丙型肝炎抗体(HCV)","空腹血糖(Glu)","尿蛋白(PRO)",
            "餐后2小时血糖(PG2h)","大便隐血(OB)" ,"总胆固醇TC)","甲胎蛋白(AFP)",
            "甘油三酯(TG)", "癌胚抗原(CEA)","高密度脂蛋白胆固醇(HDL-C)","C反应蛋白(CRP)",
            "低密度脂蛋白胆固醇LDL-C)", "前列腺特异抗原(PSA)","血肌酐(Cr)"} ;

    String units[]  ={"g/L","μmol/L",
            "IU/L","",
            "IU/L"," ",
            "mmol/L"," ",
            "mmol/L"," " ,
            "mmol/L","μg/L",
            "mmol/L", "μg/L",
            "mmol/L","mg/L",
            "mmol/L", "μg/L",
            "μmol/L"} ;

    int maxValue[] = {};

    for (int i = 0; i < labels2.length; i += 2) {
      String name = "";
      if (i < 9)
        name = "sys0" + (i + 1);
      else
        name = "sys" + (i + 1);
      String name2 = "sys" + (i + 2);
      if (i + 1 < 9)
        name2 = "sys0" + (i + 2);
      Field f = check.getClass().getDeclaredField(name);
      f.setAccessible(true);
      String val1 = f.get(check).toString();
      String val2 = "";
      String u2 = "";

      if (i + 2 <= labels2.length) {
        f = check.getClass().getDeclaredField(name2);
        f.setAccessible(true);
        val2 = f.get(check).toString();
        if (!units[i + 1].trim().equals("")) u2 = "[" + units[i + 1] + "]";
      }

      String u1 = "";
      if (!units[i].trim().equals("")) u1 = "[" + units[i] + "]";
  %>

  <tr width="100%">
    <td>
      <label style="width:200px;" ><%=labels2[i] %> <%=u1%></label>
      <input style="width:80px;"  value="<%=val1%>">
    </td>
    <%if(i+2 <= labels2.length){%>
    <td>
      <label style="width:200px;" ><%=labels2[i+1] %> <%=u2%> </label>
      <input style="width:80px;" value="<%=val2%>">
    </td>
    <%}%>
  </tr>
  <%} %>
</table>