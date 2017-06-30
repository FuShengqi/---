package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.CustomerInfo;
import rentCar.entity.RenewalOrderInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/25.
 */
public interface RenewalOrderMapper {
    List<RenewalOrderInfo> getRenewalOrderByOrderId(String orderId);
    String queryIDByRenewalOrderId(String orderId);
    List<RenewalOrderInfo> findAll();
    void  insertRenewalOrderMap(HashMap infoMap);
    void  insertRenewalOrder(RenewalOrderInfo renewalOrderInfo);
    void deleteRenewalOrder(String id);
    void  updateRenewalOrderInfo(HashMap infoMap);
    Integer count();
}
