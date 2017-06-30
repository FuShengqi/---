package rentCar.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import rentCar.service.LicenseService;
import rentCar.service.RenewalOrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by xpb on 2017/6/26.
 */
@Controller
@RequestMapping("/RenewalOrder")
public class RenewalOrderController {
    private int result =0;
    @Resource
    RenewalOrderService renewalOrderService;

    /*
 添加续租订单实现，获取添加续租订单输入流，进行处理，返回添加续租订单结果。
 再生成一个该续租订单的uuid，然后插入数据库
 */
    @RequestMapping(value = "/Add",method= RequestMethod.POST)
    public void addRenewalOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求renewalOrderService为" +renewalOrderService);
        BufferedReader br = req.getReader();

        String str, jsonString = "";
        while((str = br.readLine()) != null){
            jsonString += str;
            System.out.println("str为" + str);
        }
        System.out.println(jsonString);
        System.out.println("请求为" + jsonString);
        JSONObject jsonObject= JSONObject.parseObject(jsonString);
        String licenseNo = (String)jsonObject.get("licenseNo");
        HashMap mapType = (HashMap) JSON.parseObject(jsonString,Map.class);
        result = renewalOrderService.addRenewalOrder(mapType);
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
        /*
        * 不做单一续租订单查询，只做在主订单中的查询
        * */
   /* @RequestMapping(value = "/Query",method= RequestMethod.GET)
    public ModelAndView queryRenewalOrderInfoListSimple() throws Exception {
        System.out.println("开始查询可用车辆");
        ArrayList renewalOrderInfoList= renewalOrderService.queryRenewalOrder();
        Map<String, Object> map = new HashMap<>();
        ModelAndView mav =new ModelAndView();
        mav.setViewName("ava_car"); // index之后不需要加.jsp
        //mav.addAllObjects(map);
        mav.addObject("list",renewalOrderInfoList);
        return  mav;
    }*/

}
