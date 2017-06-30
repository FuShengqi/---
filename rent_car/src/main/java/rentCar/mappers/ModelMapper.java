package rentCar.mappers;

import org.apache.ibatis.annotations.Param;
import rentCar.entity.CustomerInfo;
import rentCar.entity.ModelInfo;

import java.util.HashMap;
import java.util.List;

/**
 * Created by xpb on 2017/6/25.
 */
public interface ModelMapper {
    ModelInfo getModelByModelNname(String modelName);
    String queryIDByModelName(String modelName);
    String queryModelNameById(String modelInfoId);
    ModelInfo queryModelById(String modelInfoId);
    List<ModelInfo> findAll();
    void  insertModelMap(HashMap infoMap);
    void  insertModel(ModelInfo customerInfo);
    void deleteModel(String id);
    void  updateModelInfo(HashMap infoMap);
    Integer count();
}
