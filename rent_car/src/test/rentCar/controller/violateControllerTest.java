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
public class violateControllerTest {
    @Autowired
    protected WebApplicationContext wac;

    protected MockMvc mockMvc ;
    private String violateAddUrl="/Violate/Add";
    private String violateListUrl="/Violate/List";
    private String violateQueryUrl="/Violate/Query";
    private String jsonStringViolateAdd="{'carId':'皖A1111','violateStatus':'1'," +
            "'violateDate':'2017-5-21','violateEvent':'闯红灯','violateFee':'500','recordCreator':'0'}";

    private String jsonStringViolateAdd1="{'carId':'皖A1111','violateStatus':'1'," +
            "'violateDate':'2017-4-30','violateEvent':'闯红灯','violateFee':'500','recordCreator':'0'}";

    @Before()  //这个方法在每个方法执行之前都会执行一遍
    public void setup()
    {
        mockMvc = MockMvcBuilders.webApplicationContextSetup(wac).build();
    }
    @Test
    public void violateAddTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        post(violateAddUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(jsonStringViolateAdd1.getBytes())

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }

    @Test
    public void violateQueryTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        post(violateQueryUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(null)

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }
}
