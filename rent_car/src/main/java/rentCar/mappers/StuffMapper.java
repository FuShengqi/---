package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.StuffInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/26.
 */
public interface StuffMapper {
    StuffInfo getUserByNo(String  stuffNo);
    String queryIDByStuffNo(String  stuffNo);
    String queryIDByStuffTel(String stuffTel);
    String  queryPassWordById(String id);
    String queryIDByStuffName(String stuffName);
    //void  insertUser(@Param("ID") int id, @Param("USERNAME") String username,@Param("PASSWORD") String password);
    List<StuffInfo> findAll();
    /*
    mybatis 查询语句似乎不支持重载
    */
    void  insertStuffMap(HashMap infoMap);
    void  insertStuff(@Param("stuffInfo") StuffInfo stuffInfo);
    void deleteUser(String id);
    void updatePassword(@Param("id") String id, @Param("passWord") String passWord);

    Integer count();
}
