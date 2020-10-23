package case742.com.serviceDAO;

import case742.com.pojo.JsonRS;
import case742.com.pojo.User;

public interface UserServiceDAO {
  public JsonRS selectByPage(User user);//查询业务
  public boolean insert(User user);//添加业务
  public boolean delete(User user);//删除业务
  public boolean update(User user);//修改业务
}
