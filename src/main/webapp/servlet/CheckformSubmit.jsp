<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="com.dao.User" %>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="com.dao.UserDAO" %>
<%@ page import="com.dao.Check01" %>
<%@ page import="com.dao.Check01DAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Logger logger = LoggerFactory.getLogger("SurveySubmit.jsp");
    request.setCharacterEncoding("UTF-8");
    String type = request.getParameter("type");
    if(type == null || type == "") return;
    User user = null;

    if( request.getSession().getAttribute("user") != null){
        user = (User) request.getSession().getAttribute("user");
    }else{
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    
    String submit = request.getParameter("submit");
    if(type.equals("check01")){
        try {
            Check01 check01 = BeanUtil.getBeanNoNullStringFromRequest(request, Check01.class, null);
            Check01DAO dao = new Check01DAO();
            check01.setUid(user.getId());
            dao.saveOrUpdate(check01);
            if(submit.contains("下一页")){
                response.sendRedirect(request.getContextPath() + "/survey_health.jsp");
            }else{
                response.sendRedirect(request.getContextPath() + "/survey.jsp?result=success");
            }
            return;
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/survey.jsp?result=error");

        }

    }

%>