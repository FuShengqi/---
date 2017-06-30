package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/24.
 */
public class ModelInfo {
    private String id;
    private String modelType;
    private String modelName;
    private String modelRetailer;
    private Integer modelSeatNum;
    private Integer modelFuelTank;
    private boolean modelStatus;
    private String  recordCreator;
    private Date recordCreateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getModelType() {
        return modelType;
    }

    public void setModelType(String modelType) {
        this.modelType = modelType;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getModelRetailer() {
        return modelRetailer;
    }

    public void setModelRetailer(String modelRetailer) {
        this.modelRetailer = modelRetailer;
    }

    public Integer getModeSeatNum() {
        return modelSeatNum;
    }

    public void setModeSeatNum(Integer modeSeatNum) {
        this.modelSeatNum = modeSeatNum;
    }

    public Integer getModelFuelTank() {
        return modelFuelTank;
    }

    public void setModelFuelTank(Integer modelFuelTank) {
        this.modelFuelTank = modelFuelTank;
    }

    public boolean isModelStatus() {
        return modelStatus;
    }

    public void setModelStatus(boolean modelStatus) {
        this.modelStatus = modelStatus;
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
