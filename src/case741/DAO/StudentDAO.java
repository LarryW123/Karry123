package case741.DAO;
import java.sql.*;
import java.util.ArrayList;
import case741.POJO.Student;

public interface StudentDAO {
  public ArrayList<Student> select(Student student) throws SQLException;//查询记录
  public ArrayList<Student> selectRnd(Student student) throws SQLException;//查询随机记录
  public int count(Student student) throws SQLException;//统计记录
  public int insert(Student student) throws SQLException;//添加记录
  public boolean update(Student student) throws SQLException;//更新全部记录
  public boolean updatePart(Student student) throws SQLException;//更新部分记录
  public boolean delete(Student student) throws SQLException;//删除记录
}