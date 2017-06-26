package rentCar.entity;

import java.util.Date;

/**
 * Created by xpb on 2017/6/24.
 */
public class StoreInfo {
    private String  id;
    private String  storeNo;
    private String  storeAddress;
    private String  storeTel;
    private String  storeOpenHours;
    private boolean storeStatus;
    private String  recordCreator;
    private Date recordCreateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStoreNo() {
        return storeNo;
    }

    public void setStoreNo(String storeNo) {
        this.storeNo = storeNo;
    }

    public String getStoreAddress() {
        return storeAddress;
    }

    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
    }

    public String getStoreTel() {
        return storeTel;
    }

    public void setStoreTel(String storeTel) {
        this.storeTel = storeTel;
    }

    public String getStoreOpenHours() {
        return storeOpenHours;
    }

    public void setStoreOpenHours(String storeOpenHours) {
        this.storeOpenHours = storeOpenHours;
    }

    public boolean isStoreStatus() {
        return storeStatus;
    }

    public void setStoreStatus(boolean storeStatus) {
        this.storeStatus = storeStatus;
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
