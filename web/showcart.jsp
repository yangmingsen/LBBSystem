<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/1
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>
<%@ page import="java.util.Collection,java.util.Iterator" %>

<html>
    <head><title>欢迎来到LBBSystem</title></head>
    <body>
        <%
            request.setCharacterEncoding("utf-8");

            String action=request.getParameter("action");
            if(action!=null && action.equals("保存修改")){
                String strItemNum=request.getParameter("itemnum");
                if(null==strItemNum || "".equals(strItemNum)){
                    throw new ServletException("非法的参数");
                }
                int itemNum = Integer.parseInt(strItemNum);
                for(int i=0; i<itemNum; i++){
                    String strNum=request.getParameter("num_"+i);
                    String strBookId = request.getParameter("book_"+i);
                    int quantity = Integer.parseInt(strNum);
                    int bookId = Integer.parseInt(strBookId);
                    boolean bEnough = bookdb.isAmountEnough(bookId,quantity);
                    if(bEnough){
                        cart.setItemsNum(new Integer(bookId),quantity);
                    }else {
                        BookBean book = bookdb.getBook(bookId);
                        out.println("<font color=\"red\"size=\"4\">");
                        out.print("《"+book.getTitle()+"》");
                        out.print("的库存量只有"+book.getAmount()+"本,请调整借阅量!<p>");
                        out.println("</font>");
                    }
                }
            }
        %>
        <%
            Collection<CartItemBean> c1 = cart.getItems();
            if(c1.size()<=0){
                out.println("借阅列表中没有图书<p>");
            %>
        <a href="accessMain.jsp">继续借阅</a>
        <%
                return ;
            }
            Iterator<CartItemBean>it = c1.iterator();
        %>
        <form name="theform" action="showcart.jsp" method="post">
            <table border="1">
                <tr>
                    <th>书名</th>
                    <th>数量</th>
                    <th>取消</th>
                </tr>
                <%
                    int i=0;
                    while(it.hasNext()){
                        CartItemBean cartItem = (CartItemBean)it.next();
                        BookBean book = cartItem.getBook();
                        int bookId = book.getId();
                        String fieldNum = "num_"+i;
                        String fieldBook = "book_"+i;
                %>
                        <tr>
                            <td><%=book.getTitle()%></td>
                            <td>
                                <input type="text" name="<%=fieldNum%>" value="<%=cartItem.getQuantity()%>" size="2"/>
                                <input type="hidden" name="<%=fieldBook%>" value="<%=bookId%>"/>
                            </td>
                            <td><a href="delitem.jsp?id=<%=bookId%>">删除</a> </td>
                        </tr>
                <%
                    i++;
                    }
                %>

            </table><p>
            <input type="hidden" name="itemnum" value="<%=i%>"/>
            <input type="submit" name="action" value="保存修改"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="accessMain.jsp">继续购物</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="transaction_check.jsp">借阅</a>
        </form>
    </body>
</html>
