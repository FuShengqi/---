package rentCar.service;


import rentCar.entity.RentPriceInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/27.
 */
public interface RentPriceService {
    List<RentPriceInfo> findAll();
    RentPriceInfo queryRentPrice(String violateNo);
    int deleteRentPrice(String userName);
    int updateRentPrice(HashMap infoMap);
    int addRentPrice(HashMap infoMap);
}
