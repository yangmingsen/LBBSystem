<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/1
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>

<html>
    <head><title>欢迎来到LBBSystem</title></head>
    <body>
        <jsp:include page="additem.jsp" flush="false" />
        <%
            String strBookId = request.getParameter("id");
            if(null == strBookId || "".equals(strBookId)){
                response.sendRedirect("catalog.jsp");
                return;
            }else {
                int bookId = Integer.parseInt(strBookId);
                BookBean book = bookdb.getBook(bookId);
        %>
        <table border="1">
            <tr>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>库存</th>
            </tr>
            <tr>
                <td>《<%=book.getTitle()%>》</td>
                <td><%=book.getAuthor()%></td>
                <td><%=book.getBookconcern()%></td>
                <td><%=book.getAmount()%></td>
            </tr>
        </table>
        <%
            if(cart.isExist(new Integer(bookId))){
                out.println("该图书已存在借阅书籍列表中<br>");
            }else{
        %>
        <a href="bookinfo.jsp?add=<%=bookId%>&id=<%=bookId%>">加入借阅列表中</a>
        <br>
        <%
            }
        %>
        借阅列表中现有<%=cart.getNumOfItems()%>种图书
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="showcart.jsp">查看借阅列表</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
            }
        <a href="catalog.jsp">查看库存图书</a>
    <%
        }
    %>
    </body>
</html>
