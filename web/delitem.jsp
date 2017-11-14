<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/1
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>
<%
    String strBookId = request.getParameter("id");
    if(null==strBookId || "".equals(strBookId)){
        response.sendRedirect("accessMain.jsp");
        return;
    }else {
        cart.deleteItem(Integer.valueOf(strBookId));
        response.sendRedirect("showcart.jsp");
    }
%>