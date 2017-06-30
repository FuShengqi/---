package rentCar.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import rentCar.entity.StuffInfo;
import rentCar.service.StuffService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xpb on 2017/6/25.
 */
@Controller
@RequestMapping("/Stuff")
public class StuffController {
        private int loginResult =100;
        private int registerResult =100;
        @Resource
        private StuffService stuffService;
        @RequestMapping("/list")
        public String list(){
            List<StuffInfo> list=stuffService.findAll();
            System.out.println(String.valueOf(list));
            return String.valueOf(list);
        }

    @RequestMapping("/index")
    public ModelAndView index(){
        Map<String, Object> map = new HashMap<>();
        map =stuffService.setFourCount();
        ModelAndView mav =new ModelAndView();
        mav.setViewName("index"); // index之后不需要加.jsp
        mav.addAllObjects(map);
        return  mav;
    }
    /*
    登录实现，获取登录输入流，进行处理，返回登录结果。
    登录成功返回四个键值对，bookCount,rentingCount,backCount,violateCount
    在model里设置。
    */

        @RequestMapping(value = "/Login",method= RequestMethod.POST)
        public String login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
            System.out.println("请求为" + req);
            System.out.println("请求Service为" +stuffService);
            /*BufferedReader br = req.getReader();

            System.out.println("获取请求流："+br);

            String str, jsonString = "";
            while((str = br.readLine()) != null){
                jsonString += str;
                System.out.println("str为" + str);
            }
            System.out.println(jsonString);
            System.out.println("请求为" + jsonString);*/
           // JSONObject jsonObject= JSONObject.parseObject(jsonString);
           // String userName2 = (String)jsonObject.get("userName");//不改变
           // String passWord2 = (String) jsonObject.get("stuffPassword");

            String userName = req.getParameter("userName");
            String passWord = req.getParameter("passWord");

            System.out.println("69请求的userName为" + userName + "\n69请求的passWord为" + passWord);
           // System.out.println("69请求的userName2为" + userName2 + "\n69请求的passWord2为" + passWord2);
            //loginResult = stuffService.login(userName2, passWord2);
            loginResult = stuffService.login(userName, passWord);
            String result1=loginResult+"This is a 登录结果";
            System.out.println("结果为" + result1);
            Map<String, Object> map = new HashMap<>();
            map.put("RESULT_KEY", loginResult);
            //map.put("userName",userName);
           // map.put("passWord",passWord);
            resp.addHeader("Content-Type","application/json; charset=utf-8");
            resp.addHeader("Accept-Encoding","gzip");
            resp.setContentType("text/plain;charset=utf-8" );
            resp.setCharacterEncoding("UTF-8");
             if(loginResult==1){
                return "redirect:/Stuff/index";
                // return "redirect:/index.jsp";
             }else{
                 return "redirect:/login.jsp";
             }
            //String result = JSON.toJSONString(map);
            /*System.out.println("结果为" + result);
            PrintWriter printWriter = resp.getWriter();
            printWriter.write(result);
            //printWriter.write(result1);
            //  printWriter.flush();
            printWriter.close();
*/
        }

      /*
    注册实现，获取注册输入流，进行处理，返回注册结果。
    */
        @RequestMapping(value = "/Register",method=RequestMethod.POST)
        public HashMap<String, String> register(HttpServletRequest req, HttpServletResponse resp) throws Exception {
            System.out.println("注册请求为" + req);
            System.out.println("请求registerService为" +stuffService);
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
            String stuffTel = (String)jsonObject.get("stuffTel");
            String passWord = (String) jsonObject.get("stuffPassword");
            String stuffId = (String) jsonObject.get("stuffId");

            String stuffName = (String) jsonObject.get("stuffName");
            String stuffEmail = (String) jsonObject.get("email");
            System.out.println("注册请求的stuffId为" + stuffId);
            System.out.println("注册请求的stuffTel为" + stuffTel +
                    "\n69注册请求的passWord为" + passWord);
            StuffInfo stuffInfo = JSON.parseObject(jsonString,StuffInfo.class);
            HashMap mapType = (HashMap)JSON.parseObject(jsonString,Map.class);
            mapType.put("RESULT_KEY", registerResult);
            mapType.put("stuffEmail", stuffEmail);
            mapType.put("stuffTel",stuffTel);
            mapType.put("passWord",passWord);
            mapType.put("stuffName", stuffName);
            //registerResult = stuffService.register(stuffTel, passWord);
            //registerResult = stuffService.register(stuffInfo);
            registerResult = stuffService.register(mapType);
            String result1=registerResult+"This is a 注册结果";
            System.out.println("结果为" + result1);
            Map<String, Object> map = new HashMap<>();
            map.put("RESULT_KEY", registerResult);
            map.put("stuffEmail", stuffEmail);
            map.put("stuffTel",stuffTel);
            map.put("passWord",passWord);

            System.out.println("MAP:" + map);
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

            HashMap<String, String> mappp = new HashMap<String, String>();
            mappp.put("RESULT_KEY", "1");
            return mappp;

        }

    /*
    更改密码实现，获取输入流，进行处理，返回结果。
    */

        @RequestMapping(value = "/updatePassword",method=RequestMethod.POST)
        public void updatePassword(HttpServletRequest req, HttpServletResponse resp) throws Exception {
            System.out.println("更改密码请求为" + req);
            System.out.println("更改密码请求userService为" + stuffService);
            BufferedReader br = req.getReader();
            System.out.println("获取更改密码请求流："+br);

            String str, jsonString = "";
            while((str = br.readLine()) != null){
                jsonString += str;
                System.out.println("str为" + str);
            }
            System.out.println(jsonString);
            System.out.println("更改密码请求为" + jsonString);
            JSONObject jsonObject= JSONObject.parseObject(jsonString);
            String stuffTel = (String)jsonObject.get("stuffTel");
            String passWord= (String) jsonObject.get("stuffPassword");

            System.out.println("更改密码请求的stuffTel为" + stuffTel +
                    "\n更改密码请求的passWord为" + passWord);
            int updateResult = stuffService.updatePassword(stuffTel,passWord);
            System.out.println("此次更改密码的结果为"+updateResult);
            String result1=updateResult+"This is a 更改密码结果";
            System.out.println("结果为" + result1);
            Map<String, Object> map = new HashMap<>();
            map.put("RESULT_KEY", registerResult);

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
    删除用户实现，获取输入流，进行处理，返回结果。
    */

        @RequestMapping(value = "/deleteUser",method=RequestMethod.POST)
        public void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws Exception {
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
            String stuffTel=(String)jsonObject.get("stuffTel");
            System.out.println("删除用户请求的电话为" + stuffTel);
            int deleteResult =stuffService.deleteUser(stuffTel);
            System.out.println("此次删除的结果为"+deleteResult);
            String result1=deleteResult+"This is a 删除用户结果";
            System.out.println("结果为" + result1);
            Map<String, Object> map = new HashMap<>();
            map.put("RESULT_KEY", registerResult);

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


