package org.ccw.bean;
import java.io.Serializable;

public class BookBean implements Serializable {
    private int id;
    private String title;
    private String author;
    private String bookconcern;
    private String photo_name;
    private int amount;

    public BookBean() {
    }

    public BookBean(int id, String title, String author, String bookconcern, String photo_name, int amount) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.bookconcern = bookconcern;
        this.photo_name = photo_name;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBookconcern() {
        return bookconcern;
    }

    public void setBookconcern(String bookconcern) {
        this.bookconcern = bookconcern;
    }

    public String getPhoto_name() {
        return photo_name;
    }

    public void setPhoto_name(String photo_name) {
        this.photo_name = photo_name;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
