package rentCar.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import rentCar.entity.CarInfo;
import rentCar.entity.CustomerInfo;
import rentCar.entity.RenewalOrderInfo;
import rentCar.mappers.CustomerMapper;
import rentCar.mappers.OrderMapper;
import rentCar.mappers.RenewalOrderMapper;
import rentCar.mappers.StuffMapper;
import rentCar.util.IdFactory;

import javax.annotation.Resource;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by xpb on 2017/6/25.
 */
@Service(" renewalOrderService")
@Transactional
public class RenewalOrderServiceImpl implements RenewalOrderService {
    private int result = -1;
    private IdFactory idFactory= new IdFactory();
    @Resource
    private CustomerMapper customerMapper;
    @Resource
    private StuffMapper stuffMapper;
    @Resource
    RenewalOrderMapper renewalOrderMapper;
    @Resource
    OrderMapper orderMapper;


    @Override
    public List<RenewalOrderInfo> findAll() {
        return null;
    }

    @Override
    public List<RenewalOrderInfo> queryRenewalOrder(String orderNo) {
        List<RenewalOrderInfo> renewalOrderInfoList= renewalOrderMapper.getRenewalOrderByOrderId(orderNo);
        return renewalOrderInfoList;
    }

    @Override
    public int deleteRenewalOrder(String userName) {
        return 0;
    }

    @Override
    public int updateRenewalOrder(HashMap infoMap) {
        return 0;
    }

    @Override
    public int addRenewalOrder(HashMap infoMap) {
        // result=1; 记录者应该是当前登录的用户，但这里有些问题。
        String  ID=idFactory.getUUID();
        infoMap.put("id",ID);

        String recordCreator=(String)infoMap.get("recordCreator");
        recordCreator="0";
        recordCreator = stuffMapper.queryIDByStuffNo(recordCreator);
        infoMap.put("recordCreator",recordCreator);

        String  orderNo=(String)infoMap.get("orderNo");
        String orderId = orderMapper.queryIDByOrderNo(orderNo);
        infoMap.put("orderId",orderId);

        infoMap.put("recordCreateTime",idFactory.getCurrentTime());
        renewalOrderMapper.insertRenewalOrderMap(infoMap);
        result=1;
        return result;
    }
}
