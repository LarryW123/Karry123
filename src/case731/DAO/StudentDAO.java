package case731.DAO;
import java.sql.*;
import java.util.ArrayList;
import case731.DAO.Student;

public interface StudentDAO {
  public ArrayList<Student> select(Student student) throws SQLException, ClassNotFoundException;//查询
  public boolean insert(Student student) throws SQLException;//添加
  public boolean delete(Student student) throws SQLException;//删除
  public boolean update(Student student) throws SQLException;//修改
}