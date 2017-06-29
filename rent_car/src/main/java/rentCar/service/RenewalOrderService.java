package rentCar.service;


import rentCar.entity.RenewalOrderInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/26.
 */
public interface RenewalOrderService {
    List<RenewalOrderInfo> findAll();
    List<RenewalOrderInfo> queryRenewalOrder(String orderNo);
    int deleteRenewalOrder(String userName);
    int updateRenewalOrder(HashMap infoMap);
    int addRenewalOrder(HashMap infoMap);

}
