package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.CustomerInfo;
import rentCar.entity.OrderInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/25.
 */
public interface OrderMapper {
    OrderInfo getOrderByOrderNo(String orderNo);
    String queryIDByOrderNo(String orderNo);
    List<OrderInfo> findAll();
    void  insertOrderMap(HashMap infoMap);
    void insertRentOrderMap(HashMap infoMap);
    void  insertOrder(OrderInfo orderInfo);
    void deleteOrder(String id);
    void  updateOrderInfo(HashMap infoMap);
    void addBookOrder(HashMap infoMap);
    void updateRentCarOrder(HashMap infoMap);
    void updateReturnDateInActual(HashMap infoMap);

    void updateBackCarOrder(HashMap infoMap);
    void updateViolateOrder(HashMap infoMap);
    void queryCarByOrderNo();
    Integer count();
    Integer bookCount();
    Integer rentingCount();
    Integer backCount();
    Integer violateCount();

    List<OrderInfo> queryOrderInfo(@Param("orderType") String orderType);
    OrderInfo bookOrderInfo();
    OrderInfo rentingOrderInfo();
    OrderInfo backOrderInfo();
    OrderInfo violateOrderInfo();

    String queryCarIdById(@Param("id") String id);
   void  updateFinishOrder(@Param("id") String id,@Param("orderStatus") String orderStatus);
}
