package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/24.
 */
public class RentPriceInfo {
    private String id;
    private String modelInfoId;
    private float deposit;
    private float pricePerDay;
    private float pricePerKm;
    private float priceOverAnhour;
    private float priceOverKm;
    private boolean rentStatus;
    private String recordCreator;
    private Date recordCreateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getModelInfoId() {
        return modelInfoId;
    }

    public void setModelInfoId(String modelInfoId) {
        this.modelInfoId = modelInfoId;
    }

    public float getDeposit() {
        return deposit;
    }

    public void setDeposit(float deposit) {
        this.deposit = deposit;
    }

    public float getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(float pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public float getPricePerKm() {
        return pricePerKm;
    }

    public void setPricePerKm(float pricePerKm) {
        this.pricePerKm = pricePerKm;
    }

    public float getPriceOverAnhour() {
        return priceOverAnhour;
    }

    public void setPriceOverAnhour(float priceOverAnhour) {
        this.priceOverAnhour = priceOverAnhour;
    }

    public float getPriceOverKm() {
        return priceOverKm;
    }

    public void setPriceOverKm(float priceOverKm) {
        this.priceOverKm = priceOverKm;
    }

    public boolean isRentStatus() {
        return rentStatus;
    }

    public void setRentStatus(boolean rentStatus) {
        this.rentStatus = rentStatus;
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
