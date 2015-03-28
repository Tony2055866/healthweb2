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
        response.sendRedirect("login.jsp?errortype=4");
        return;
    }
    User user = (User) session.getAttribute("user");
    user = BeanUtil.getBeanNoNullString(request, User.class, user);
%>

<style type="text/css">
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

</style>
<body style="background-color:#f8f8f8">

<jsp:include page="tophead.jsp"></jsp:include>


<div class="printDvi" >
    <label>打印预览</label>
    <input type="button" style="margin-left: 100px" class="btn btn-success" value="确认打印">
</div>

<div class="contentDiv">


    <fieldset>
        <div id="legend" class="">
            <legend>第一部分：一般信息
            </legend>
        </div>

        <table width="100%" style="text-align: left">
            <tr width="90%">
                <td>
                    <label class="control-label1">姓名</label>
                    <input type="text" name="nameZh" value="<%=user.getNameZh() %>" required placeholder="输入姓名"
                           class="input-xlarge">
                </td>

                <td>
                    <label class="control-label1">性别</label>
                    <!-- Multiple Radios -->
                    <%String check1 = user.getGender().equals("男") ? "checked=\"checked\"" : "";%>
                    <%String check2 = user.getGender().equals("女") ? "checked=\"checked\"" : "";%>
                    <input type="radio" name="gender" required value="男" <%=check1 %>>
                    男
                    <input type="radio" name="gender" <%=check2%> required value="女">
                    女
                </td>
            </tr>

            <tr width="90%">
                <td>
                    <label class="control-label1" for="company">工作单位</label>

                    <input type="text" name="company" value="<%=user.getCompany() %>" required class="input-xlarge">

                </td>
                <td>
                    <label class="control-label1">民族</label>

                    <select class="input-xlarge" name="nation">
                        <% out.println(PageUtil.getOptions(new String[]{"汉族", "壮族", "满族", "回族", "其他"}, user.getNation())); %>
                    </select>
                </td>
            </tr>

            <tr width="90%">
                <td>
                    <label class="control-label1">贯籍</label>

                    <input type="text" placeholder="贯籍" value="<%=user.getHome() %>" class="input-xlarge" name="home"
                           required>
                </td>
                <td>
                    <label class="control-label1">出生日期</label>

                    <input name="birth" type="text" value="<%=user.getBirth() %>" >
                </td>
            </tr>

            <tr width="90%">
                <td>
                    <label class="control-label1">职业</label>

                    <select class="input-xlarge" name="job">
                        <%
                            out.println(PageUtil.getOptions(new String[]{"行政人员", "自由职业者",
                                    "技术人员", "专职司机", "专职司机", "特殊行业工人", "在校学生", "家庭主妇", "其他"}, user.getJob()));
                        %>
                    </select>
                </td>
                <td>
                    <label class="control-label1">文化程度</label>

                    <select class="input-xlarge" name="education">
                        <%out.println(PageUtil.getOptions(new String[]{"高中及以下", "大专", "本科", "硕士及以上"}, user.getEducation())); %>
                    </select>
                </td>
            </tr>

            <tr width="90%">
                <td>
                    <label class="control-label1">婚姻状况</label>

                    <select class="input-xlarge" name="marriage">
                        <%out.println(PageUtil.getOptions(new String[]{"未婚", "未婚", "离异", "丧偶", "其它"}, user.getMarriage())); %>
                    </select>
                </td>
                <td>
                    <label class="control-label1">通讯地址</label>

                    <input type="text" placeholder="xx省xx市xx区xx路xx号" value="<%=user.getAddress() %>" name="address" required
                           class="input-xlarge">
                </td>
            </tr>

            <tr width="90%">
                <td>
                    <label class="control-label1">手机</label>

                    <input type="text" name="phone" placeholder="手机号" value="<%=user.getPhone() %>" class="input-xlarge"
                           required>
                </td>
                <td>
                    <label class="control-label1" for="input01">Email</label>

                    <input type="text" value="<%=user.getEmail() %>" name="email" placeholder="" class="input-xlarge"
                           required>
                </td>
            </tr>



        </table>

        <jsp:include page="printSurvey01.jsp"></jsp:include>
        <jsp:include page="printSurvey02.jsp"></jsp:include>
        <jsp:include page="printSurvey03.jsp"></jsp:include>
    </fieldset>

</div>

<div class="printDvi" >
    <label>打印预览</label>
    <input type="button" style="margin-left: 100px" class="btn btn-success" value="确认打印">
</div>


</body>
</html>
