<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/1
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>欢迎来到LBBSystem</title>
    <link rel="stylesheet" type="text/css" href="css/my.css" />
</head>
<body>
    <form method="get" action="search.jsp">
        <div id="out">
             <div>
                  <p id="ti_tle">LBBS 搜索</p>
             </div>
            <div id="ser_box">
              <input type="search" id="ipt" name="keyword" /><span><input id="su" value="搜索一下" class="bg s_btn" type="submit"></span>
            </div>
            <div id="bot_box">
                 <ul id="oul"></ul>
            </div>
        </div>
    </form>
    <script src="js/my.js" type="text/javascript" charset="utf-8"></script>
    <div style="text-align:center;">
    </div>
</body>
</html>