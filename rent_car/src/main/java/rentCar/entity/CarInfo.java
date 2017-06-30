package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/24.
 */
public class CarInfo {
    private String  id;
    private String modelInfoId;
    private String carNo;
    private String carColor;
    private Date   carBuyDate;
    private String carEngineNo;
    private String carFrameNo;
    private boolean carStatus;
    private String carStoreId;
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

    public String getCarNo() {
        return carNo;
    }

    public void setCarNo(String carNo) {
        this.carNo = carNo;
    }

    public String getCarColor() {
        return carColor;
    }

    public void setCarColor(String carColor) {
        this.carColor = carColor;
    }

    public Date getCarBuyDate() {
        return carBuyDate;
    }

    public void setCarBuyDate(Date carBuyDate) {
        this.carBuyDate = carBuyDate;
    }

    public String getCarEngineNo() {
        return carEngineNo;
    }

    public void setCarEngineNo(String carEngineNo) {
        this.carEngineNo = carEngineNo;
    }

    public String getCarFrameNo() {
        return carFrameNo;
    }

    public void setCarFrameNo(String carFrameNo) {
        this.carFrameNo = carFrameNo;
    }

    public boolean isCarStatus() {
        return carStatus;
    }

    public void setCarStatus(boolean carStatus) {
        this.carStatus = carStatus;
    }

    public String getCarStoreId() {
        return carStoreId;
    }

    public void setCarStoreId(String carStoreId) {
        this.carStoreId = carStoreId;
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
