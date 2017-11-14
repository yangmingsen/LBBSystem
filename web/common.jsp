<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/1
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="org.ccw.bean.*"%>
<%@page errorPage="error.jsp" %>
<jsp:useBean id="bookdb" scope="application" class="org.ccw.bean.BookDBBean" />
<jsp:useBean id="cart" scope="session" class="org.ccw.bean.CartBean"/>