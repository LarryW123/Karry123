package case741.ServiceDAO;

import case741.POJO.JsonResultSet;
import case741.POJO.Users;

public interface UsersServiceDAO {
  public JsonResultSet checkUser(Users users);//账号验证业务
  public boolean insert(Users users);//添加业务
  public boolean delete(Users users);//删除业务
  public boolean updatePassword(Users users);//修改业务
}