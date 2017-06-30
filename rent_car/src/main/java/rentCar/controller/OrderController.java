package rentCar.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import rentCar.entity.OrderInfo;
import rentCar.mappers.LicenseMapper;
import rentCar.mappers.OrderMapper;
import rentCar.service.LicenseService;
import rentCar.service.OrderService;
import rentCar.service.RenewalOrderService;

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
@RequestMapping("/Order")
public class OrderController {


    private int result =0;
    @Resource
    OrderService orderService;
    @Resource
    RenewalOrderService renewalOrderService;
    @Resource
    LicenseService licenseService;
    @Resource
    LicenseMapper licenseMapper;

    /*
    * 查询订单
    * */
    @RequestMapping(value = "/Query/orderNo",method= RequestMethod.GET)
    public ModelAndView queryOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求orderService为" +orderService);
       String orderNo = req.getParameter("orderNo");
        OrderInfo orderInfo = orderService.queryOrder(orderNo);
        ArrayList list =orderService.queryRenewal(orderNo);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("orderDetail");
        String jsonString = JSON.toJSONString(orderInfo);
        HashMap map = (HashMap)JSON.parseObject(jsonString,Map.class);
        //modelAndView.addObject(orderInfo);
        //modelAndView.addObject();
        modelAndView.addAllObjects(map);
        modelAndView.addObject("list",list);
       return  modelAndView;
    }

    /*
    * 查询订单,按照订单的状态进行查询，预定，出车，还车，违章等
    * */
    @RequestMapping(value = "/Query/orderStatus",method= RequestMethod.GET)
    public ModelAndView queryOrderByStatus(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String orderStatus= req.getParameter("orderStatus");

        System.out.println("请求orderStatus为" +orderStatus);
        System.out.println("请求orderService为" +orderService);

        ArrayList orderInfo = orderService.queryOrderByOrderType(orderStatus);
        System.out.println("开始查询订单");
        //HashMap map= orderService.queryOrderByOrderType(orderStatus);
        ModelAndView mav =new ModelAndView();

        //mav.addAllObjects(map);
        mav.addObject("list",orderInfo);

        if(orderStatus.equals("1")){
            mav.setViewName("booking"); // index之后不需要加.jsp
        }else if (orderStatus.equals("2")){
            mav.setViewName("renting"); // index之后不需要加.jsp
        }else if(orderStatus.equals("3")){
            mav.setViewName("back"); // index之后不需要加.jsp
        } else if(orderStatus.equals("4")){
            mav.setViewName("violate"); // index之后不需要加.jsp
        }else {
            mav.setViewName("finish"); // index之后不需要加.jsp
        }
        return  mav;

    }
    /*
     添加订单实现，获取添加订单输入流，进行处理，返回添加订单结果。
     再生成一个该订单的uuid，然后插入数据库
   */
    @RequestMapping(value = "/Add",method= RequestMethod.POST)
    public void addOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求orderService为" +orderService);
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
        result = orderService.addBookOrder(mapType);
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
     * 验证用户
     * */
    @RequestMapping(value = "/customerVerify",method= RequestMethod.POST)
    public void customerVerify(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求orderService为" +orderService);
        BufferedReader br = req.getReader();

        String str, jsonString = "";
        while((str = br.readLine()) != null){
            jsonString += str;
            System.out.println("str为" + str);
        }
        System.out.println(jsonString);
        System.out.println("请求为" + jsonString);
        JSONObject jsonObject= JSONObject.parseObject(jsonString);
        String customerTel = (String)jsonObject.get("customerTel");
        HashMap map = orderService.customerVerify(customerTel);

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
    返回用modelAndView,再用一个List放键值对，返回续租订单信息。
    * */
    @RequestMapping(value = "/oldCustomerRentCar",method= RequestMethod.POST)
    public void updateRentCarOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求orderService为" +orderService);
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
        String licenseType = (String)jsonObject.get("licenseType");
        String licenseStartDate = (String)jsonObject.get("licenseStartDate");
        String licenseInvalidDate = (String)jsonObject.get("licenseInvalidDate");
        String licenseAges = (String)jsonObject.get("licenseAges");
        HashMap licenseMap = new HashMap<>();
        licenseMap.put("licenseNo", licenseNo);
        licenseMap.put("licenseType", licenseType);
        licenseMap.put("licenseStartDate",licenseStartDate);
        licenseMap.put("licenseInvalidDate",licenseInvalidDate);
        licenseMap.put("licenseAges",licenseAges);
        String licenseId=licenseMapper.queryIDByLicenseNo(licenseNo);
        //String  licenseId=(String)infoMap.get("licenseId");
        if (licenseId==null){
            // to-do 驾驶证未存在，插入驾驶证信息
            int  licenseResult= licenseService.addLicense(licenseMap);
            licenseId=licenseMapper.queryIDByLicenseNo(licenseNo);
        }else{
            licenseId=licenseMapper.queryIDByLicenseNo(licenseNo);
            //infoMap.put("licenseId",licenseId);
        }



        String customerTel = (String)jsonObject.get("customerTel");
        HashMap bookOrderMap = new HashMap<>();
        bookOrderMap.put("customerTel",customerTel);
       // orderService.addBookOrder(bookOrderMap);
        String carNo = (String)jsonObject.get("carNo");
        String orderStartDate = (String)jsonObject.get("orderStartDate");
        String returnDateInPlan = (String)jsonObject.get("returnDateInPlan");
        String orderStartMiles = (String)jsonObject.get("orderStartMiles");

        HashMap rentCarOrderMap = new HashMap<>();
        rentCarOrderMap.put("carNo",carNo);
        rentCarOrderMap.put("licenseId", licenseId);
        rentCarOrderMap.put("customerTel",customerTel);
        rentCarOrderMap.put("orderStartDate",orderStartDate);
        rentCarOrderMap.put("returnDateInPlan",returnDateInPlan);
        rentCarOrderMap.put("orderStartMiles",orderStartMiles);
        result = orderService.addRentOrder(rentCarOrderMap);

//        HashMap mapType = (HashMap) JSON.parseObject(jsonString,Map.class);
//        result = orderService.updateRentCarOrder(mapType);
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

    @RequestMapping(value = "/newCustomerRentCar",method= RequestMethod.POST)
    public void updateRentCarOrderByNewCustomer(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求orderService为" +orderService);
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
        result = orderService.updateRentCarOrder(mapType);
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
    还车，先发一个基本金额，超时金额。modelAndView,
    再收一个表单，然后再处理。
    */
    @RequestMapping(value = "/beforeBackCar",method= RequestMethod.POST)
    public ModelAndView beforeBackCarOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        String orderNo=req.getParameter("orderNo");
        String returnDateInActual=req.getParameter("returnDateInActual");
        String orderEndMiles=req.getParameter("orderEndMiles");
        HashMap<String, Object> mapType = new HashMap<>();
        mapType.put("orderNo",orderNo);
        mapType.put("returnDateInActual",returnDateInActual);
        mapType.put("orderEndMiles",orderEndMiles);
        result = orderService.updateBackCarOrder(mapType);
        System.out.println("结果为" + result);
        Map<String, Object> map = new HashMap<>();
        System.out.println("开始查询可用车辆");
         map= orderService.beforeBackCar(mapType);
        ModelAndView mav =new ModelAndView();
        mav.setViewName("check-payment"); // index之后不需要加.jsp
        mav.addAllObjects(map);
        //mav.addObject("list",map);
        return  mav;
    }
    /*
    还车，先发一个基本金额，超时金额。modelAndView,
    再收一个表单，然后再处理。
    */
    @RequestMapping(value = "/BackCar",method= RequestMethod.POST)
    public void updateBackCarOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求orderService为" +orderService);
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
        result = orderService.updateBackCarOrder(mapType);
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
    * 违章处理，接受一个表单，然后直接置订单状态位
    * */
    @RequestMapping(value = "/Violate",method= RequestMethod.POST)
    public void updateViolateOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求orderService为" +orderService);
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
        result = orderService.addBookOrder(mapType);
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
       * 违章处理，接受一个表单，然后直接置订单状态位
       * */
    @RequestMapping(value = "/Finish",method= RequestMethod.POST)
    public void updateFinishOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求orderService为" +orderService);
        BufferedReader br = req.getReader();

        String str, jsonString = "";
        while((str = br.readLine()) != null){
            jsonString += str;
            System.out.println("str为" + str);
        }
        System.out.println(jsonString);
        System.out.println("请求为" + jsonString);
        JSONObject jsonObject= JSONObject.parseObject(jsonString);
        String orderNo = (String)jsonObject.get("orderNo");
        result = orderService.finishOrder(orderNo);
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
    * 取消订单，订单置标志位
    * */



}
