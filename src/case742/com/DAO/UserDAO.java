package case742.com.DAO;
import java.sql.*;
import java.util.ArrayList;

import case742.com.pojo.User;

public interface UserDAO {
  public ArrayList<User> select(User user) throws SQLException, ClassNotFoundException;//查询
  public int count(User user) throws SQLException, ClassNotFoundException;//统计
  public boolean insert(User user) throws SQLException;//添加
  public boolean delete(User User) throws SQLException;//删除
  public boolean update(User user) throws SQLException;//修改
}