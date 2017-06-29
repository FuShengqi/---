package rentCar.service;


import rentCar.entity.CustomerInfo;
import rentCar.entity.ViolateInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/4/3.
 */
public interface ViolateService {
    ArrayList findAll();
    ViolateInfo queryViolate(String violateNo);
    int deleteViolate(String violateNo);
    int updateViolate(HashMap infoMap);
    int addViolate(HashMap infoMap);
}
