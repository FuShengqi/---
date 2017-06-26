package rentCar.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.CustomerInfo;
import rentCar.mappers.CustomerMapper;
import rentCar.mappers.StuffMapper;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {
    private int result = -1;
@Resource
private CustomerMapper customerMapper;
    @Resource
    private StuffMapper stuffMapper;
    public List<CustomerInfo> findAll() {
        List<CustomerInfo> list=customerMapper.findAll();
        return list;
    }

    public int login(String customerTel, String customerPassword) {
        Connection connection = null;


        //1、先判断是否有相应的用户名
        String id = customerMapper.queryIDByCustomerTel(customerTel);
        if (id == null) {
            result=0;  //用户不存在
            return result;
        }else{
            // result=1;
        }


        //2、再判断密码是否正确
        String  passWordTrue =customerMapper.queryPassWordById(id);
        if (!passWordTrue.equals(customerPassword)) {
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
        String customerTel=(String)infoMap.get("customerTel");
        String recordCreator=(String)infoMap.get("recordCreator");
        String id=customerMapper.queryIDByCustomerTel(customerTel);
        System.out.println("注册之前222!");
        if (!(id == null)) {
            result=0;  //用户已存在
            System.out.println("用户已存在!");
            return result;
        }else{
            String  ID=getUUID();
            System.out.println("用户未存在，开始注册!");
            recordCreator = stuffMapper.queryIDByStuffNo(recordCreator);
            infoMap.put("id",ID);
            infoMap.put("stuffNo",getCustomerNo());
            infoMap.put("recordCreateTime",getCurrentTime());
            infoMap.put("recordCreator",recordCreator);
            customerMapper.insertCustomerMap(infoMap);
            //userMapper.insertUserAuto(userName,passWord);  //错误
            System.out.println("注册成功!");
            result=1;
        }
        return result;
    }

    @Override
    public int register(CustomerInfo customerInfo) {
        System.out.println("注册之前!");
        String customerTel=customerInfo.getCustomerTel();
        String id=customerMapper.queryIDByCustomerTel(customerTel);
        System.out.println("注册之前222!");
        if (!(id == null)) {
            result=0;  //用户已存在
            System.out.println("用户已存在!");
            return result;
        }else{
            String  ID=getUUID();
            customerInfo.setId(ID);
            customerInfo.setCustomerNo(getCustomerNo());
            customerInfo.setRecordCreateTime(getCurrentTime());
            System.out.println("当前时间："+getCurrentTime());
            System.out.println("用户未存在，开始注册!");
            customerMapper.insertCustomer(customerInfo);
            //userMapper.insertUserAuto(userName,passWord);  //错误
            System.out.println("注册成功!");
            result=1;
        }
        return result;
    }

    @Override
    public int  deleteUser(String customerTel) {
            System.out.println("删除之前!");
            String id=customerMapper.queryIDByCustomerTel(customerTel);
            System.out.println("删除之前222!");
            if ((id == null)) {
                result=0;  //用户不存在
                System.out.println("用户名不存在!");
                return result;
            }else{
                System.out.println("用户名存在，开始删除!");
                customerMapper.deleteUser(id);
                System.out.println("删除成功!");
                result=1;
            }

            return result;

    }

    @Override
    public int updatePassword(String customerTel,String password) {
        System.out.println("更改之前!");
        String id=customerMapper.queryIDByCustomerTel(customerTel);
        System.out.println("更改之前222!");
        if ((id == null)) {
            result=0;  //用户不存在
            System.out.println("用户名不存在!");
            return result;
        }else{
            System.out.println("用户名存在，开始更改!");
            customerMapper.updatePassword(id,password);
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

    public String getCustomerNo(){
        String customerNo="";
        customerNo=customerMapper.count().toString();
        return  customerNo;
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
