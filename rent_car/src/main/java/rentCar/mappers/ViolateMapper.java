package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.ViolateInfo;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/25.
 */
public interface ViolateMapper {
    ViolateInfo getViolateByNo(String violateNo);
    String queryIDByViolateNo(String violateNo);
    List<ViolateInfo> findAll();
    void  insertViolateMap(HashMap infoMap);
    void  insertViolate(ViolateInfo violateInfo);
    void deleteViolate(String id);
    void  updateViolateInfo(HashMap infoMap);
    ViolateInfo queryViolateByCarNoAndTime(@Param("carId") String carId,
                                           @Param("orderStartDate") Date orderStartDate,
                                           @Param("returnDateInActual") Date returnDateInActual);
    Integer count();
}
