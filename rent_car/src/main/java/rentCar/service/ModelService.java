package rentCar.service;



import rentCar.entity.ModelInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/27.
 */
public interface ModelService {
    List<ModelInfo> findAll();
    ModelInfo queryModel(String violateNo);
    int deleteModel(String userName);
    int updateModel(HashMap infoMap);
    int addModel(HashMap infoMap);

}
