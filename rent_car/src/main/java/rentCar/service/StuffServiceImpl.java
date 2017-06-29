package rentCar.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.StuffInfo;
import rentCar.mappers.OrderMapper;
import rentCar.mappers.StuffMapper;
import rentCar.util.IdFactory;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service("stuffService")
@Transactional
public class StuffServiceImpl implements StuffService {
    private int result = -1;
    private IdFactory idFactory;
    @Resource
    private StuffMapper stuffMapper;
    @Resource
    OrderMapper orderMapper;
    public List<StuffInfo> findAll() {
        List<StuffInfo> list=stuffMapper.findAll();
        return list;
    }

    public int login(String stuffTel, String stuffPassword) {
        Connection connection = null;
        //1、先判断是否有相应的用户名
        String id = stuffMapper.queryIDByStuffTel(stuffTel);
        if (id == null) {
            result=0;  //用户不存在
            return result;
        }else{
            // result=1;
        }
        //2、再判断密码是否正确
        String  passWordTrue =stuffMapper.queryPassWordById(id);
        if (!passWordTrue.equals(stuffPassword)) {
            result=2;          //密码错误
            return result;
        }else{
            result=1;
        }
       /* //3、设置相应的token
        long currentTime  = System.currentTimeMillis();
        String token = userId+"_"+currentTime;

        int updateResult = userDao.updateToken(userId, token);
        if (updateResult == 0) {
            result=2;

        } else {
            //result.setCode(0);
            //result.setToken(token);
        }
*/
        return result;
    }

    @Override
    public int register(HashMap infoMap) {
        System.out.println("注册之前!");
        String stuffTel=(String)infoMap.get("stuffTel");
        String id=stuffMapper.queryIDByStuffTel(stuffTel);
        System.out.println("注册之前222!");
        if (!(id == null)) {
            result=0;  //用户已存在
            System.out.println("用户已存在!");
            return result;
        }else{
            String  ID=getUUID();
            System.out.println("用户未存在，开始注册!");
            infoMap.put("id",ID);
            infoMap.put("stuffNo",getStuffNo());
            infoMap.put("recordCreateTime",getCurrentTime());
            stuffMapper.insertStuffMap(infoMap);

            //userMapper.insertUserAuto(userName,passWord);  //错误
            System.out.println("注册成功!");
            result=1;
        }
        return result;
    }

    @Override
    public int register(StuffInfo stuffInfo) {
        System.out.println("注册之前!");
        String stuffTel=stuffInfo.getStuffTel();
        String id=stuffMapper.queryIDByStuffTel(stuffTel);
        System.out.println("注册之前222!");
        if (!(id == null)) {
            result=0;  //用户已存在
            System.out.println("用户已存在!");
            return result;
        }else{
            String  ID=getUUID();
            stuffInfo.setId(ID);
            stuffInfo.setStuffNo(getStuffNo());
            stuffInfo.setRecordCreateTime(getCurrentTime());
            System.out.println("当前时间："+getCurrentTime());
            System.out.println("用户未存在，开始注册!");
            stuffMapper.insertStuff(stuffInfo);
            //userMapper.insertUserAuto(userName,passWord);  //错误
            System.out.println("注册成功!");
            result=1;
        }
        return result;
    }
/*
* bookCount,rentingCount,backCount,violateCount
* */
    @Override
    public HashMap setFourCount() {
        HashMap<String, Object> map = new HashMap<>();
        int  bookCount= orderMapper.bookCount();
        map.put("bookCount", bookCount);
        int  rentingCount= orderMapper.rentingCount();
        map.put("rentingCount", rentingCount);
        int  backCount=orderMapper.backCount();
        map.put("backCount",backCount);
        int  violateCount= orderMapper.violateCount();
        map.put("violateCount",violateCount);
        return map;
    }

    @Override
    public int  deleteUser(String stuffTel) {
            System.out.println("删除之前!");
            String id=stuffMapper.queryIDByStuffTel(stuffTel);
            System.out.println("删除之前222!");
            if ((id == null)) {
                result=0;  //用户不存在
                System.out.println("用户名不存在!");
                return result;
            }else{
                System.out.println("用户名存在，开始删除!");
                stuffMapper.deleteUser(id);
                System.out.println("删除成功!");
                result=1;
            }

            return result;

    }

    @Override
    public int updatePassword(String stuffTel,String password) {
        System.out.println("更改之前!");
        String id=stuffMapper.queryIDByStuffTel(stuffTel);
        System.out.println("更改之前222!");
        if ((id == null)) {
            result=0;  //用户不存在
            System.out.println("用户名不存在!");
            return result;
        }else{
            System.out.println("用户名存在，开始更改!");
            stuffMapper.updatePassword(id,password);
            //userMapper.insertUserAuto(userName,passWord);  //错误
            System.out.println("更改成功!");
            result=1;
        }
        return result;
    }

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
   生成每个用户注册时的唯一编号
       客户编号=注册顺序码(6位，例：000001)
   */

    public String getStuffNo(){
        String stuffNo="";
        stuffNo=stuffMapper.count().toString();
        return  stuffNo;
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
}
