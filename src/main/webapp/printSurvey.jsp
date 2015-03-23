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
    .titleDiv{
       margin-top: 0px;
    }

</style>
<body style="background-color:#f8f8f8">

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

    <%
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

            SurveyHealthDAO dao = new SurveyHealthDAO();
            dao.getSession().clear();
            SurveyHealth health = dao.findById(user.getId());
            health = BeanUtil.getBeanNoNullString(request, SurveyHealth.class, health);
        %>

        <div id="legend" class="">
            <legend >第二部分：个人健康状况及家族病史
            </legend>
        </div>
        <div class="titleDiv">您最近半年来出现过下述症状吗?</div>
        <table width="100%">

            <%for(int i=0; i<labels.length; i+=2){
            %>
                <tr width="90%">
                    <td>
                    <label class="col-sm-3 control-label2"><%=labels[i] %>:</label>
                        <select class="input-xlarge" style="width: 100px;" name="<%=names[i] %>">
                            <%
                                Field f = health.getClass().getDeclaredField(names[i]);
                                f.setAccessible(true);
                                //System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
                                out.println(PageUtil.getOptions(new String[]{"没有", "偶尔",
                                        "经常"}, f.get(health).toString() )); %>
                        </select>
                    <td>
                    <% if(i+1 < labels.length){ %>
                    <td>
                        <label class="col-sm-3 control-label2"><%=labels[i+1] %>:</label>
                        <select class="input-xlarge" style="width: 100px;" name="<%=names[i+1] %>">
                            <%
                                 f = health.getClass().getDeclaredField(names[i+1]);
                                f.setAccessible(true);
                                //System.out.println("health.getClass().getDeclaredField(names[i]) :" + f.get(health).toString() + "  " + names[i]);
                                out.println(PageUtil.getOptions(new String[]{"没有", "偶尔",
                                        "经常"}, f.get(health).toString() )); %>
                        </select>
                    <td>
                    <%}%>
                </tr>
            <%} %>

        </table>

        <div class="titleDiv">您目前或曾经患过以下疾病吗?</div>
        <table width="100%">

            <%for(int i=0; i<labels3.length; i++){
            %>
           <tr>
               <td>
                <label class="col-sm-3 control-label2"><%=labels3[i] %>:</label>
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
               </td>
               <td>
                <div id="<%=names3[i] %>Div" style="display:<%=showDiv%>;">
                    <label class="col-sm-2 control-label2">您如何治疗的:</label>
                        <select class="input required-xlarge" style="width: 160px;" name="<%=names3[i] %>0" >
                            <%
                                f.setAccessible(true);
                                String val2 = values.length > 1 ? values[1]:"";
                                out.println(PageUtil.getOptions(new String[]{"在医生指导下治疗", "自我治疗","未治疗"},
                                        val2 )); %>
                        </select>
                </div>
               </td>
           </tr>
            <%} %>

        </table>
    </fieldset>

</div>
</body>
</html>
