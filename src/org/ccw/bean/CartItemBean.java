package org.ccw.bean;

import java.io.Serializable;

public class CartItemBean implements Serializable {
    private BookBean book = null;
    private int quantity = 0;

    public CartItemBean() {
    }

    public CartItemBean(BookBean book) {
        this.book = book;
        this.quantity = 1;
    }

    public BookBean getBook() {
        return book;
    }

    public void setBook(BookBean book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


}
