package rentCar.service;


import rentCar.entity.CustomerInfo;
import rentCar.entity.CarInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/4/3.
 */
public interface CarService {
    List<CarInfo> findAll();
    ArrayList queryCarSimple();
    HashMap queryCar(String carNo);
    List<CarInfo> queryCar(HashMap infoMap);
    int deleteCar(String carNo);
    int updateCar(HashMap infoMap);
    int addCar(HashMap infoMap);

}
