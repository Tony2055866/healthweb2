<%@ page import="com.util.BeanUtil" %>
<%@ page import="com.dao.*" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    
  Logger logger = LoggerFactory.getLogger("SurveySubmit.jsp");
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

    String submit = request.getParameter("submit");
    System.out.println("test submit value: " + submit);
    if(type.equals("survey")){
    try {
      user = BeanUtil.getBean(request, User.class, user);
      UserDAO dao = new UserDAO();
      dao.update(user);
      logger.info("save user : " + user );
        if(submit != null && submit.contains("下一页")){
            response.sendRedirect(request.getContextPath() + "/survey_health.jsp");
        }else{
            response.sendRedirect(request.getContextPath() + "/survey.jsp?result=success");
        }
      return;
    } catch (Exception e) {
      e.printStackTrace();
      response.sendRedirect(request.getContextPath() + "/survey.jsp?result=error");

    }

  }else if(type.equals("survey_health")){
    try{
      SurveyHealthDAO dao = new SurveyHealthDAO();
      //SurveyHealth health = dao.findById(user.getId());
      SurveyHealth health = BeanUtil.getBeanForRadioPage2(request, SurveyHealth.class , null);
      health.setUid(user.getId());
      dao.saveOrUpdate(health);
      logger.info("save health : " + health );
        if(submit != null && submit.contains("下一页")){
            response.sendRedirect(request.getContextPath() + "/survey_eat.jsp");
        }else{
            response.sendRedirect(request.getContextPath() + "/survey_health.jsp?result=success");
        }
      return;
    }catch (Exception e){
      response.sendRedirect(request.getContextPath() + "/survey_health.jsp?result=error");
    }
  }else if(type.equals("survey_eat")){
    try{
      SurveyEatDAO dao = new SurveyEatDAO();
      SurveyEat eat = BeanUtil.getBeanNoNullStringFromRequest(request, SurveyEat.class, null);
      logger.info("SurveyEatDAO update eat: " +eat.toString());
      eat.setUid(user.getId());
      dao.saveOrUpdate(eat);

        if(submit != null && submit.contains("下一页")){
            response.sendRedirect(request.getContextPath() + "/survey_check.jsp");
        }else{
            response.sendRedirect(request.getContextPath() + "/survey_eat.jsp?result=success");
        }
      return;
    }catch (Exception e){
      response.sendRedirect(request.getContextPath() + "/survey_eat.jsp?result=error");
    }
   return;
  }else if(type.equals("survey_check")){
      try{
          SurveyCheckDAO dao = new SurveyCheckDAO();
          SurveyCheck check = BeanUtil.getBeanNoNullStringFromRequest(request, SurveyCheck.class, null);
          logger.info("SurveyCheckDAO update check: " +check.toString());
          check.setUid(user.getId());
          dao.saveOrUpdate(check);
          
          user.setFinish("true");
          UserDAO udao = new UserDAO();
          udao.update(user);
          session.setAttribute("user",user);
          response.sendRedirect(request.getContextPath() + "/ucenter.jsp?result=finish1");
          return;
      }catch (Exception e){
          e.printStackTrace();
          response.sendRedirect(request.getContextPath() + "/survey_check.jsp?result=error");
      }
  }

%>
