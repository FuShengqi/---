package rentCar.controller;

/**
 * Created by xpb on 2017/6/29.
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
public class LicenseControllerTest {
    @Autowired
    protected WebApplicationContext wac;

    protected MockMvc mockMvc ;
    private String licenseAddUrl="/License/Add";
    private String licenseListUrl="/License/List";
    private String licenseQueryUrl="/License/Query";
    private String jsonStringLicenseAdd="{'licenseNo':'123456789','licenceType':'C1','licenceAges':'5'," +
            "'licenceStartDate':'2014-5-21','licenceInvalidDate':'2054-5-21','licenceStatus':'1','recordCreator':'0'}";
    private String jsonStringLicenseAdd1="{'licenseNo':'123456789','licenceType':'C1','licenceAges':'5'," +
            "'licenceStartDate':'2014-5-21','licenceInvalidDate':'2054-5-21','licenceStatus':'1','recordCreator':'0'}";
    //private String modelInfoId;  name1
    //carNo
    @Before()  //这个方法在每个方法执行之前都会执行一遍
    public void setup()
    {
        mockMvc = MockMvcBuilders.webApplicationContextSetup(wac).build();
    }
    @Test
    public void licenseAddTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        post(licenseAddUrl, "json").characterEncoding("UTF-8")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(jsonStringLicenseAdd.getBytes())

                )
                //  .andExpect(status().isOk())    //返回的状态是200
                .andDo(print())       //打印出请求和相应的内容
                //.andReturn();
                .andReturn().getResponse().getContentAsString();   //将相应的数据转换为字符串
        //System.out.println("-----返回的json = " + responseString);
    }
    @Test
    public void licenseQueryTest() throws Exception
    {
        String responseString = mockMvc.perform
                (
                        get(licenseQueryUrl, "json").characterEncoding("UTF-8")
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
