package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.CustomerInfo;
import rentCar.entity.User;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/25.
 */
public interface CustomerMapper {
    CustomerInfo getUserByNo(String  customerNo);
    String queryIDByCustomerNo(String  customerNo);
    String queryIDByCustomerTel(String customerTel);
    String queryCustomerNameById(String id);
    String queryCustomerTelById(String id);
    String  queryPassWordById(String id);
    //void  insertUser(@Param("ID") int id, @Param("USERNAME") String username,@Param("PASSWORD") String password);
    List<CustomerInfo> findAll();
    /*
    mybatis 查询语句似乎不支持重载
    */
    void  insertCustomerMap(HashMap infoMap);
    void  insertCustomer(CustomerInfo customerInfo);
    void deleteUser(String id);
    void updatePassword(@Param("id") String id, @Param("passWord") String passWord);

    Integer count();
}
