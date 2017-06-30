package rentCar.entity;

import org.springframework.stereotype.Component;

/**
 * Created by xpb on 2017/4/3.
 */
@Component("user")
public class User {
    //private Integer userId;   //用户id
    private String userId;   //用户id
    private String userName;    //用户名
    private String userPassword;   //用户登录密码

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    private int age;           //用户年龄

    /*public Integer getUserId() {
        return userId;
    }*/
    public String getUserName() {
        return userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public int getAge() {
        return age;
    }

    /*public void setUserId(Integer userId) {
        this.userId = userId;
    }*/

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", age=" + age +
                '}';
    }
}
