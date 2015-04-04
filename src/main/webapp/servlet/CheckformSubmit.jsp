<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="com.util.BeanUtil" %>
<%@ page import="com.dao.*" %>
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
            if(submit != null && submit.contains("下一页")){
                response.sendRedirect(request.getContextPath() + "/checkForm02.jsp");
            }else{
                response.sendRedirect(request.getContextPath() + "/checkForm01.jsp?result=success");
            }
            return;
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/checkForm01.jsp?result=error");
        }
    }else if (type.equals("check02")){
        try {
            Check02 check02 = BeanUtil.getBeanNoNullStringFromRequest(request, Check02.class, null);
            Check02DAO dao = new Check02DAO();
            check02.setUid(user.getId());
            dao.saveOrUpdate(check02);
            if(submit != null && submit.contains("下一页")){
                response.sendRedirect(request.getContextPath() + "/checkForm03.jsp");
            }else{
                response.sendRedirect(request.getContextPath() + "/checkForm02.jsp?result=success");
            }
            return;
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/checkForm02.jsp?result=error");
        }
    }else if (type.equals("check03")){
        try {
            Check03 check03 = BeanUtil.getBeanNoNullStringFromRequest(request, Check03.class, null);
            Check03DAO dao = new Check03DAO();
            check03.setUid(user.getId());
            dao.saveOrUpdate(check03);
            if(submit != null && submit.contains("下一页")){
                response.sendRedirect(request.getContextPath() + "/checkForm04.jsp");
            }else{
                response.sendRedirect(request.getContextPath() + "/checkForm03.jsp?result=success");
            }
            return;
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/checkForm03.jsp?result=error");
        }
    }

%>