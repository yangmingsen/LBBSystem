package org.ccw.bean;

import javax.naming.NamingException;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import org.ccw.support.*;

public class BookDBBean implements Serializable {
    private Connection conn = null;
    private static String username = "root";
    private static String password = "123456";
    private static String url="jdbc:mysql://localhost:3306/lbbsmanager?characterEncoding=utf8&useSSL=false";

    public BookDBBean() throws NamingException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

//    public Connection getConnection() throws SQLException {
//        return conn;
//    }
//
//    protected void closeConnection(Connection conn) {
//        if (conn != null) {
//            try {
//                conn.close();
//                conn = null;
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
//    }
//
//    protected void closeStatement(Statement stmt) {
//        if (stmt != null) {
//            try {
//                stmt.close();
//                stmt = null;
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
//    }
//
//    protected void closePreparedStatement(PreparedStatement pstmt) {
//        if (pstmt != null) {
//            try {
//                pstmt.close();
//                pstmt = null;
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
//    }
//
//    protected void closeResultSet(ResultSet rs) {
//        if (rs != null) {
//            try {
//                rs.close();
//                rs = null;
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
//    }
//
    /**
     * 得到数据库所有的图书信息
     */
    public Collection<BookBean> getBooks() throws SQLException {
        Connection conn = this.conn;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<BookBean> bookList = new ArrayList<BookBean>();

        try {
           // conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from bookinfo");
            while (rs.next()) {
                BookBean book = new BookBean(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
                bookList.add(book);
            }

        } catch(SQLException ex){
            //ex.printStackTrace();
            System.out.println("出现异常了在getBooks()");
        }
        return bookList;
    }

    /**
     * 得到选择的图书信息
     */
    public BookBean getBook(int bookId) throws SQLException {
        Connection conn = this.conn;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BookBean book = null;
        try {
           // conn = getConnection();
            pstmt = conn.prepareStatement("select * from bookinfo where id = ?");
            pstmt.setInt(1, bookId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                book = new BookBean(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
            }
        } catch(SQLException ex){
            //ex.printStackTrace();
            System.out.println("出现异常了在getBook()");
        }
        return book;
    }

    /**
     * 通过关键字搜索图书信息
     */
    public Collection<BookBean> searchBook(String keyword) throws SQLException {

        Connection conn = this.conn;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<BookBean> bookList = new ArrayList<BookBean>();
        try {
            //conn = getConnection();
            stmt = conn.createStatement();
            String sql = "select * from bookinfo where title = '" + keyword + "'";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                BookBean book = new BookBean(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
                bookList.add(book);
            }
        }catch(SQLException ex){
            //ex.printStackTrace();
            System.out.println("出现异常了在searchBooks()");
        }
        return bookList;
    }

    /**
     * 通过关键字搜索user账户信息
     */
    public UserDBBean getUserInfo(String keyword) throws  SQLException{
        Connection conn = this.conn;
        Statement stmt = null;
        ResultSet rs = null;
        UserDBBean userinfo = null;

        try{
            stmt=conn.createStatement();
            String sql = "select * from userinfo where acct="+keyword;
            rs = stmt.executeQuery(sql);

            System.out.println("来到了rs=stmt.executeQ下面");

            while(rs.next()){
                userinfo = new UserDBBean(
                         rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
                System.out.println("来到了break这里");
//                break;
            }
        }catch(SQLException ex){
            //ex.printStackTrace();
            System.out.println("出现异常了在getUserInfo()");
        }
        System.out.println("来到了return");
        return  userinfo;
    }

    /**
     * 判断剩余的图书数量是否大于客户借阅量
     */
    public boolean isAmountEnough(int bookId, int quantity) throws SQLException {
        Connection conn = this.conn;
        Statement stmt = null;
        ResultSet rs = null;
        boolean bEnough = false;

        try {
           // conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select amount from bookinfo where id =" + bookId);

            while (rs.next()) {
                int amount = rs.getInt(1);
                if (amount >= quantity)
                    bEnough = true;
            }
        } catch(SQLException ex){
            //ex.printStackTrace();
            System.out.println("出现异常了在isAmountEnough()");
        }
        return bEnough;
    }

    /**
     * 借阅列表中的所以图书
     */
    public synchronized boolean borrowAllBooks(CartBean cart,String user) throws Exception {

        Connection conn = this.conn;
        PreparedStatement pstmt = null;
        Iterator<CartItemBean> it = cart.getItems().iterator();
        try {
           // conn = getConnection();
            String sql = "update bookinfo set amount=amount-? where id=?";
            pstmt = conn.prepareStatement(sql);

            while (it.hasNext()) {
                CartItemBean item = (CartItemBean) it.next();
                BookBean book = item.getBook();
                int bookIdb = book.getId();
                int quantity = item.getQuantity();

                pstmt.setInt(1, quantity);
                pstmt.setInt(2, bookIdb);
                pstmt.addBatch();
            }
            pstmt.executeBatch();
            System.out.println("我已经更新了数据");

        } catch(SQLException ex){
            //ex.printStackTrace();
            System.out.println("出现异常了在 borrowAllBooks()的上半部分");
            return false;
        }

        //借书记录
        Iterator<CartItemBean> it2 = cart.getItems().iterator();

            try {
        String sql2 = "insert into _"+user+"(book_name,book_amount,borrow_date,return_date)"+
                "VALUES(?,?,?,NULL)";
        pstmt = conn.prepareStatement(sql2);

        while (it2.hasNext()) {

            CartItemBean item = (CartItemBean) it2.next();
            BookBean book = item.getBook();
            String title = book.getTitle();
            int quantity = item.getQuantity();
            System.out.println("2.title="+title+"\nquantity"+quantity+"\n");
            pstmt.setString(1,title);
            pstmt.setInt(2, quantity);
            pstmt.setDate(3,Support.getDate());
//            pstmt.setDate(4,NULL);
            pstmt.addBatch();
        }
        pstmt.executeBatch();
    } catch(SQLException ex){
        //ex.printStackTrace();
        System.out.println("出现异常了在 borrowAllBooks()的下半部分");
            return false;
    }
    return true;

    }

    public synchronized boolean registerUser(String acct,String pasd,String real_name,String nick_name) throws SQLException {

        Connection conn = this.conn;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try{
            String sql0 = "select count(*) from userinfo where acct="+acct;
            pstmt = conn.prepareStatement(sql0);
            rs = pstmt.executeQuery();
            if(rs.next()){
                int count=rs.getInt(1);
                if(count>0)
                    return  false;
            }

            String sql = "insert into userinfo(acct,pasd,real_name,nick_name)values(?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,acct);
            pstmt.setString(2,pasd);
            pstmt.setString(3,real_name);
            pstmt.setString(4,nick_name);
            pstmt.executeUpdate();

            String sql2= "create table _"+acct+"(id int auto_increment primary key,book_name varchar(50) not null,book_amount int not null,borrow_date DATE not null,return_date DATE)engine=innoDB;";
            pstmt = conn.prepareStatement(sql2);
            pstmt.executeUpdate();


        }catch (SQLException ex){
            System.out.println("出现异常了,在registerUser()中上半部分");
            return  false;
        }
        return true;
    }
}
