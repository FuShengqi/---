package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/24.
 */
public class ViolateInfo {
    private String  id;
    private String  carId;
    private Date  violateDate;
    private String  violateEvent;
    private float  violateFee;
    private boolean  violateStatus;
    private String  recordCreator;
    private Date recordCreateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public Date getViolateDate() {
        return violateDate;
    }

    public void setViolateDate(Date violateDate) {
        this.violateDate = violateDate;
    }

    public String getViolateEvent() {
        return violateEvent;
    }

    public void setViolateEvent(String violateEvent) {
        this.violateEvent = violateEvent;
    }

    public float getViolateFee() {
        return violateFee;
    }

    public void setViolateFee(float violateFee) {
        this.violateFee = violateFee;
    }

    public boolean isViolateStatus() {
        return violateStatus;
    }

    public void setViolateStatus(boolean violateStatus) {
        this.violateStatus = violateStatus;
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
