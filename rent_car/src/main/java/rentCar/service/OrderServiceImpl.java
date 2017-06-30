package rentCar.service;


import com.alibaba.fastjson.JSON;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.*;
import rentCar.mappers.*;
import rentCar.util.IdFactory;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
    private int result = -1;
    private IdFactory idFactory =new IdFactory();
    @Resource
    private StuffMapper stuffMapper;
    @Resource
    private OrderMapper orderMapper;
    @Resource
    private ViolateMapper violateMapper;
    @Resource
    CarMapper carMapper;
    @Resource
    CustomerMapper customerMapper;
    @Resource
    LicenseMapper licenseMapper;
     @Resource
     RentPriceMapper rentPriceMapper;
     @Resource
     RenewalOrderMapper renewalOrderMapper;

    @Override
    public List<OrderInfo> findAll() {
        return null;
    }

    @Override
    public OrderInfo queryOrder(String orderNo) {
        OrderInfo orderInfo =orderMapper.getOrderByOrderNo(orderNo);
        return  orderInfo;
    }
    @Override
    public ArrayList queryRenewal(String orderNo) {
        String orderId=orderMapper.queryIDByOrderNo(orderNo);
        List<RenewalOrderInfo> renewalOrderInfoList =renewalOrderMapper.getRenewalOrderByOrderId(orderId);
        ArrayList mapList =new ArrayList();
        for(int i=0;i<renewalOrderInfoList.size();i++){
            System.out.println("开始查询订单");
            String jsonString = JSON.toJSONString(renewalOrderInfoList.get(i));
            HashMap map = (HashMap)JSON.parseObject(jsonString,Map.class);

            mapList.add(i,map);
        }
        return mapList;

    }
    @Override
    public int deleteOrder(String userName) {
        return 0;
    }

    @Override
    public int updateOrder(HashMap infoMap) {
        return 0;
    }

    /**
     * 预定订单处理,需要顾客customerId,orderStartDate,returnDateInPlan
     * 返回订单号
     */

    @Override
    public int addBookOrder(HashMap infoMap) {
        System.out.println("开始预定订单："+result);
        // result=1; 记录者应该是当前登录的用户，但这里有些问题。
        String  ID=idFactory.getUUID();
        infoMap.put("id",ID);

        String orderNo= getOrderNo();
        infoMap.put("orderNo",orderNo);

        String recordCreator=(String)infoMap.get("recordCreator");
        recordCreator="0";
        recordCreator = stuffMapper.queryIDByStuffNo(recordCreator);
        infoMap.put("recordCreator",recordCreator);

        //String customerId=(String)infoMap.get("customerId");
        //customerId = customerMapper.queryIDByCustomerNo(customerId);
        String customerTel=(String)infoMap.get("customerTel");
        customerTel=customerMapper.queryIDByCustomerTel(customerTel);
        infoMap.put("customerId",customerTel);
        infoMap.put("orderStatus",1);
        infoMap.put("recordCreateTime",idFactory.getCurrentTime());
        orderMapper.insertOrderMap(infoMap);
        result=1;
        return result;
    }

    @Override
    public int addRentOrder(HashMap infoMap) {
        System.out.println("开始预定订单："+result);
        // result=1; 记录者应该是当前登录的用户，但这里有些问题。
        String  ID=idFactory.getUUID();
        infoMap.put("id",ID);

        String orderNo= getOrderNo();
        infoMap.put("orderNo",orderNo);

        String  carId=(String)infoMap.get("carNo");
        carId =carMapper.queryIDByCarNo(carId);
        infoMap.put("carId",carId);

        /*String  customerTel=(String)infoMap.get("customerTel");
         String customerId=customerMapper.queryIDByCustomerTel(customerTel)
        infoMap.put("customerId",customerId);  */
        String recordCreator=(String)infoMap.get("recordCreator");
        recordCreator="0";
        recordCreator = stuffMapper.queryIDByStuffNo(recordCreator);
        infoMap.put("recordCreator",recordCreator);

        //String customerId=(String)infoMap.get("customerId");
        //customerId = customerMapper.queryIDByCustomerNo(customerId);
        String customerTel=(String)infoMap.get("customerTel");
        customerTel=customerMapper.queryIDByCustomerTel(customerTel);
        infoMap.put("customerId",customerTel);
        infoMap.put("orderStatus",2);
        infoMap.put("recordCreateTime",idFactory.getCurrentTime());
        orderMapper.insertOrderMap(infoMap);
        result=1;
        return result;
    }
    /*
    根据订单号，
    * 出车订单处理，orderStartMiles,carId,licenseId,rentDeposit,damageDeposit,violateDeposit
    *先判断驾驶证是否在数据库不在则添加。
    * */
    @Override
    public int updateRentCarOrder(HashMap infoMap) {

        System.out.println("开始出车订单：");
        String  carId=(String)infoMap.get("carId");
        carId =carMapper.queryIDByCarNo(carId);
        infoMap.put("carId",carId);
        infoMap.put("orderStatus",2);

        String  licenseId=(String)infoMap.get("licenseId");
        if (licenseId==null){
            // to-do 驾驶证未存在，插入驾驶证信息
        }else{
            licenseId=licenseMapper.queryIDByLicenseNo(licenseId);
            infoMap.put("licenseId",licenseId);
        }
        orderMapper.updateRentCarOrder(infoMap);
        System.out.println("改变出车订单状态：");
        result = 1;
        return result;
    }
    /*
    * 根据车牌号查车型，根据车型查价格
    * */
    @Override
    public HashMap beforeBackCar(HashMap infoMap) {
        System.out.println("开始付款：");
        String  orderNo=(String)infoMap.get("orderNo");
        OrderInfo orderInfo=orderMapper.getOrderByOrderNo(orderNo);
        System.out.println("开始付款orderInfo："+orderInfo);
        String id = orderMapper.queryIDByOrderNo(orderNo);
        System.out.println("付款订单Id："+id);
        String  carId=orderMapper.queryCarIdById(id);
         id =carId;
        System.out.println("汽车Id："+id);
        String  modelInfoId=carMapper.queryModelIdByCarId(id);
        System.out.println("modelInfoId："+modelInfoId);
        RentPriceInfo rentPriceInfo=rentPriceMapper.getRentPriceMapByModelInfoId(modelInfoId);
        System.out.println("用车价格对象："+rentPriceInfo);
        HashMap<String, Object> map = new HashMap<String, Object>();
        Date startDate =orderInfo.getOrderStartDate();
        Date endDate=orderInfo.getReturnDateInActual();
        System.out.println("startDate："+startDate+"endDate："+endDate);
        long  day=(endDate.getTime()-startDate.getTime())/(24*60*60*1000);
        System.out.println("用车天数："+day);
        System.out.println("用车价格："+rentPriceInfo.getPricePerDay());
        float basicConsume=rentPriceInfo.getPricePerDay()*day;
        System.out.println("basicConsume："+basicConsume);
        map.put("basicConsume",basicConsume);
        map.put("timeoutConsume",0);
        map.put("kmoutConsume",0);
        map.put("rentDeposit",0);
        map.put("orderNo",orderNo);
        return map;
    }
    /*
    * 还车订单处理,returnDateInActual,orderEndMiles,basicConsume
    * timeoutConsume,  kmoutConsume , discountAmount,damageDeductions
    * */
    @Override
    public int updateBackCarOrder(HashMap infoMap) {
        System.out.println("开始还车：");
        String  orderNo=(String)infoMap.get("orderNo");
        String id = orderMapper.queryIDByOrderNo(orderNo);
        System.out.println("还车订单Id："+id);
        infoMap.put("id",id);
        infoMap.put("orderStatus",3);
        orderMapper.updateBackCarOrder(infoMap);
        result = 1;
        return result;
    }

    /*
    根据订单里的车牌号，和使用时间，查询违章时间，
    违章订单未处理。
    illegalDeductions,totalDonsume。

    应该先有个查询违章，再违章处理。
    * */
    @Override
    public int updateViolateOrder(HashMap infoMap) {
        infoMap.put("orderStatus",4);
        String carId=(String)infoMap.get("carId");
        String orderNo=(String)infoMap.get("orderNo");
        OrderInfo orderInfo =orderMapper.getOrderByOrderNo(orderNo);
        carId=orderInfo.getCarId();
        Date orderStartDate=orderInfo.getOrderStartDate();
        Date returnDateInActual=orderInfo.getReturnDateInActual();
        ViolateInfo violateInfo=violateMapper.queryViolateByCarNoAndTime(carId, orderStartDate, returnDateInActual);
        if ((violateInfo == null)) {
            result=0;  //用户不存在
            System.out.println("违章记录不存在!");
            return result;
        }else{
            System.out.println("违章记录存在，开始处理!");
            orderMapper.updateViolateOrder(infoMap);
            //violateMapper.deleteViolate(id);
            System.out.println("删除成功!");
            result=1;
        }
        return result;
    }

    @Override
    public ArrayList queryOrderByOrderType(String orderType) {
        List<OrderInfo> orderInfoList =orderMapper.queryOrderInfo(orderType);
        ArrayList mapList =new ArrayList();

        for(int i=0;i< orderInfoList.size();i++){
            //HashMap<String, Object> map = new HashMap<String, Object>();
            System.out.println("开始查询订单");
            String carId=  orderInfoList.get(i).getCarId();
            String carNo=carMapper.queryCarNoByCarId(carId);
            System.out.println("carNo:"+carNo);
            String customerId=  orderInfoList.get(i).getCustomerId();
            String customerName=customerMapper.queryCustomerNameById(customerId);
            System.out.println("customerName"+customerName);
            String customerTel=customerMapper.queryCustomerTelById(customerId);
            System.out.println("customerName"+customerName);
            String jsonString = JSON.toJSONString(orderInfoList.get(i));
            HashMap map = (HashMap)JSON.parseObject(jsonString,Map.class);
           // Date orderStartDate=  new Date((long)orderInfoList.get(i).getOrderStartDate()*1000);
            System.out.println("开始查询订单OrderStartDate"+orderInfoList.get(i).getOrderStartDate());
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd");
            String dataString=simpleDateFormat.format(orderInfoList.get(i).getOrderStartDate());
            map.put("orderStartDate",dataString);
            String dataString1="";
            if(orderInfoList.get(i).getReturnDateInActual()!=null){
                 dataString1=simpleDateFormat.format(orderInfoList.get(i).getReturnDateInActual());
            }

            map.put("returnDateInActual",dataString1);
            System.out.println("开始查询订单Date"+dataString1);
            map.put("carNo",carNo);
            map.put("customerTel",customerTel);
            map.put("customerName",customerName);
            mapList.add(i,map);
        }
       return mapList;
    }

    @Override
    public int  finishOrder(String orderNo) {
        String  orderId =orderMapper.queryIDByOrderNo(orderNo);
        orderMapper.updateFinishOrder(orderId,"5");
        return result=1;
    }



    @Override
    public HashMap customerVerify(String customerTel) {
        String id = customerMapper.queryIDByCustomerTel(customerTel);
        String customerName=customerMapper.queryCustomerNameById(id);
        HashMap hashMap =new HashMap();
        if(id==null){
            result =0;
        }else{
            result =1;
        }
        hashMap.put("RESULT_KEY", result);
        hashMap.put("customerName", customerName);
        return hashMap;
    }



    /*
    * 订单号=门店编号(6位)+客户编号(6位)+顺序码(4位)
    * */
    public String getOrderNo(){
         String orderNo  ;
         String storeNo="000000";
         String customerNo="000000";
         orderNo=storeNo+customerNo+orderMapper.count();
        return orderNo;
    }


}
