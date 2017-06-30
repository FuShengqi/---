package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.CustomerInfo;
import rentCar.entity.RentPriceInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/25.
 */
public interface RentPriceMapper {
    RentPriceInfo getRentPriceMapByModelInfoId(String modelInfoId);
    String queryIDByModelInfoId(String modelInfoId);
    List<RentPriceInfo> findAll();
    void  insertRentPriceMap(HashMap infoMap);
    void  insertRentPrice(RentPriceInfo customerInfo);
    void deleteRentPrice(String id);
    void  updateRentPriceInfo(HashMap infoMap);
    Integer count();
}
