package case731.DAO;
import java.sql.*;
import java.util.ArrayList;

public class StudentDAOimpl implements StudentDAO {
  private Connection conn = null;
  private PreparedStatement pst = null;
  /**
   * 定义构造方法，实例化的时候完成连接的注入
   */
  public StudentDAOimpl(Connection conn) {
    super();
    this.conn = conn;
  }
  
  //查询记录
  public ArrayList<Student> select(Student student) throws SQLException {
	String sql = "select * from student where 1=1";
    String condition = student.getCondition();
    if(condition != null && !condition.equals("")){
      sql += " and " + condition;
    }
    pst = conn.prepareStatement(sql);
    ResultSet rs = pst.executeQuery();
    ArrayList<Student> studentList = new ArrayList<Student>();
    if(rs.next()){
      for(int i=0;i<=rs.getRow();i++){
        Student stuTmp = new Student();
        stuTmp.setId(rs.getInt("id"));
        stuTmp.setSequence(rs.getString("sequence"));
        stuTmp.setName(rs.getString("name"));
        stuTmp.setSex(rs.getString("sex"));
        stuTmp.setBirthday(rs.getString("birthday"));
        stuTmp.setCard(rs.getString("card"));
        stuTmp.setPolitical(rs.getString("political"));
        stuTmp.setNation(rs.getString("nation"));
        stuTmp.setNativePlace(rs.getString("nativePlace"));
        stuTmp.setClassName(rs.getString("className"));
        studentList.add(stuTmp);
        rs.next();
      }
    }
    return studentList;
  }

  //插入记录
  public boolean insert(Student student) throws SQLException {
    try{
      String sql = "insert into student(sequence,name,sex,birthday,card,political,nation,nativePlace,className) values(?,?,?,?,?,?,?,?,?) ";
      pst = conn.prepareStatement(sql);
      pst.setString(1, student.getSequence());
      pst.setString(2, student.getName());
      pst.setString(3, student.getSex());
      pst.setString(4, student.getBirthday());
      pst.setString(5, student.getCard());
      pst.setString(6, student.getPolitical());
      pst.setString(7, student.getNation());
      pst.setString(8, student.getNativePlace());
      pst.setString(9, student.getClassName());
      pst.executeUpdate();
      conn.commit();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
  //更新记录
  public boolean update(Student student) throws SQLException {
    try{
      String sql = "update student set sequence=?,name=?,sex=?,birthday=?,card=?,political=?,nation=?,nativePlace=?,className=? where id=?";
      pst = conn.prepareStatement(sql);
      pst.setString(1, student.getSequence());
      pst.setString(2, student.getName());
      pst.setString(3, student.getSex());
      pst.setString(4, student.getBirthday());
      pst.setString(5, student.getCard());
      pst.setString(6, student.getPolitical());
      pst.setString(7, student.getNation());
      pst.setString(8, student.getNativePlace());
      pst.setString(9, student.getClassName());
      pst.setInt(10, student.getId());
      pst.executeUpdate();
      conn.commit();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
  //删除记录
  public boolean delete(Student student) throws SQLException {
    try{
      String sql = "delete from student where id=?";
      pst = conn.prepareStatement(sql);
      pst.setInt(1, student.getId());
      pst.executeUpdate();
      conn.commit();
      return true;
    }catch(Exception e){
      return false;
    }
  }

}
