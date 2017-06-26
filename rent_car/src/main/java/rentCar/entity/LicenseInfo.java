package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/24.
 */
public class LicenseInfo {
    private String  id;
    private String  licenseNo;
    private String  licenceType;
    private Integer licenceAges ;
    private Date    licenceStartDate;
    private Date    licenceInvalidDate;
    private boolean licenceStatus;
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

    public String getLicenceType() {
        return licenceType;
    }

    public void setLicenceType(String licenceType) {
        this.licenceType = licenceType;
    }

    public Integer getLicenceAges() {
        return licenceAges;
    }

    public void setLicenceAges(Integer licenceAges) {
        this.licenceAges = licenceAges;
    }

    public Date getLicenceStartDate() {
        return licenceStartDate;
    }

    public void setLicenceStartDate(Date licenceStartDate) {
        this.licenceStartDate = licenceStartDate;
    }

    public Date getLicenceInvalidDate() {
        return licenceInvalidDate;
    }

    public void setLicenceInvalidDate(Date licenceInvalidDate) {
        this.licenceInvalidDate = licenceInvalidDate;
    }

    public boolean isLicenceStatus() {
        return licenceStatus;
    }

    public void setLicenceStatus(boolean licenceStatus) {
        this.licenceStatus = licenceStatus;
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
