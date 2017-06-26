package rentCar.controller;


import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.server.MockMvc;
import org.springframework.test.web.server.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.server.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.server.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.server.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.server.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.server.result.MockMvcResultMatchers.status;
/**
 * Created by xpb on 2017/4/7.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})

@WebAppConfiguration
public class UserControllerTest {

    @Autowired
    protected WebApplicationContext wac;

    protected MockMvc mockMvc ;

    private String json ="{\"age\":0,\"passWord\":\"123\",\"userName\":\"admin\"}";
    private String jsonString="{'age':0,'passWord':'123','userName':'admin'}";
    private String jsonStringCustomerRegister="{'customerId':'E110','customerTel':'110'," +
            "'customerPassword':'111','recordCreator':'0',,'stuffEmail':'9698@qq.com'}";
    private String jsonStringStuffRegister="{'stuffId':'E110','stuffTel':'110'," +
            "'stuffPassword':'111','recordCreator':'123','stuffEmail':'9698@qq.com'}";
    private String jsonStringLogin="{'staffNumber':'E11111110','password':'123'}";
    private String jsonStringInsertInfo="{'staffNumber':'E110','staffName':'admin'}";
    private String jsonStringQueryInfo="{'staffNumber':'E110'}";
    private String loginUrl="/UserAhu/Login";
    private String registerUrl="/Customer/Register";
    private String stuffRegisterUrl="/Stuff/Register";
    private String insertInfoUrl="/UserInfoAhu/InsertStaffBaseInfo";
    private String queryInfoUrl="/UserInfoAhu/QueryStaffBaseInfo";
    @Before()  //这个方法在每个方法执行之前都会执行一遍
    public void setup()
    {
        mockMvc = MockMvcBuilders.webApplicationContextSetup(wac).build();
    }

    @Test
    public void getAllCategoryTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        post(loginUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(jsonStringLogin.getBytes())

                )
              //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
               .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }

    @Test
    public void registerTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        post(registerUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(jsonStringCustomerRegister.getBytes())

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }

    @Test
    public void insertTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        post(insertInfoUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(jsonStringInsertInfo.getBytes())

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }

    @Test
    public void queryTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        post(queryInfoUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(jsonStringQueryInfo.getBytes())

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }
    @Test
    public void loginTest() throws Exception
    {
        String responseString = mockMvc.perform
                (post("/User/Login1")          //请求的url,请求的方法是get
                                //get("/user/showUser2")          //请求的url,请求的方法是get
                                .contentType(MediaType.APPLICATION_FORM_URLENCODED)//数据的格式
                                .param("userName","admin")   //添加参数(可以添加多个)
                        .param("passWord","123")   //添加参数(可以添加多个)
                )
                .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }





}