<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/2
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>

<%
   String acct = request.getParameter("acct");
    String pasd = request.getParameter("pasd");
    if(acct==null || "".equals(acct) || pasd==null || "".equals(pasd)){
        response.sendRedirect("index.jsp?login=0");
        return;
    }
    UserDBBean userdb = bookdb.getUserInfo(acct);
    if(userdb==null || !pasd.equals(userdb.getPasd())){
        response.sendRedirect("index.jsp?login=0");
        return;
    }
    session.setAttribute("acct",acct);
    response.sendRedirect("accessMain.jsp");
%>


