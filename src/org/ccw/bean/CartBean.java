package org.ccw.bean;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class CartBean implements Serializable {
    private HashMap<Integer,CartItemBean> items = null;
    private int numOfItems = 0;

    public CartBean() {
        items = new HashMap<Integer, CartItemBean>();
    }

    /**
     * 在购物车上增加一个条目,如果购物车已存在该条目,则什么也不做
     */
    public synchronized void addItem(Integer bookId, BookBean book) {
        if(!items.containsKey(bookId)) {
            CartItemBean item = new CartItemBean(book);
            items.put(bookId,item);
            numOfItems++;
        }
    }

    /**
     * 从购物车删除一个图书条目
     */
    public synchronized void deleteItem(Integer bookId) {
        if(items.containsKey(bookId)) {
            items.remove(bookId);
            numOfItems--;
        }
    }

    /**
     * 清除购物车中的所有图书条目
     */
    public synchronized void clear() {
        items.clear();
        numOfItems=0;
    }

    /**
     * 得到购物车中图书条目的总数
     */
    public synchronized int getNumOfItems() {
        return numOfItems;
    }
    /**
     * 设置某本图书的借阅量
     */
    public synchronized void setItemsNum(Integer bookId, int quantity) {
        if(items.containsKey(bookId)) {
            CartItemBean item = (CartItemBean)items.get(bookId);
            //如果设置数量小于或等于0，则删除购物车中的相应图书条目
            if(quantity <= 0) {
                items.remove(bookId);
            }else{
                item.setQuantity(quantity);
            }
        }
    }

    /**
     * 得到购物车中的所有图书条目
     */
    public synchronized Collection<CartItemBean> getItems() {
        return items.values();
    }

    /**
     * 判断图书是否已经加入购物车中
     */
    public synchronized boolean isExist(Integer bookId) {
        if(items.containsKey(bookId)) {
            return  true;
        }else {
            return false;
        }

    }
}
