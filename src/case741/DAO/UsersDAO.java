package case741.DAO;
import java.sql.*;
import java.util.ArrayList;
import case741.POJO.Users;

public interface UsersDAO {
  public ArrayList<Users> select(Users users) throws SQLException;//查询记录
  public int count(Users users) throws SQLException;//统计记录
  public boolean insert(Users users) throws SQLException;//添加记录
  public boolean updatePart(Users users) throws SQLException;//更新部分记录
  public boolean delete(Users users) throws SQLException;//删除记录(按id)
  public boolean deleteByUserId(Users users) throws SQLException;//删除记录(按UserId)
}