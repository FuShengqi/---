package rentCar.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.CarInfo;
import rentCar.entity.CustomerInfo;
import rentCar.entity.ViolateInfo;
import rentCar.mappers.CarMapper;
import rentCar.mappers.CustomerMapper;
import rentCar.mappers.StuffMapper;
import rentCar.mappers.ViolateMapper;
import rentCar.util.IdFactory;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service("violateService")
@Transactional
public class ViolateServiceImpl implements ViolateService {
    private int result = -1;
    private IdFactory idFactory = new IdFactory();
    @Resource
    StuffMapper stuffMapper;
    @Resource
    ViolateMapper violateMapper;
    @Resource
    CarMapper  carMapper;


    @Override
    public  ArrayList findAll() {
        List<ViolateInfo> violateInfoList= violateMapper.findAll();
        ArrayList mapList =new ArrayList();

        for(int i=0;i<violateInfoList.size();i++){
            //HashMap<String, Object> map = new HashMap<String, Object>();
            HashMap map = new HashMap();
            System.out.println("开始查询违章车辆"+map);
            String carId= violateInfoList.get(i).getCarId();
            System.out.println("开始查询违章车辆violateInfoList.get(i)"+violateInfoList.get(i));
            String carNo = carMapper.queryCarNoByCarId(carId);
            System.out.println("开始查询违章车辆carNo"+carNo);
            map.put("carId",carNo);
            map.put("violateDate",violateInfoList.get(i).getViolateDate());
            map.put("violateEvent",violateInfoList.get(i).getViolateEvent());
            map.put("violateFee",violateInfoList.get(i).getViolateFee());
            mapList.add(i,map);
        }
        System.out.println("maplist: "+mapList);
        return mapList;
    }

    /*
    * 参数有些许问题，不能用violateNo，应该用车牌号
    * */
    @Override
    public ViolateInfo queryViolate(String carNo) {
        String carId=carMapper.queryIDByCarNo(carNo);
        String violateId= violateMapper.queryIDByViolateNo(carId);
        ViolateInfo violateInfo = violateMapper.getViolateByNo(violateId);
        System.out.println("开始查询！！！");
        return violateInfo;
    }

    @Override
    public int deleteViolate(String violateNo) {
        System.out.println("删除之前!");
        String id=violateMapper.queryIDByViolateNo(violateNo);
        System.out.println("删除之前222!");
        if ((id == null)) {
            result=0;  //用户不存在
            System.out.println("违章记录不存在!");
            return result;
        }else{
            System.out.println("违章记录存在，开始删除!");
            violateMapper.deleteViolate(id);
            System.out.println("删除成功!");
            result=1;
        }
        return result;
    }

    @Override
    public int updateViolate(HashMap infoMap) {

        return 0;
    }

    @Override
    public int addViolate(HashMap infoMap) {
        String carNo=(String)infoMap.get("carNo");//此carId即carNo
        System.out.println("违章车辆："+carNo);
        //1、先判断是否有相应的车辆
        String id = carMapper.queryIDByCarNo(carNo);
        infoMap.put("carId",id);
        if (id == null) {
            System.out.println("插入数据结果："+result);
            result=0;  //车辆不存在
            return result;
        }else{
            // result=1; 记录者应该是当前登录的用户，但这里有些问题。
            String recordCreator=(String)infoMap.get("recordCreator");
            recordCreator="0";
            String  ID=idFactory.getUUID();
            System.out.println("用户未存在，开始注册!");
            recordCreator = stuffMapper.queryIDByStuffNo(recordCreator);
            infoMap.put("recordCreator",recordCreator);
            infoMap.put("id",ID);
            infoMap.put("recordCreateTime",idFactory.getCurrentTime());
            violateMapper.insertViolateMap(infoMap);
            result=1;
        }
        return result;
    }
}
