package rentCar.service;


import rentCar.entity.CustomerInfo;
import rentCar.entity.OrderInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/4/3.
 */
public interface OrderService {
    List<OrderInfo> findAll();
    OrderInfo queryOrder(String orderNo);
    int deleteOrder(String userName);
    int updateOrder(HashMap infoMap);
    int addRentOrder(HashMap infoMap);
    int addBookOrder(HashMap infoMap);
    int updateRentCarOrder(HashMap infoMap);
    int updateBackCarOrder(HashMap infoMap);
    int updateViolateOrder(HashMap infoMap);
    ArrayList queryOrderByOrderType(String orderType);
    HashMap customerVerify(String customerTel);
    HashMap beforeBackCar(HashMap infoMap);

    int  finishOrder(String orderNo);
    ArrayList queryRenewal(String orderNo);

}
