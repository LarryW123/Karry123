package case741.DAO;

import java.sql.*;
import java.util.ArrayList;
import case741.POJO.Student;

public class StudentDAOimpl implements StudentDAO {
  private Connection conn = null;
  private PreparedStatement pst = null;
  /**
   * 定义无参构造函数
   */
  public StudentDAOimpl() {
    super();
  }
  /**
   * 定义带参构造函数，实例化的时候完成连接的注入
   */
  public StudentDAOimpl(Connection conn) {
    super();
    this.conn = conn;
  }
  
  /**
   * 查询记录
   */
  public ArrayList<Student> select(Student student) throws SQLException {
    String sql = "select id,sequence,name,sex,birthday,card,"
	  		   + "nation,nativePlace,political,className "
    		   + "from student where 1=1 ";
    //查询
    String condition = student.getCondition();
    if(condition != null && ! condition.equals("")){
      sql += " and " + condition;
    }
    //排序
    String orderBy = student.getOrderBy();
    if(orderBy != null && ! orderBy.equals("")){
      sql += orderBy;
    }
    //分页
    String limit = student.getLimit();
    if(limit != null && ! limit.equals("")){
      sql += limit;
    }
    pst = conn.prepareStatement(sql);
    ResultSet rs = pst.executeQuery();
    ArrayList<Student> studentList = new ArrayList<Student>();
    if(rs.next()){
      for(int i=0;i<=rs.getRow();i++){
        Student temp = new Student();
        temp.setId(rs.getInt("id"));
        temp.setSequence(rs.getString("sequence"));
        temp.setName(rs.getString("name"));
        temp.setSex(rs.getString("sex"));
        temp.setBirthday(rs.getString("birthday"));
        temp.setCard(rs.getString("card"));
        temp.setPolitical(rs.getString("political"));
        temp.setNation(rs.getString("nation"));
        temp.setNativePlace(rs.getString("nativePlace"));
        temp.setClassName(rs.getString("className"));
        studentList.add(temp);
        rs.next();
      }
    }
    return studentList;
  }
  
  /**
   * 查询随机记录(用于首页)
   */
  public ArrayList<Student> selectRnd(Student student) throws SQLException {
	  String sql = "select student.id as id,student.sequence as sequence,"
	  		     + "student.name as name,student.className as className,"
	  		     + "user.imgURL as imgURL,rand() as rnd "
	  		     + "from student inner join user "
	  		     + "on student.id = user.userId "
	  		     + "order by rnd "
	  		     + "limit 0,12";
	  pst = conn.prepareStatement(sql);
	  ResultSet rs = pst.executeQuery();
	  ArrayList<Student> studentList = new ArrayList<Student>();
	  if(rs.next()){
		  for(int i=0;i<=rs.getRow();i++){
			  Student temp = new Student();
			  temp.setId(rs.getInt("id"));
			  temp.setSequence(rs.getString("sequence"));
			  temp.setName(rs.getString("name"));
			  temp.setClassName(rs.getString("className"));
			  temp.setImgURL(rs.getString("imgURL"));
			  studentList.add(temp);
			  rs.next();
		  }
	  }
	  return studentList;
  }
  
  /**
   * 统计记录
   */
  public int count(Student student) throws SQLException {
    String sql = "select count(*) as cnt from student where 1=1";
    String condition = student.getCondition();
    if(condition!=null && !condition.equals("")){
      sql+=" and " + condition;
    }
    pst = conn.prepareStatement(sql);
    ResultSet rs = pst.executeQuery();
    rs.next();
    int cnt = Integer.parseInt(rs.getString("cnt"));
    return cnt;
  }

  /**
   * 插入记录
   */  
  public int insert(Student student) throws SQLException {
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
      //获取新插入记录的id,用于向user表中插入记录
      sql ="select last_insert_id()";
      pst = conn.prepareStatement(sql);
      ResultSet rs = pst.executeQuery();
      rs.next();
      int id = rs.getInt(1);
      return id;
    }catch(Exception e){
      return 0;
    }
  }
  
  /**
   * 更新全部记录
   */
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
  
  /**
   * 更新部分记录
   */
  public boolean updatePart(Student student) throws SQLException {
    try{
      int cnt = 0;
      String sql = "update student set ";
      if(student.getSequence() != null && !student.getSequence().equals("")){
        sql += "sequence="+student.getSequence()+",";
        cnt++;
      }
      if(student.getName() != null && !student.getName().equals("")){
        sql += "name="+student.getName();
        cnt++;
      }
      if(student.getSex() != null && !student.getSex().equals("")){
        sql += "sex="+student.getSex();
        cnt++;
      }
      if(student.getBirthday() != null && !student.getBirthday().equals("")){
        sql += "birthday="+student.getBirthday()+",";
      }
      if(student.getCard() != null && !student.getCard().equals("")){
        sql += "card="+student.getCard()+",";
        cnt++;
      }
      if(student.getPolitical() != null && !student.getPolitical().equals("")){
        sql += "political="+student.getPolitical()+",";
        cnt++;
      }
      if(student.getNation() != null && !student.getNation().equals("")){
        sql += "nation="+student.getNation()+",";
        cnt++;
      }
      if(student.getNativePlace() != null && !student.getNativePlace().equals("")){
        sql += "nativePlace="+student.getNativePlace()+",";
        cnt++;
      }
      if(student.getClassName() != null && !student.getClassName().equals("")){
        sql += "className="+student.getClassName()+",";
        cnt++;
      }
      
      if(cnt > 0){
        sql = sql.substring(0,sql.length()-1);//去掉最后一个逗号
        sql += "where 1=1 ";//开始拼接条件
        if(student.getId()+"" != ""){
          sql += "and id="+student.getId();
        }
      }
      
      pst = conn.prepareStatement(sql);
      pst.executeUpdate();
      conn.commit();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
  /**
   * 删除记录
   */
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
