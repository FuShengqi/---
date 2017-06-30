package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.StuffInfo;
import rentCar.entity.StoreInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/26.
 */
public interface StoreMapper {
    StoreInfo getStoreByNo(String storeNo);
    String queryIDByStoreNo(String storeNo);
    List<StoreInfo> findAll();
    void  insertStoreMap(HashMap infoMap);
    void  insertStore(StoreInfo storeInfo);
    void deleteStore(String id);
    void  updateStoreInfo(HashMap infoMap);
    Integer count();
}
