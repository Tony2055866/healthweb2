<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="com.dao.*" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Logger logger = LoggerFactory.getLogger(this.getClass());
  request.setCharacterEncoding("UTF-8");
  //response.setContentType("text/html");
  String type = request.getParameter("type");
  System.out.println("SurveySubmit.jsp doPost : " + type + " " + request.getSession().getAttribute("user") + "  ; " + request.getParameter("nameZh"));
  if(type == null || type == "") return;
  User user = null;
  if( request.getSession().getAttribute("user") != null){
    user = (User) request.getSession().getAttribute("user");
  }else{
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
  }

  if(type.equals("survey")){
    try {
      user = BeanUtil.getBean(request, User.class, user);
      UserDAO dao = new UserDAO();
      dao.update(user);
      logger.info("save user : " + user );
      response.sendRedirect(request.getContextPath() + "/survey.jsp?result=success");
    } catch (Exception e) {
      e.printStackTrace();
    }
    response.sendRedirect(request.getContextPath() + "/survey.jsp?result=error");
  }else if(type.equals("survey_eat")){
    try {
      user = BeanUtil.getBean(request, User.class, user);
      UserDAO dao = new UserDAO();
      dao.update(user);
      logger.info("save user : " + user );
    } catch (Exception e) {
      response.sendRedirect(request.getContextPath() + "/survey_eat.jsp?result=success");
      e.printStackTrace();
    }
    response.sendRedirect(request.getContextPath() + "/survey_eat.jsp?result=error");
  }else if(type.equals("survey_health")){
    try{
      SurveyHealthDAO dao = new SurveyHealthDAO();
      //SurveyHealth health = dao.findById(user.getId());
      SurveyHealth health = BeanUtil.getBeanForRadioPage2(request, SurveyHealth.class , null);
      health.setUid(user.getId());
      dao.saveOrUpdate(health);
      logger.info("save health : " + health );
      response.sendRedirect(request.getContextPath() + "/survey_health.jsp?result=success");

    }catch (Exception e){
      response.sendRedirect(request.getContextPath() + "/survey_health.jsp?result=error");
    }
  }else if(type.equals("survey_eat")){
    try{
      SurveyEatDAO dao = new SurveyEatDAO();
      SurveyEat eat = BeanUtil.getBeanNoNullStringFromRequest(request, SurveyEat.class, null);
      eat.setUid(user.getId());
      dao.saveOrUpdate(eat);
      response.sendRedirect(request.getContextPath() + "/survey_eat.jsp?result=success");

    }catch (Exception e){
      response.sendRedirect(request.getContextPath() + "/survey_eat.jsp?result=error");
    }
   
  }

%>
