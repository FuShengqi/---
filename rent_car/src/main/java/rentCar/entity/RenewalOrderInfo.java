package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/24.
 */
public class RenewalOrderInfo {
    private String id;
    private String orderId;
    private Date renewalStartDate;
    private Date renewalEndDate;
    private float renewalDeposit;
    private boolean renewalStatus;
    private String recordCreator;
    private Date recordCreateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Date getRenewalStartDate() {
        return renewalStartDate;
    }

    public void setRenewalStartDate(Date renewalStartDate) {
        this.renewalStartDate = renewalStartDate;
    }

    public Date getRenewalEndDate() {
        return renewalEndDate;
    }

    public void setRenewalEndDate(Date renewalEndDate) {
        this.renewalEndDate = renewalEndDate;
    }

    public float getRenewalDeposit() {
        return renewalDeposit;
    }

    public void setRenewalDeposit(float renewalDeposit) {
        this.renewalDeposit = renewalDeposit;
    }

    public boolean isRenewalStatus() {
        return renewalStatus;
    }

    public void setRenewalStatus(boolean renewalStatus) {
        this.renewalStatus = renewalStatus;
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
