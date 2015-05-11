<%@ page language="java" import="javax.naming.*,java.io.*,javax.mail.*,
javax.mail.internet.*,com.sun.mail.smtp.*" pageEncoding="utf-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>">

  <title>找回密码</title>
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <!--
  <link rel="stylesheet" type="text/css" href="styles.css">
  -->
  <link href="boots/css/bootstrap.min.css" rel="stylesheet">
  <script src="boots/js/jquery.min.js"></script>
  <script src="boots/js/bootstrap.min.js"></script>
  <link href="topmenu.css" rel="stylesheet">

  <link rel="stylesheet" type="text/css" href="ucenter.css"/>
</head>
<body >
<jsp:include page="tophead.jsp"></jsp:include>


<%
  Session mailSession = Session.getInstance(System.getProperties());
  Transport transport = new SMTPTransport(mailSession,new URLName("localhost"));
  transport.connect("localhost",25,null,null);

  MimeMessage m = new MimeMessage(mailSession);

  m.setFrom(new InternetAddress(request.getParameter("from")));

  Address[] toAddr = new InternetAddress[] {
    new InternetAddress(request.getParameter("to"));
  };
  m.setRecipients(javax.mail.Message.RecipientType.TO, toAddr );

  m.setSubject(request.getParameter("subject"));

  m.setSentDate(new java.util.Date());

  m.setContent("", "text/plain");

  transport.sendMessage(m,m.getAllRecipients());
  transport.close();
  out.println("Thanks for sending mail!");
  }


%>

<div class="contentDiv">
  <form class="form-horizontal" method="post" role="form"
        data-toggle="validator" action="loginResProcess.jsp">
    <fieldset>
      <!-- Form Name -->
      <legend>找回密码</legend>

      <div class="form-group">
        <label class="col-md-4 control-label" for="passwordinput">注册邮箱：</label>
        <div class="col-md-5">
          <input id="passwordinput" name="email"
                 type="email" placeholder="邮箱" class="form-control input-md" required>

        </div>
      </div>


    <div class="form-group">
      <div class="col-md-8">
        <a class="btn btn-default" href="findpwd.jsp" role="button">找回密码</a>
      </div>
    </div>
  </form>

</div>


</body>
</html>
