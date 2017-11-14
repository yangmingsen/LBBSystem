<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/5
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common.jsp"%>

<%

    String acct = (String)session.getAttribute("acct");
    if((null == acct)||"".equals(acct)){
        response.sendRedirect("index.jsp?login=1");//请登录
        return;
    }

    if(bookdb.borrowAllBooks(cart,acct)){
        response.sendRedirect("transaction_success.jsp");
    }else{
        response.sendRedirect("error.jsp");
    }

%>
