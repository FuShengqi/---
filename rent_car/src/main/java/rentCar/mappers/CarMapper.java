package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.CarInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/25.
 */
public interface CarMapper {
    String queryIDByCarNo(String carNo);
    CarInfo getCarByNo(String carNo);
    List<CarInfo> findAll();
    String queryCarNoByCarId(String carId);
    /*
    mybatis 查询语句似乎不支持重载
    */
    void  insertCarMap(HashMap infoMap);
    void  insertCar(CarInfo carInfo);
    void deleteCar(String id);
    void updateCarInfo(HashMap infoMap);
    Integer count();

    String queryModelIdByCarId(@Param("id") String id);
}
