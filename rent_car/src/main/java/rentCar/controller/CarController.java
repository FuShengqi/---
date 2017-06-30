package rentCar.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import rentCar.entity.CarInfo;
import rentCar.entity.CustomerInfo;
import rentCar.entity.StuffInfo;
import rentCar.service.CarService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xpb on 2017/6/26.
 */
@Controller
@RequestMapping("/Car")
public class CarController {
    private int result =0;

    @Resource
    CarService carService;

    @RequestMapping("/List")
    public String list(){
        List<CarInfo> list=carService.findAll();
        System.out.println(String.valueOf(list));
        return String.valueOf(list);
    }
    @RequestMapping(value = "/Query",method= RequestMethod.GET)
    public ModelAndView queryCarSimple() throws Exception {
        System.out.println("开始查询可用车辆");
        ArrayList carInfoList= carService.queryCarSimple();
        Map<String, Object> map = new HashMap<>();
        ModelAndView mav =new ModelAndView();
        mav.setViewName("ava_car"); // index之后不需要加.jsp
        //mav.addAllObjects(map);
        mav.addObject("list",carInfoList);
        return  mav;
    }

    @RequestMapping(value = "/QueryByCarNo",method= RequestMethod.GET)
    public ModelAndView queryCarByCarNo(HttpServletRequest req) throws Exception {
        String carNo=req.getParameter("carNo");
        System.out.println("开始查询可用车辆");
        HashMap map= carService.queryCar(carNo);
        ModelAndView mav =new ModelAndView();
        mav.setViewName("car_information"); // index之后不需要加.jsp
        //mav.addAllObjects(map);
        mav.addObject("carInfo",map);
        return  mav;
    }
    /*
  添加车辆实现，获取添加车辆输入流，进行处理，返回添加车辆结果。
  输入的modelInfoId实际为车型名称,car_store_id实际为店编号。
  先查询一个model_info_id，然后更改modelInfoId为该车型的uuid，
  先查询一个car_store_id然后更改car_store_id为该车型的uuid，
  再生成一个该车辆的uuid，然后插入数据库
  */
    @RequestMapping(value = "/Add",method= RequestMethod.POST)
    public void addCar(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求carService为" +carService);
        BufferedReader br = req.getReader();
        System.out.println("获取注册请求流："+br);

        String str, jsonString = "";
        while((str = br.readLine()) != null){
            jsonString += str;
            System.out.println("str为" + str);
        }
        System.out.println(jsonString);
        System.out.println("注册请求为" + jsonString);
        JSONObject jsonObject= JSONObject.parseObject(jsonString);
        //String customerTel = (String)jsonObject.get("customerTel");
        //String passWord = (String) jsonObject.get("customerPassword");

        CustomerInfo customerInfo = JSON.parseObject(jsonString,CustomerInfo.class);
        HashMap mapType = (HashMap)JSON.parseObject(jsonString,Map.class);
        //registerResult = customerService.register(customerInfo);
        result = carService.addCar(mapType);
        String result1=result+"This is a 注册结果";
        System.out.println("结果为" + result);
        Map<String, Object> map = new HashMap<>();
        map.put("RESULT_KEY", result);



        resp.addHeader("Content-Type","application/json; charset=utf-8");
        resp.addHeader("Accept-Encoding","gzip");
        resp.setContentType("text/plain;charset=utf-8" );
        resp.setCharacterEncoding("UTF-8");

        String result = JSON.toJSONString(map);
        System.out.println("结果为" + result);
        //resp.setCharacterEncoding("application/json;charset=utf-8");
        PrintWriter printWriter = resp.getWriter();
        printWriter.write(result);
        printWriter.close();

    }

    /*
    通过座位数查可用车辆，（暂时不用）
    通过开始用车时间和结束用车时间查可用车辆。
    * */
    @RequestMapping(value = "/QueryByTime",method= RequestMethod.POST)
    public void queryCar(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求carService为" +carService);
        BufferedReader br = req.getReader();
        System.out.println("获取注册请求流："+br);

        String str, jsonString = "";
        while((str = br.readLine()) != null){
            jsonString += str;
            System.out.println("str为" + str);
        }
        System.out.println(jsonString);
        System.out.println("注册请求为" + jsonString);
        JSONObject jsonObject= JSONObject.parseObject(jsonString);

        CustomerInfo customerInfo = JSON.parseObject(jsonString,CustomerInfo.class);
        HashMap mapType = (HashMap)JSON.parseObject(jsonString,Map.class);
        //registerResult = customerService.register(customerInfo);
        List<CarInfo>  carInfoList  = carService.queryCar(mapType);
        System.out.println("结果为" + result);
        Map<String, Object> map = new HashMap<>();
        map.put("RESULT_KEY", result);


        resp.addHeader("Content-Type","application/json; charset=utf-8");
        resp.addHeader("Accept-Encoding","gzip");
        resp.setContentType("text/plain;charset=utf-8" );
        resp.setCharacterEncoding("UTF-8");

        String result = JSON.toJSONString(carInfoList);
        System.out.println("结果为" + result);
        //resp.setCharacterEncoding("application/json;charset=utf-8");
        PrintWriter printWriter = resp.getWriter();
        printWriter.write(result);
        printWriter.close();

    }



}
