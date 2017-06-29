package rentCar.controller;

/**
 * Created by xpb on 2017/6/28.
 */

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.server.MockMvc;
import org.springframework.test.web.server.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.server.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.server.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.server.result.MockMvcResultHandlers.print;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})

@WebAppConfiguration
public class RenewalOrderControllerTest {
    @Autowired
    protected WebApplicationContext wac;

    protected MockMvc mockMvc ;
    private String renewalOrderAddUrl="/RenewalOrder/Add";
    private String renewalOrderListUrl="/RenewalOrder/List";
    private String renewalOrderQueryUrl="/RenewalOrder/Query";
    private String jsonStringRenewalOrderAdd="{'orderId':'xxxx','renewalStartDate':'2017-6-5','renewalEndDate':'2017-6-8'," +
            "'renewalDeposit':'300','renewalStatus':'1','recordCreator':'0'}";
    private String jsonStringRenewalOrderAdd1="{'orderId':'xxxx','renewalStartDate':'2017-6-5','renewalEndDate':'2017-6-8'," +
            "'renewalDeposit':'300','renewalStatus':'1','recordCreator':'0'}";

    //private String modelInfoId;  name1
    //carNo
    @Before()  //这个方法在每个方法执行之前都会执行一遍
    public void setup()
    {
        mockMvc = MockMvcBuilders.webApplicationContextSetup(wac).build();
    }
    @Test
    public void renewalOrderAddTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        post(renewalOrderAddUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(jsonStringRenewalOrderAdd.getBytes())

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }
    @Test
    public void renewalOrderQueryTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        get(renewalOrderQueryUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                               // .body(null)

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }
}
