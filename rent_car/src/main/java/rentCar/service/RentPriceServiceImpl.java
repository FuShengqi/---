package rentCar.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.CarInfo;
import rentCar.entity.CustomerInfo;
import rentCar.entity.RentPriceInfo;
import rentCar.mappers.CustomerMapper;
import rentCar.mappers.ModelMapper;
import rentCar.mappers.RentPriceMapper;
import rentCar.mappers.StuffMapper;
import rentCar.util.IdFactory;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service("rentPriceService")
@Transactional
public class RentPriceServiceImpl implements RentPriceService {
    private int result = -1;
    private IdFactory idFactory= new IdFactory();
    @Resource
    private RentPriceMapper rentPriceMapper;
    @Resource
    private StuffMapper stuffMapper;
    @Resource
    ModelMapper modelMapper;



    @Override
    public List<RentPriceInfo> findAll() {
        return null;
    }

    @Override
    public RentPriceInfo queryRentPrice(String violateNo) {

        return null;
    }

    @Override
    public int deleteRentPrice(String userName) {
        return 0;
    }

    @Override
    public int updateRentPrice(HashMap infoMap) {
        return 0;
    }

    /*
    * 车型外键uuid通过modelInfoId获取
    * */
    @Override
    public int addRentPrice(HashMap infoMap) {
        String modelInfoId=(String)infoMap.get("modelName");//此carId即carNo

        //1、先判断是否有相应的车型
        String id = modelMapper.queryIDByModelName(modelInfoId);
        infoMap.put("modelInfoId",id);
        if (id == null) {
            System.out.println("车型不存在");
            result=0;  //车型不存在
            return result;
        }else{
            String s = rentPriceMapper.queryIDByModelInfoId(id);
            if (s == null) {
                System.out.println("插入数据结果："+result);
                // result=1; 记录者应该是当前登录的用户，但这里有些问题。

                String  ID=idFactory.getUUID();
                infoMap.put("id",ID);

                String recordCreator=(String)infoMap.get("recordCreator");
                recordCreator = stuffMapper.queryIDByStuffName("ADMIN");
                infoMap.put("recordCreator",recordCreator);



                infoMap.put("recordCreateTime",idFactory.getCurrentTime());
                rentPriceMapper.insertRentPriceMap(infoMap);
                //车型已存在
                result=1;
            }
            else {
                System.out.println("价格表已存在,跳出");
                result = 0;
            }
        }
        return result;
    }
}
