package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/24.
 */
public class OrderInfo {
    private String id;
    private String orderNo;
    private String carId;
    private String licenseId;
    private String customerId;
    private Date orderStartDate;
    private Date returnDateInPlan;
    private Date returnDateInActual;
    private float orderStartMiles;
    private float orderEndMiles;
    private float basicConsume;
    private float timeoutConsume;
    private float kmoutConsume;
    private float discountAmount;
    private float rentDeposit;
    private float  violateDeposit;
    private float  damageDeposit;
    private float  violateDeductions;
    private float  damageDeductions;
    private float  totalConsume;
    private float orderStatus;
    private String  recordCreator;
    private Date recordCreateTime;
    public float getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(float orderStatus) {
        this.orderStatus = orderStatus;
    }


    public float getTotalConsume() {
        return totalConsume;
    }

    public void setTotalConsume(float totalConsume) {
        this.totalConsume = totalConsume;
    }



    public float getViolateDeposit() {
        return violateDeposit;
    }

    public void setViolateDeposit(float violateDeposit) {
        this.violateDeposit = violateDeposit;
    }

    public float getViolateDeductions() {
        return violateDeductions;
    }

    public void setViolateDeductions(float violateDeductions) {
        this.violateDeductions = violateDeductions;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getLicenseId() {
        return licenseId;
    }

    public void setLicenseId(String licenseId) {
        this.licenseId = licenseId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public Date getOrderStartDate() {
        return orderStartDate;
    }

    public void setOrderStartDate(Date orderStartDate) {
        this.orderStartDate = orderStartDate;
    }

    public Date getReturnDateInPlan() {
        return returnDateInPlan;
    }

    public void setReturnDateInPlan(Date returnDateInPlan) {
        this.returnDateInPlan = returnDateInPlan;
    }

    public Date getReturnDateInActual() {
        return returnDateInActual;
    }

    public void setReturnDateInActual(Date returnDateInActual) {
        this.returnDateInActual = returnDateInActual;
    }

    public float getOrderStartMiles() {
        return orderStartMiles;
    }

    public void setOrderStartMiles(float orderStartMiles) {
        this.orderStartMiles = orderStartMiles;
    }

    public float getOrderEndMiles() {
        return orderEndMiles;
    }

    public void setOrderEndMiles(float orderEndMiles) {
        this.orderEndMiles = orderEndMiles;
    }

    public float getBasicConsume() {
        return basicConsume;
    }

    public void setBasicConsume(float basicConsume) {
        this.basicConsume = basicConsume;
    }

    public float getTimeoutConsume() {
        return timeoutConsume;
    }

    public void setTimeoutConsume(float timeoutConsume) {
        this.timeoutConsume = timeoutConsume;
    }

    public float getKmoutConsume() {
        return kmoutConsume;
    }

    public void setKmoutConsume(float kmoutConsume) {
        this.kmoutConsume = kmoutConsume;
    }

    public float getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(float discountAmount) {
        this.discountAmount = discountAmount;
    }

    public float getRentDeposit() {
        return rentDeposit;
    }

    public void setRentDeposit(float rentDeposit) {
        this.rentDeposit = rentDeposit;
    }



    public float getDamageDeposit() {
        return damageDeposit;
    }

    public void setDamageDeposit(float damageDeposit) {
        this.damageDeposit = damageDeposit;
    }



    public float getDamageDeductions() {
        return damageDeductions;
    }

    public void setDamageDeductions(float damageDeductions) {
        this.damageDeductions = damageDeductions;
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
