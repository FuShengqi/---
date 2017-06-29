package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.CustomerInfo;
import rentCar.entity.LicenseInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/25.
 */
public interface LicenseMapper {
    LicenseInfo getLicenseByNo(String licenseNo);
    String queryIDByLicenseNo(String licenseNo);
    List<LicenseInfo> findAll();
    void  insertLicenseMap(HashMap infoMap);
    void  insertLicense(LicenseInfo licenseInfo);
    void deleteLicense(String id);
    void  updateLicenseInfo(HashMap infoMap);
    Integer count();
}
