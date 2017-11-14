package org.ccw.support;


import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;


public class Support implements Serializable {
    /**
     * 本地时间提供方法
     * @return java.sql.Date(now_sql_date)
     * @throws Exception
     */
    public static Date getDate() throws Exception{
        Calendar calendar = new GregorianCalendar();
        String date_str = calendar.get(Calendar.YEAR)+"-"+
                (calendar.get((Calendar.MONTH))+1)+"-"+
                calendar.get(Calendar.DAY_OF_MONTH);
        java.util.Date temp = new SimpleDateFormat("yyyy-MM-dd").parse(date_str);
        Date  now_sql_date = new Date(temp.getTime());

        return now_sql_date;
    }

}
