package case732;

import java.util.ArrayList;
import case732.Student;

public interface StudentServiceDAO {
  public ArrayList<Student> select(Student student);//查询业务
  public boolean insert(Student student);//添加业务
  public boolean delete(Student student);//删除业务
  public boolean update(Student student);//修改业务
}
