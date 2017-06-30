package rentCar.controller;

/**
 * Created by xpb on 2017/6/28.
 */
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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})

@WebAppConfiguration
public class carControllerTest {
    @Autowired
    protected WebApplicationContext wac;

    protected MockMvc mockMvc ;
    private String carAddUrl="/Car/Add";
    private String carListUrl="/Car/List";
    private String carQueryUrl="/Car/Query";
    private String carQueryByCarNoUrl="/Car/QueryByCarNo";
    private String jsonStringCarAdd="{'modelInfoId':'name1','carNo':'皖A1111','carColor':'红','carStoreId':'0'," +
            "'carBuyDate':'2017-5-21','carEngineNo':'222222','carFrameNo':'11111','recordCreator':'0'}";
    private String jsonStringCarAdd1="{'modelInfoId':'name1','carNo':'皖A2222','carColor':'红','carStoreId':'0'," +
            "'carBuyDate':'2017-4-21','carEngineNo':'444444','carFrameNo':'222222','recordCreator':'0'}";
    private String carNo="{'carNo':'皖A1111'}";
    //private String modelInfoId;  name1
    //carNo
    @Before()  //这个方法在每个方法执行之前都会执行一遍
    public void setup()
    {
        mockMvc = MockMvcBuilders.webApplicationContextSetup(wac).build();
    }
    @Test
    public void carAddTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        post(carAddUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(jsonStringCarAdd1.getBytes())

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }
    @Test
    public void carQueryTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        get(carQueryUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                               // .body(null)

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }

    @Test
    public void carQueryByCarNoTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        get(carQueryByCarNoUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                        //.body(carNo.getBytes())
                                .param("carNo","皖A1111")
                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }
}
