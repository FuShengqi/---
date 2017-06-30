package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/24.
 */
public class LicenseInfo {
    private String  id;
    private String  licenseNo;
    private String  licenseType;

    public Integer getLicenseAges() {
        return licenseAges;
    }

    public void setLicenseAges(Integer licenseAges) {
        this.licenseAges = licenseAges;
    }

    private Integer licenseAges ;
    private Date    licenseStartDate;
    private Date    licenseInvalidDate;
    private boolean licenseStatus;
    private String  recordCreator;
    private Date recordCreateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLicenseNo() {
        return licenseNo;
    }

    public void setLicenseNo(String licenseNo) {
        this.licenseNo = licenseNo;
    }

    public String getRecordCreator() {
        return recordCreator;
    }

    public void setRecordCreator(String recordCreator) {
        this.recordCreator = recordCreator;
    }

    public Date getRecordCreateTime() {
        return recordCreateTime;
    }

    public void setRecordCreateTime(Date recordCreateTime) {
        this.recordCreateTime = recordCreateTime;
    }
}
