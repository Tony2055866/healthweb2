<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mysql.jdbc.StringUtils" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="com.util.PageUtil" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.lang.reflect.Field" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="head.jsp">
  <jsp:param name="title" value="调查表-打印预览"></jsp:param>
</jsp:include>

<%
  request.setCharacterEncoding("UTF-8");
  System.out.println("check.jsp : " + session.getAttribute("user"));
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp?type=6");
    return;
  }
  User user = (User) session.getAttribute("user");
  user = BeanUtil.getBeanNoNullString(request, User.class, user);
%>


<body style="background-color:#f8f8f8">

<jsp:include page="tophead.jsp"></jsp:include>

<div class="printDvi" >

  <label>打印预览</label>
  <input type="button" style="margin-left: 100px" class="btn btn-success" value="确认打印" onclick="myPrint();">
</div>

<div class="contentDiv" id="print">
  <link href="boots/css/bootstrap.min.css" rel="stylesheet">

  <style type="text/css">
    .titleDiv{
      font-size: 17px;
      margin: 20px 0px 10px 0px;
      padding-left: 20px;
      border-bottom: 1px solid #e5e5e5;
    }
    .control-label1{
      width: 120px;
    }
    .control-label2{
      width: 150px;
    }
    .control-label3{
      width: 200px;
    }
    .smallInput{
      width: 80px;
    }
    .titleDiv{
      margin-top: 5px;
    }
    .inputdiv{
      min-height: 2em; border: 1px solid #9d9d9d;margin-top: 1px; display: inline-block;
    }
  </style>
  <h3>体检项目表</h3>

    <div id="legend" class="">
      <legend >第一部分：体格检查
      </legend>
    </div>
    <div class="titleDiv">一般项目</div>
    <table width="100%">

      <%
        Check01DAO check01DAO = new Check01DAO();
        check01DAO.getSession().clear();
        Check01 check = check01DAO.findById(user.getId());
        check = BeanUtil.getBeanNoNullString(request, Check01.class, check);

        FormdataDAO dao = new FormdataDAO();
        for(int i=1; i<=24; i+=2){ Formdata form = dao.findById(i);
        Formdata form2 = dao.findById(i+1);
        String label1 = form.getLabel()+ "(" +form.getUnit() + ")";
        String label2 = form2.getLabel()+ "(" +form2.getUnit() + " )";
        if(form.getUnit().equals("无") || StringUtils.isNullOrEmpty(form.getUnit())){
          label1 = form.getLabel();
        }
        if(form2.getUnit().equals("无") || StringUtils.isNullOrEmpty(form2.getUnit())){
          label2 = form2.getLabel();
        }
        String name1 = form.getName();
        String name2 = form2.getName();
        String val1 = BeanUtil.getField(check.getClass(), name1, check);
        String val2 = BeanUtil.getField(check.getClass(), name2,check);
      %>
      <tr>
        <td width="50%">
            <label class="control-label3"><%=label1 %></label>
              <input  name="<%=name1%>" style="width: 80px;" type="text"  value="<%=val1%>">
        </td>
        <td width="50%">
            <label class="control-label3"><%=label2 %></label>
              <input  name="<%=name2%>" style="width: 80px;" type="text" placeholder=""  value="<%=val2%>">
          </div>
        </td>
      </tr>
      <%} %>

    </table>
    <div class="titleDiv">其他项目</div>
    <%for(int i=25; i<=31; i++){
      Formdata form = dao.findById(i);

    %>
    <div>
      <label class="control-label2" ><%=form.getLabel() %>：</label>
      <%  String val = BeanUtil.getField(check.getClass(),form.getName(), check).trim();
        if(val.length() > 0){
      %>
      <textarea style="height: auto;width: 70%;" name="<%=form.getName()%>" type="text" ><%=BeanUtil.getField(check.getClass(),form.getName(), check).trim()%></textarea>
      <%}%>
    </div>
    <%} %>



<%
  Check02DAO check02DAO = new Check02DAO();
  check02DAO.getSession().clear();
  Check02 check02 = check02DAO.findById(user.getId());
  check02 = BeanUtil.getBeanNoNullString(request, Check02.class, check02);
%>
<div id="legend" class="">
  <legend >第二部分：实验室检查
  </legend>
</div>
<div class="titleDiv">基本常规项目</div>
<table width="100%">
  <%for(int i=32; i<77; i+=2){
    Formdata form = dao.findById(i);
    Formdata form2 = dao.findById(i+1);
    if(form.getType().equals("num")) form.setType("number");
    if(form2.getType().equals("num")) form2.setType("number");

    String label1 = form.getLabel() ; //+ "(" +form.getUnit() + ")";
    String label2 = form2.getLabel(); //+ "(" +form2.getUnit() + " )";
    String unit1 = form.getUnit();
    String unit2 = form2.getUnit();

    String ph1 = form.getType().equals("text") ? "文本":"数值";
    String ph2 = form2.getType().equals("text") ? "文本":"数值";
    if( StringUtils.isNullOrEmpty(form.getUnit()) || form.getUnit().equals("无")){
      label1 = form.getLabel();
      unit1 = "";
    }
    if( StringUtils.isNullOrEmpty(form2.getUnit()) || form2.getUnit().equals("无")){
      label2 = form2.getLabel();
      unit2 = "";
    }
  %>
  <tr>
    <td>
      <div >
        <label class=" control-label3" ><%=label1 %></label>
          <div style="width: 80px;min-height: 2em; border: 1px solid #9d9d9d;margin-top: 1px; display: inline-block"
                  ><%=BeanUtil.getField(check02.getClass(), form.getName(), check02).trim()%></div>
          <div style="display: inline-block; text-align: center;height: 2em; line-height: 2em;">
            <span style="height: 2em; line-height: 2em; "><%=unit1%></span>
          </div>

        <!-- kg -->
      </div>
    </td>
    <%if(i+1 < 77){%>
    <td>
      <div >
        <label class="control-label3" ><%=label2 %></label>

        <div style="width: 80px;min-height: 2em; border: 1px solid #9d9d9d;margin-top: 1px; display: inline-block" rows="1"
                ><%=BeanUtil.getField(check02.getClass(), form2.getName(), check02).trim()%></div>
        <div style="display: inline-block; text-align: center;height: 2em; line-height: 2em;">
          <span style="height: 2em; line-height: 2em; "><%=unit2%></span>
        </div>
      </div>
    </td>
    <%}%>
  </tr>
  <%} %>
</table>



<%
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

  Check03DAO check03DAO = new Check03DAO();
  check03DAO.getSession().clear();
  Check03 check03 = check03DAO.findById(user.getId());
  check03 = BeanUtil.getBeanNoNullString(request, Check03.class, check03);
%>
<div id="legend" class="">
  <legend >第三部分：实验室血液检验
  </legend>
</div>

<div class="titleDiv">血型</div>
<div>
  <label class=" control-label3">血型ABO正反定型:</label>
    <select style="width: 160px; height:2em;" name="labxone0" >
      <%
        out.println(PageUtil.getOptions(new String[]{"O型", "A型", "B型", "AB型"},
                check03.getLabxone0())); %>
    </select>
</div>

<% for(int i=0; i<divs.size(); i++){
  MyDiv div = divs.get(i);
  int width = 80;
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
    String val1 = BeanUtil.getField(check03.getClass(),form1.getName(),check03);
  %>
  <tr>
    <td>
      <div >
        <label  style="width: 160px"><%=form1.getLabel() %></label>
          <div name="<%=form1.getName()%>" class="inputdiv" style="width: <%=width%>px;display: inline-block" ><%=val1%></div>
          <% if( !form1.getUnit().equals("") ){ %>
          <span style="width: auto;padding: 3px 4px 3px 10px;display: inline-block "><%=form1.getUnit()%></span>
          <%}%>
        <!-- kg -->
      </div>
    </td>

    <%if(j+1 < div.forms.size()){
      Formdata form2 = div.forms.get(j+1);
      String val2 =  BeanUtil.getField(check03.getClass(),form2.getName(),check03);
    %>
    <td>
      <div >
        <label  style="width: 160px"><%=form2.getLabel() %></label>
          <div  name="<%=form2.getName()%>" class="inputdiv" style="width: 80px" ><%=val2%></div>
        <% if( !form2.getUnit().equals("") ){ %>
        <span  style="width: auto;padding: 3px 4px 3px 10px;"><%=form2.getUnit()%></span>
        <%}%>
      </div>
    </td>
    <%}%>
  </tr>

  <%}%>
</table>

<%}%>





<%
   query = HibernateSessionFactory.getSession().createQuery("from Formdata f where f.id > 212 and f.id < 238");
   forms = query.list();
  Check04DAO check04DAO = new Check04DAO();
  check04DAO.getSession().clear();
  Check04 check04 = check04DAO.findById(user.getId());
  check04 = BeanUtil.getBeanNoNullString(request, Check04.class, check04);
%>

<legend >第四部分：仪器检查
</legend>
<%
  for(Formdata form:forms){
    String val1 = BeanUtil.getField(check04.getClass(), form.getName(), check04);
%>
<div>
  <label  style="width: 150px;"><%=form.getLabel() %>：</label>
			   <textarea name="<%=form.getName()%>" type="text" style="height: auto;width: 60%;"  ><%=val1%></textarea>
</div>
<%}%>

</div>

<div class="printDvi" >
  <label>打印预览</label>
  <input type="button" style="margin-left: 100px" class="btn btn-success" value="确认打印"  onclick="myPrint();">
</div>
</body>
</html>
