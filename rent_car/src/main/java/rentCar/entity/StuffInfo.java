package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/26.
 */
public class StuffInfo {
    private String id;
    private String  stuffNo;
    private String stuffPassword;
    private String stuffName;
    private String stuffSex;
    private Integer stuffAge;
    private String  stuffId;
    private String  stuffTel;
    private String  stuffWorkplace;
    private String  stuffPost;
    private String  stuffEmail;
    private boolean stuffStatus;

    public String getStuffAddress() {
        return stuffAddress;
    }

    public void setStuffAddress(String stuffAddress) {
        this.stuffAddress = stuffAddress;
    }

    private String stuffAddress;
    private String  recordCreator;
    private Date recordCreateTime;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStuffNo() {
        return stuffNo;
    }

    public void setStuffNo(String stuffNo) {
        this.stuffNo = stuffNo;
    }

    public String getStuffPassword() {
        return stuffPassword;
    }

    public void setStuffPassword(String stuffPassword) {
        this.stuffPassword = stuffPassword;
    }

    public String getStuffName() {
        return stuffName;
    }

    public void setStuffName(String stuffName) {
        this.stuffName = stuffName;
    }

    public String getStuffSex() {
        return stuffSex;
    }

    public void setStuffSex(String stuffSex) {
        this.stuffSex = stuffSex;
    }

    public Integer getStuffAge() {
        return stuffAge;
    }

    public void setStuffAge(Integer stuffAge) {
        this.stuffAge = stuffAge;
    }

    public String getStuffId() {
        return stuffId;
    }

    public void setStuffId(String stuffId) {
        this.stuffId = stuffId;
    }

    public String getStuffTel() {
        return stuffTel;
    }

    public void setStuffTel(String stuffTel) {
        this.stuffTel = stuffTel;
    }

    public String getStuffWorkplace() {
        return stuffWorkplace;
    }

    public void setStuffWorkplace(String stuffWorkplace) {
        this.stuffWorkplace = stuffWorkplace;
    }

    public String getStuffPost() {
        return stuffPost;
    }

    public void setStuffPost(String stuffPost) {
        this.stuffPost = stuffPost;
    }

    public String getStuffEmail() {
        return stuffEmail;
    }

    public void setStuffEmail(String stuffEmail) {
        this.stuffEmail = stuffEmail;
    }

    public boolean isStuffStatus() {
        return stuffStatus;
    }

    public void setStuffStatus(boolean stuffStatus) {
        this.stuffStatus = stuffStatus;
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
