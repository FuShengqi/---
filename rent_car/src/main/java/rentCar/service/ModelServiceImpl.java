package rentCar.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.CustomerInfo;
import rentCar.entity.ModelInfo;
import rentCar.mappers.CustomerMapper;
import rentCar.mappers.ModelMapper;
import rentCar.mappers.StuffMapper;
import rentCar.util.IdFactory;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service("modelService")
@Transactional
public class ModelServiceImpl implements ModelService {
    private int result = -1;
    private IdFactory idFactory= new IdFactory();
    @Resource
    private CustomerMapper customerMapper;
    @Resource
    private StuffMapper stuffMapper;
    @Resource
    ModelMapper modelMapper;

    @Override
    public List<ModelInfo> findAll() {
        return null;
    }

    @Override
    public ModelInfo queryModel(String violateNo) {
        return null;
    }

    @Override
    public int deleteModel(String userName) {
        return 0;
    }

    @Override
    public int updateModel(HashMap infoMap) {
        return 0;
    }

    @Override
    public int addModel(HashMap infoMap) {
        String modelName=(String)infoMap.get("modelName");//

        //1、先判断是否有相应的车型
        System.out.println("modelName:" + modelName);
        String id = modelMapper.queryIDByModelName(modelName);
        if (id == null) {
            // result=1; 记录者应该是当前登录的用户，但这里有些问题。
            System.out.println("开始插入数据结果："+modelName+id);
            String  ID=idFactory.getUUID();
            System.out.println("开始插入数据结果："+ID);
            infoMap.put("id",ID);
//            StuffMapper stuffMapper ;

//            infoMap.put("recordCreator", stuffMapper.queryIDByStuffName("ADMIN"));
            infoMap.put("recordCreator", "90a205071316495e89bd27d92176fe3f");
//            String recordCreator=(String)infoMap.get("recordCreator");
//            recordCreator = stuffMapper.queryIDByStuffNo(recordCreator);
            //infoMap.put("recordCreator",recordCreator);

            infoMap.put("recordCreateTime",idFactory.getCurrentTime());
            System.out.println(infoMap);
            modelMapper.insertModelMap(infoMap);
            result=1;  //车辆不存在
            System.out.println("插入数据结果："+result);
            return result;
        }else{
            //车辆已存在
            result=0;
        }
        return result;
    }
}
