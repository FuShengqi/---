package rentCar.service;


import rentCar.entity.StuffInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/26.
 */
public interface StuffService {
    List<StuffInfo> findAll();
    int deleteUser(String userName);
    int updatePassword(String userName, String password);
    int login(String userName, String passWord);
    int register(HashMap infoMap);
    int register(StuffInfo stuffInfo);
}
