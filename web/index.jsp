<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/10/30
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>示例登陆页</title>
  <style>
    #win10-login {
      background: url('./images/view.jpg') no-repeat fixed;
      width: 100%;
      height: 100%;
      background-size: 100% 100%;
      position: fixed;
      z-index: -1;
      top: 0;
      left: 0;
    }

    #win10-login-box {
      width: 300px;
      overflow: hidden;
      margin: 0 auto;
    }

    .win10-login-box-square {
      width: 105px;
      margin: 0 auto;
      border-radius: 50%;
      background-color: darkgray;
      position: relative;
      overflow: hidden;
    }

    .win10-login-box-square::after {
      content: "";
      display: block;
      padding-bottom: 100%;
    }

    .win10-login-box-square .content {
      position: absolute;
      width: 100%;
      height: 100%;
    }

    input {
      width: 90%;
      display: block;
      border: 0;
      margin: 0 auto;
      line-height: 36px;
      font-size: 20px;
      padding: 0 1em;
      border-radius: 5px;
      margin-bottom: 11px;
    }

    .login-username, .login-password {
      width: 91%;
      font-size: 13px;
      color: #999;
    }

    .login-password {
      width: calc(91% - 54px);
      -webkit-border-radius: 2px 0 0 2px;
      -moz-border-radius: 2px 0 0 2px;
      border-radius: 5px 0 0 5px;
      margin: 0px;
      float: left;
    }

    .login-submit {
      margin: 10px 20px 30px 40px;
      float: center;
      -webkit-border-radius: 0 5px 5px 0;
      -moz-border-radius: 0 5px 5px 0;
      border-radius: 0 5px 5px 0;
      background-color: #009688;
      width: 54px;
      display: inline-block;
      height: 36px;
      line-height: 36px;
      padding: 0 auto;
      color: #fff;
      white-space: nowrap;
      text-align: center;
      font-size: 14px;
      border: none;
      cursor: pointer;
      opacity: .9;
      filter: alpha(opacity=90);
    }
    .reg-submit {
      margin: 10px 20px 30px 40px;
      float: left;
      -webkit-border-radius: 0 5px 5px 0;
      -moz-border-radius: 0 5px 5px 0;
      border-radius: 0 5px 5px 0;
      background-color: #009688;
      width: 54px;
      display: inline-block;
      height: 36px;
      line-height: 36px;
      padding: 0 auto;
      color: #fff;
      white-space: nowrap;
      text-align: center;
      font-size: 14px;
      border: none;
      cursor: pointer;
      opacity: .9;
      filter: alpha(opacity=90);

    }
  </style>
</head>
<body>

<%
  String flag = request.getParameter("login");
  if("0".equals(flag)){
        %>
  <script>alert("用户名或密码错误")</script>
<%
    }
  %>
  <%
    if("1".equals(flag)){
        %>
<script>alert("请登录后再进行借阅")</script>
<%
    }
%>

<div id="win10-login">
  <div style="height: 10%;min-height: 120px"></div>
  <div id="win10-login-box">
    <div class="win10-login-box-square">
      <img src="./images/head_photo.jpg" class="content"/>
    </div>
    <p style="font-size: 24px;color: white;text-align: center">游客</p>
    <form target="_self" method="get" action="login_check.jsp">
      <!--用户名-->
      <input type="text" name="acct"  placeholder="请输入登录名" class="login-username" required="" >
      <!--密码-->
      <input type="password"  name="pasd" placeholder="请输入密码" class="login-username" required="">

      <input type="submit"  value="登录" class="login-submit"/>

      <a href="register.jsp"   class="reg-submit">注册</a>
    </form>
  </div>
</div>


</body>
</html>