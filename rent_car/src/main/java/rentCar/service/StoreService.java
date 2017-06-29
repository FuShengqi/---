package rentCar.service;


import rentCar.entity.CustomerInfo;
import rentCar.entity.StoreInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/4/3.
 */
public interface StoreService {
    List<StoreInfo> findAll();
    StoreInfo queryStore(String storeNo);
    int deleteStore(String storeNo);
    int updateStore(HashMap infoMap);
    int addStore(HashMap infoMap);

}
