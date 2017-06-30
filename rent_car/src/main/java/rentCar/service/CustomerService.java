package rentCar.service;


import rentCar.entity.CustomerInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/4/3.
 */
public interface CustomerService {
    List<CustomerInfo> findAll();
    int deleteUser(String userName);
    int updatePassword(String userName, String password);
    int login(String userName, String passWord);
    int register(HashMap infoMap);
    int register(CustomerInfo customerInfo);
}
