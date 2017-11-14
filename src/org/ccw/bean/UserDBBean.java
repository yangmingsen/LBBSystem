package org.ccw.bean;

import java.io.Serializable;

public class UserDBBean implements Serializable {
    private int id;
    private String acct;
    private String pasd;
    private String real_name;
    private String nick_name;

    public UserDBBean() {
    }
    public UserDBBean(int id, String acct, String pasd, String real_name, String nick_name) {
        this.id = id;
        this.acct = acct;
        this.pasd = pasd;
        this.real_name = real_name;
        this.nick_name = nick_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAcct() {
        return acct;
    }

    public void setAcct(String acct) {
        this.acct = acct;
    }

    public String getPasd() {
        return pasd;
    }

    public void setPasd(String pasd) {
        this.pasd = pasd;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }

    public String getNick_name() {
        return nick_name;
    }

    public void setNick_name(String nick_name) {
        this.nick_name = nick_name;
    }
}
