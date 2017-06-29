package rentCar.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import rentCar.service.LicenseService;
import rentCar.service.RentPriceService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by xpb on 2017/6/26.
 */
@Controller
@RequestMapping("/RentPrice")
public class RentPriceController {
    private int result =0;
    @Resource
    RentPriceService  rentPriceService;

    /*
 添加租赁价格实现，获取添加租赁价格输入流，进行处理，返回添加租赁价格结果。
 再生成一个该租赁价格的uuid，然后插入数据库
 */
    @RequestMapping(value = "/Add",method= RequestMethod.POST)
    public void addLicense(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求rentPriceService为" +rentPriceService);
        BufferedReader br = req.getReader();

        String str, jsonString = "";
        while((str = br.readLine()) != null){
            jsonString += str;
            System.out.println("str为" + str);
        }
        System.out.println(jsonString);
        System.out.println("请求为" + jsonString);
        JSONObject jsonObject= JSONObject.parseObject(jsonString);
        HashMap mapType = (HashMap) JSON.parseObject(jsonString,Map.class);
        result = rentPriceService.addRentPrice(mapType);
        System.out.println("结果为" + result);
        Map<String, Object> map = new HashMap<>();
        map.put("RESULT_KEY", result);


        resp.addHeader("Content-Type","application/json; charset=utf-8");
        resp.addHeader("Accept-Encoding","gzip");
        resp.setContentType("text/plain;charset=utf-8" );
        resp.setCharacterEncoding("UTF-8");

        String result = JSON.toJSONString(map);
        System.out.println("结果为" + result);
        PrintWriter printWriter = resp.getWriter();
        printWriter.write(result);
        printWriter.close();

    }
}
