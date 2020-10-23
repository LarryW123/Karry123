package case741.ServiceDAO;

import case741.POJO.JsonResultSet;
import case741.POJO.Student;

public interface StudentServiceDAO {
  public JsonResultSet selectByPage(Student student);//查询业务
  public JsonResultSet selectRnd(Student student);//显示随机记录的业务
  public boolean insert(Student student);//添加业务
  public boolean delete(Student student);//删除业务
  public boolean update(Student student);//修改业务
}
