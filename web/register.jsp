<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/6
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>

<!-- Head -->
<head>

    <%
        String flag=request.getParameter("error");
        System.out.println("error="+flag);
        if("0".equals(flag)){
            %>
        <script>alert("用户名已经存在")</script>
    <%
        }
    %>

    <title>注册表单</title>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link rel="stylesheet" href="css/style_rg.css" type="text/css" media="all">

    <script type="text/javascript">
        function checkUserName(username){
            if(username=='' || !isMobilePhone(username)) {
                alert('请输入正确的手机号码');
            }
            return;
        }
        function isMobilePhone(value) {

            if(value.search(/^(\+\d{2,3})?\d{11}$/) == -1)
                return false;
            else
                return true;
        }
    </script>
</head>

<body>


<h1>注册</h1>

<div class="register w3layouts agileits">
    <h2>用 户 注 册</h2>
    <form action="regsiter_check.jsp" method="post"   accept-charset="UTF-8" >
        <input type="text" name="acct"  value="" placeholder="用户名/手机号码" onblur="checkUserName(this.value);" >
        <input type="password" name="pasd" placeholder="密码" required="" >
        <input type="text" name="real_name" placeholder="真实姓名" required="">
        <input type="text" name="nick_name" placeholder="昵称" required="">

    <div class="send-button w3layouts agileits">
        <form>
            <input type="submit" value="免费注册">
        </form>
    </div>
    </form>
        <div class="clear"></div>
</div>

<div class="clear"></div>

<div class="footer w3layouts agileits">
    <p>Copyright &copy;2017 YMS for Ccw2110</p>
</div>

</body>

</html>
