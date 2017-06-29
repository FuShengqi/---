package rentCar.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.CustomerInfo;
import rentCar.entity.LicenseInfo;
import rentCar.mappers.CustomerMapper;
import rentCar.mappers.LicenseMapper;
import rentCar.mappers.StuffMapper;
import rentCar.util.IdFactory;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service("licenseService")
@Transactional
public class LicenseServiceImpl implements LicenseService{
    private int result = -1;
    private IdFactory idFactory = new IdFactory();
    @Resource
    StuffMapper stuffMapper;
    @Resource
    private CustomerMapper customerMapper;
    @Resource
    LicenseMapper licenseMapper;

    @Override
    public List<LicenseInfo> findAll() {
        List<LicenseInfo> licenseInfoList =licenseMapper.findAll();
        return licenseInfoList;
    }

    @Override
    public LicenseInfo queryLicense(String licenseNo) {
        //String id =licenseMapper.queryIDByLicenseNo(licenseNo);
        LicenseInfo licenseInfo=licenseMapper.getLicenseByNo(licenseNo);
        return licenseInfo;
    }

    @Override
    public int deleteLicense(String userName) {
        return 0;
    }

    @Override
    public int updateLicense(HashMap infoMap) {
        return 0;
    }

    @Override
    public int addLicense(HashMap infoMap) {
        String licenseNo=(String)infoMap.get("licenseNo");//此carId即carNo

        //1、先判断是否有相应的驾驶证
        String id = licenseMapper.queryIDByLicenseNo(licenseNo);
        if (id == null) {
            System.out.println("插入数据结果："+result);
            // result=1; 记录者应该是当前登录的用户，但这里有些问题。

            String  ID=idFactory.getUUID();
            infoMap.put("id",ID);

            String recordCreator=(String)infoMap.get("recordCreator");
            recordCreator="0";
            recordCreator = stuffMapper.queryIDByStuffNo(recordCreator);
            infoMap.put("recordCreator",recordCreator);


            infoMap.put("recordCreateTime",idFactory.getCurrentTime());

            licenseMapper.insertLicenseMap(infoMap);
            result=1;  //车辆不存在
            return result;
        }else{
            //驾驶证已存在
            result=0;
        }
        return result;
    }

}
