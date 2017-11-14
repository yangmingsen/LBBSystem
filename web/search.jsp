<%--
  Created by IntelliJ IDEA.
  User: yangmingsen
  Date: 2017/11/1
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp" %>
<%@page import="java.util.Collection,java.util.Iterator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>搜索列表</title>
    <!--  <meta name="keywords" content="jquery购物车,加入购物车" />
     <meta name="description" content="jquery加入购物车帅气效果,和天猫、聚美优品类似" /> -->
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
</head>
<body>

<jsp:include page="additem.jsp" flush="false"/>
<%
    String strKeyword = request.getParameter("keyword");

    System.out.println(strKeyword+":这是搜索关键字(keyword)");/**测试**/

    if (null == strKeyword || strKeyword.equals("")) {
        response.sendRedirect("catalog.jsp");
        return;
    }
    Collection<BookBean> c1 = bookdb.searchBook(strKeyword);
    if (c1.size() <= 0) {
        out.println("对不起,没有找到符合条件的图书");
        out.println("<a href=\"accessMain.jsp\">返回</a>");
        return;
    }
    System.out.println("Collection拿到了数据");
%>

    <div class="container">
         <!--  <h2 class="title">jQuery天猫商品飞入购物车动画代码</h2> -->
         <div class="demo clearfix">
     <%
        Iterator<BookBean> it = c1.iterator();
        while (it.hasNext()) {
            BookBean book = (BookBean) it.next();
            String title = book.getTitle();
            String author = book.getAuthor();
            int book_num = book.getAmount();
            int bookId = book.getId();
            String photo = "images/project_image/"+book.getPhoto_name();
      %>
             <div class="per">
                 <img src=<%=photo%>  width="180" height="240" alt="图片二"/>
                 <h4><span><%=title%></span></h4>
                 <div class="title">作者：<%=author%></div>
                 <div class="title">库存：<%=book_num%></div>
                 <a href="search.jsp?keyword=<%=strKeyword%>&add=<%=bookId%>" rel="nofollow" class="button orange addcart">加入购物车</a>
             </div>
        <%
        }
          %>
         </div>
    </div>

<div class="cart-sidebar">
    <div class="cart">
        <i id="icon-cart"></i>
        <a href="showcart.jsp"><span>购物车</span></a>
    </div>
</div>
<div id="tip">成功加入购物车！</div>

<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/jquery.fly.min.js"></script>

<script src="js/requestAnimationFrame.js"></script>

<script type="text/javascript">
    $(function() {
        var offset = $("#icon-cart").offset();
        $(".addcart").click(function(event) {
            var img = $(this).parent().children('img').attr('src');//获取当前点击图片链接
            var flyer = $('<img class="flyer-img" src="' + img + '">');//抛物体对象
            flyer.fly({
                start: {
                    left: event.pageX, //抛物体起点横坐标
                    top: event.pageY////抛物体起点纵坐标
                },
                end: {
                    left: offset.left + 10, //抛物体终点横坐标
                    top: offset.top + 10, //抛物体终点纵坐标
                },
                onEnd: function() {
                    $("#tip").show().animate({width: '200px'}, 300).fadeOut(500);//成功加入购物车动画效果
                    this.destory();//销毁抛物体
                }
            });
        });
    });
</script>
</body>
</html>



