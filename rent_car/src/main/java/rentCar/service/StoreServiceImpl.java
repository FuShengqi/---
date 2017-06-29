package rentCar.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.CarInfo;
import rentCar.entity.CustomerInfo;
import rentCar.entity.StoreInfo;
import rentCar.mappers.CustomerMapper;
import rentCar.mappers.StoreMapper;
import rentCar.mappers.StuffMapper;
import rentCar.util.IdFactory;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service("storeService")
@Transactional
public class StoreServiceImpl implements StoreService {
    private int result = -1;
    private IdFactory idFactory=new IdFactory();
    @Resource
    private StoreMapper storeMapper;
    @Resource
    private StuffMapper stuffMapper;


    @Override
    public List<StoreInfo> findAll() {
        return null;
    }

    @Override
    public StoreInfo queryStore(String storeNo) {
        return null;
    }

    @Override
    public int deleteStore(String storeNo) {
        return 0;
    }

    @Override
    public int updateStore(HashMap infoMap) {
        return 0;
    }

    /*
    * 生成门店编号，并产生主码uuid
    * */
    @Override
    public int addStore(HashMap infoMap) {
            System.out.println("插入数据结果："+result);
            // result=1; 记录者应该是当前登录的用户，但这里有些问题。
            String  ID=idFactory.getUUID();
            infoMap.put("id",ID);

            String storeNo= getStoreNo();
            infoMap.put("storeNo",storeNo);
            String recordCreator=(String)infoMap.get("recordCreator");
            recordCreator = stuffMapper.queryIDByStuffNo(recordCreator);
            infoMap.put("recordCreator",recordCreator);

            infoMap.put("recordCreateTime",idFactory.getCurrentTime());
            storeMapper.insertStoreMap(infoMap);
            result=1;
            return result;
    }
    /*
    生成每个店面注册时的唯一编号
     店面编号=注册顺序码(6位，例：000001)
 */
    public String getStoreNo(){
        String storeNo="";
        storeNo=storeMapper.count().toString();
        return storeNo;

    }
}
