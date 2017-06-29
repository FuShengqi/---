package rentCar.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

/**
 * Created by xpb on 2017/6/26.
 */
public class IdFactory {


    /*
  生成每个用户注册时的唯一ID,UUID
  */
    public String getUUID(){
        UUID uuid = UUID.randomUUID();
        String str = uuid.toString();
        // 去掉"-"符号
        String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);
        System.out.println("此次注册的UUID结果为"+str+","+temp);
        return  temp;
    }

    /*
    获取用户注册的时间,即当前时刻系统的时间。
    */
    public String getCurrentTime1(){
        String time="";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间

        Calendar c = Calendar.getInstance();//可以对每个时间域单独修改

        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        int date = c.get(Calendar.DATE);
        int hour = c.get(Calendar.HOUR_OF_DAY);
        int minute = c.get(Calendar.MINUTE);
        int second = c.get(Calendar.SECOND);
        System.out.println(year + "/" + month + "/" + date + " " +hour + ":" +minute + ":" + second);
        return time;
    }

    /*
   获取用户注册的时间,即当前时刻系统的时间。
   */
    public Date getCurrentTime(){
        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
        return currentDate;
    }

    public String toString(){
        String result=null;
        InputStream inputStream = null;
        //inputStream = responseBody.byteStream();
        BufferedReader br = null;
        br=new BufferedReader(new InputStreamReader(inputStream));
        String string =null;
        StringBuilder sb = new StringBuilder();
        String line = null;
        try {
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        string=sb.toString();
        return string;
    }
}
