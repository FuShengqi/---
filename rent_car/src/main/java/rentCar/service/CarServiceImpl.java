package rentCar.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.CarInfo;
import rentCar.entity.CustomerInfo;
import rentCar.entity.ModelInfo;
import rentCar.mappers.*;
import rentCar.util.IdFactory;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service("carService")
@Transactional
public class CarServiceImpl implements CarService {
    private int result = -1;
    private IdFactory idFactory = new IdFactory();
    @Resource
    StuffMapper stuffMapper;
    @Resource
    private CarMapper carMapper;
    @Resource
    ModelMapper modelMapper;
    @Resource
    StoreMapper storeMapper;



    @Override
    public List<CarInfo> findAll() {
        return carMapper.findAll();
    }
/*
* 返回的信息包括，车牌号，颜色，车型，座位数，车辆名称（modelName）
* */
    @Override
    public ArrayList queryCarSimple() {
        System.out.println("开始查询可用车辆");
        List<CarInfo> carInfoList= carMapper.findAll();
        System.out.println("开始查询可用车辆"+carInfoList);
       // List<HashMap<String, Object>> mapList=new List<HashMap<String, Object>>();
       // List<HashMap<String, Object>> mapList=null;
        ArrayList mapList =new ArrayList();

        for(int i=0;i<carInfoList.size();i++){
            //HashMap<String, Object> map = new HashMap<String, Object>();
            HashMap map = new HashMap();
            System.out.println("开始查询可用车辆"+map);

            String modelInfoId= carInfoList.get(i).getModelInfoId();
            String carColor=carInfoList.get(i).getCarColor();
            System.out.println("开始查询可用车辆原始modelInfoId"+modelInfoId);
            System.out.println("开始查询可用车辆原始CarColor"+carColor);
            System.out.println("开始查询可用车辆carInfoList.get(i)"+carInfoList.get(i));
            //modelInfoId = modelMapper.queryModelNameById(modelInfoId);
            System.out.println("开始查询可用车辆modelInfoId"+modelInfoId);
            ModelInfo modelInfo = modelMapper.queryModelById(modelInfoId);
            System.out.println("开始查询可用车辆modelInfo"+modelInfo);
            map.put("modelName",modelInfo.getModelName());
            System.out.println("开始查询可用车辆modelName"+modelInfo.getModelName());
            map.put("modelSeatNum",modelInfo.getModeSeatNum());
            map.put("modelType",modelInfo.getModelType());
            map.put("carColor",carInfoList.get(i).getCarColor());
            map.put("carNo",carInfoList.get(i).getCarNo());
            mapList.add(i,map);
        }
        return mapList;
    }

    @Override
    public HashMap queryCar(String carNo) {
        System.out.println("开始查询可用车辆carNo"+carNo);
        CarInfo carInfo=carMapper.getCarByNo(carNo);
        HashMap map = new HashMap();
        System.out.println("开始查询可用车辆"+map);
        System.out.println("开始查询可用车辆carInfo"+carInfo);
        String modelInfoId= carInfo.getModelInfoId();
        String carColor=carInfo.getCarColor();
        System.out.println("开始查询可用车辆原始modelInfoId"+modelInfoId);
        System.out.println("开始查询可用车辆原始CarColor"+carColor);

        //modelInfoId = modelMapper.queryModelNameById(modelInfoId);
        System.out.println("开始查询可用车辆modelInfoId"+modelInfoId);
        ModelInfo modelInfo = modelMapper.queryModelById(modelInfoId);
        System.out.println("开始查询可用车辆modelInfo"+modelInfo);
        map.put("modelName",modelInfo.getModelName());
        map.put("modelSeatNum",modelInfo.getModeSeatNum());
        map.put("modelType",modelInfo.getModelType());
        map.put("carColor",carInfo.getCarColor());
        map.put("carNo",carInfo.getCarNo());
        map.put("CarBuyDate", carInfo.getCarBuyDate());
        map.put("CarEngineNo", carInfo.getCarEngineNo());
        map.put("CarFrameNo", carInfo.getCarFrameNo());
      return  map;

    }
/*
* 根据用车的起始时间和结束时间查询可用车辆
* */
    @Override
    public List<CarInfo> queryCar(HashMap infoMap) {
        List<CarInfo>  carInfoList =null;
        return carInfoList;
    }

    @Override
    public int deleteCar(String carNo) {
        String  id = carMapper.queryIDByCarNo(carNo);
        carMapper.deleteCar(id);
        return 1;
    }

    @Override
    public int updateCar(HashMap infoMap) {
        return 0;
    }


    /*
    * model_info_id ，car_store_id需要改变成uuid。
    * */
    @Override
    public int addCar(HashMap infoMap) {
        String carId=(String)infoMap.get("carId");//此carId即carNo
        System.out.println("准备插入数据结果："+carId);
        //1、先判断是否有相应的车辆
        String id = carMapper.queryIDByCarNo(carId);
        //infoMap.put("carId",id);
        if (id == null) {

            System.out.println("插入数据结果："+result);
            // result=1; 记录者应该是当前登录的用户，但这里有些问题。

            String  ID=idFactory.getUUID();
            infoMap.put("id",ID);

            String recordCreator=(String)infoMap.get("recordCreator");
            recordCreator="0";
            recordCreator = stuffMapper.queryIDByStuffNo(recordCreator);
            infoMap.put("recordCreator",recordCreator);

            String modelName=(String)infoMap.get("modelName");
            String modelInfoId = modelMapper.queryIDByModelName(modelName);
            infoMap.put("modelInfoId",modelInfoId);

            String carStoreId=(String)infoMap.get("carStoreId");
            carStoreId="0";
            carStoreId = storeMapper.queryIDByStoreNo(carStoreId);
            infoMap.put("carStoreId",carStoreId);

            infoMap.put("recordCreateTime",idFactory.getCurrentTime());

            carMapper.insertCarMap(infoMap);
            result=1;  //车辆不存在
            return result;
        }else{
            //车辆已存在
            result=0;
        }
        return result;
    }

    /*
    *  CarInfo carInfo=carMapper.getCarByNo("皖A1111");
        HashMap map = new HashMap();
        System.out.println("开始查询可用车辆"+map);

        String modelInfoId= carInfo.getModelInfoId();
        String carColor=carInfo.getCarColor();
        System.out.println("开始查询可用车辆原始modelInfoId"+modelInfoId);
        System.out.println("开始查询可用车辆原始CarColor"+carColor);
        System.out.println("开始查询可用车辆carInfoList.get(i)"+carInfo);
        //modelInfoId = modelMapper.queryModelNameById(modelInfoId);
        System.out.println("开始查询可用车辆modelInfoId"+modelInfoId);
        ModelInfo modelInfo = modelMapper.queryModelById(modelInfoId);
        System.out.println("开始查询可用车辆modelInfo"+modelInfo);
        map.put("modelName",modelInfo.getModelName());
        map.put("modeSeatNum",modelInfo.getModeSeatNum());
        map.put("modeType",modelInfo.getModelType());
        map.put("carCcolor",carInfo.getCarColor());
        map.put("carNo",carInfo.getCarNo());
        mapList.add(0,map);
    * */
}
