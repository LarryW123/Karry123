package case711;

import java.io.Serializable;

public class RegForm implements Serializable{
  
  private static final long serialVersionUID = 1L;
  
  public RegForm(){
    System.out.println("JavaBean正在初始化…");
  }
  
  private String userName;
  private String password;
  private String sex;
  private String hobby[];
  private String memo;

  //解决乱码问题
  public String getUserName(){
    try{ 
      return new String(userName.getBytes("ISO-8859-1"),"UTF-8");
    }
    catch(Exception e){
      return userName;
    }
  }
  public void setUserName(String userName){
    this.userName = userName;
  }
  
  public String getPassword(){
    return password;
  }
  public void setPassword(String password){
    this.password = password;
  }
  
  public String getSex(){
    return sex;
  }
  public void setSex(String sex){
    this.sex = sex;
  }
  
  public String[] getHobby(){
    return hobby;
  }
  public void setHobby(String[] hobby){
    this.hobby = hobby;
  }
  //hobby为数组，设置两套方法
  public String getHobby(int index){
    return hobby[index];
  }
  public void setHobby(int index,String hobby){
    this.hobby[index] = hobby;
  }
  
  public String getMemo(){
    return memo;
  }
  public void setMemo(String memo){
    this.memo = memo;
  }
  
}
