<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/6
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>

<%
    request.setCharacterEncoding("utf-8");
    String acct = request.getParameter("acct");
    String pasd = request.getParameter("pasd");
    String real_name = request.getParameter("real_name");
    String nick_name = request.getParameter("nick_name");

    if((acct!=null && !"".equals(acct))&&
            (pasd!=null && !"".equals(pasd))&&
                (real_name!=null && !"".equals(real_name))&&
                     (nick_name!=null && !"".equals(nick_name))){

        if(bookdb.registerUser(acct,pasd,real_name,nick_name)){
            response.sendRedirect("regsiter_success.jsp");
            return;
        }else {
            System.out.println("這裡錯了");
            response.sendRedirect("register.jsp?error=0");
            return;
        }
    }else {
        response.sendRedirect("register.jsp");
        return;
    }

%>