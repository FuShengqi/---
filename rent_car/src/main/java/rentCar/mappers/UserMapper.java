package rentCar.mappers;

import rentCar.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by xpb on 2017/4/3.
 */
//@MapperScan
//@Repository("userMapper")
@Component("userMapper")
//@Transactional
//@Mapp
public interface UserMapper {
     User getUserByName(String username);
     String queryUserName(String userName);
     String  queryPassWord(String id);
     //void  insertUser(@Param("ID") int id, @Param("USERNAME") String username,@Param("PASSWORD") String password);
     List<User> findAll();
     void  insertUser(@Param("id") String id, @Param("username") String username, @Param("password") String password);
     void  insertUserAuto(@Param("username") String username, @Param("password") String password);

     void deleteUser(String id);
     void updatePassword(@Param("id") String id, @Param("passWord") String passWord);

}
