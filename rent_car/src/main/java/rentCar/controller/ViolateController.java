package rentCar.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import rentCar.entity.CustomerInfo;
import rentCar.entity.ViolateInfo;
import rentCar.service.ViolateService;

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
@RequestMapping("/Violate")
public class ViolateController {
    private int result =0;
    @Resource
    ViolateService violateService;

    @RequestMapping("/List")
    public String list(){
        List<ViolateInfo> list=violateService.findAll();
        System.out.println(String.valueOf(list));
        return String.valueOf(list);
    }

     /*
    添加实现，获取添加输入流，进行处理，返回添加结果。
    */

    @RequestMapping(value = "/Add",method= RequestMethod.POST)
    public void add(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("请求为" + req);
        System.out.println("请求Service为" +violateService);
        BufferedReader br = req.getReader();
        System.out.println("获取请求流："+br);

        String str, jsonString = "";
        while((str = br.readLine()) != null){
            jsonString += str;
            System.out.println("str为" + str);
        }
        System.out.println(jsonString);
        System.out.println("请求为" + jsonString);
        JSONObject jsonObject= JSONObject.parseObject(jsonString);
        HashMap mapType = (HashMap)JSON.parseObject(jsonString,Map.class);

        result = violateService.addViolate(mapType);
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
    查询实现，获取查询输入流，进行处理，返回查询结果。
    */

    @RequestMapping(value = "/Query",method= RequestMethod.POST)
    public ModelAndView query(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        System.out.println("开始查询违章车辆");
        ArrayList violateInfoList= violateService.findAll();
        Map<String, Object> map = new HashMap<>();
        ModelAndView mav =new ModelAndView();
        // 需要改地址
        mav.setViewName("ava_car"); // index之后不需要加.jsp
        //mav.addAllObjects(map);
        mav.addObject("list",violateInfoList);
        return  mav;
    }



}
