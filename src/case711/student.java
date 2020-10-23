package case711;

import java.io.Serializable;

public class student implements Serializable {
	
  private static final long serialVersionUID = 1L;
  
  private String sequence = "20070100203";
  private String name = "张三";
  private String sex = "男";
  private String birthday = "2000-1-1"; 
  
  public student() {
	  System.out.println("JavaBean初始化…");
  }
  
  public String getSequence() {
	  return sequence;
  }
  public void setSequence(String sequence) {
	  this.sequence=sequence;
  }
  
  public String getName() {
	  return name;
  }
  public void setName(String name) {
	  this.name= name;
  }
  
  public String getSex() {
	  return sex;
  }
  public void setSex(String sex) {
	  this.sex= sex;
  }
  
  public String getBirthday() {
	  return birthday;
  }
  public void setBirthday(String birthday) {
	  this.birthday = birthday;
  }
}
