package rentCar.service;


import rentCar.entity.LicenseInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/27.
 */
public interface LicenseService {
    List<LicenseInfo> findAll();
    LicenseInfo queryLicense(String licenseNo);
    int deleteLicense(String userName);
    int updateLicense(HashMap infoMap);
    int addLicense(HashMap infoMap);

}
