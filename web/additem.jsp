<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/1
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>

<%
    String strBookId = request.getParameter("add");
    if(strBookId!=null && !"".equals(strBookId)){
        int bookId = Integer.parseInt(strBookId);
        BookBean book = bookdb.getBook(bookId);
        cart.addItem(new Integer(bookId),book);
    }
%>