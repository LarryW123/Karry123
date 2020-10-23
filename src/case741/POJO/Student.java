package case741.POJO;

import case741.POJO.Base;
/**
 * 此处所有的属性都是跟数据库一致，包括字段名，数据类型
 * 以后所有的POJO类都继承Base，就不用再考虑where、limit、order by的问题了
 */
public class Student extends Base{

  private static final long serialVersionUID = 1L;
  
  int id;
  String sequence;
  String name;
  String sex;
  String birthday;//为数据处理方便，数据库中的日期/时间型数据都用String来定义
  String card;
  String political;
  String nation;
  String nativePlace;
  String className;
  
  String imgURL;//非student表中字段，但实际业务中需要用到

  public int getId() {
    return id;
  }
  
  public void setId(int id) {
    this.id = id;
  }
  
  public String getSequence() {
    return sequence;
  }
  
  public void setSequence(String sequence) {
    this.sequence = sequence;
  }
  
  public String getName() {
    return name;
  }
  
  public void setName(String name) {
    this.name = name;
  }
  
  public String getSex() {
    return sex;
  }
  
  public void setSex(String sex) {
    this.sex = sex;
  }
  
  public String getBirthday() {
    return birthday;
  }
  
  public void setBirthday(String birthday) {
    this.birthday = birthday;
  }
  
  public String getCard() {
    return card;
  }
  
  public void setCard(String card) {
    this.card = card;
  }
  
  public String getPolitical() {
    return political;
  }
  
  public void setPolitical(String political) {
    this.political = political;
  }
  
  public String getNation() {
    return nation;
  }
  
  public void setNation(String nation) {
    this.nation = nation;
  }
  
  public String getNativePlace() {
    return nativePlace;
  }
  
  public void setNativePlace(String nativePlace) {
    this.nativePlace = nativePlace;
  }
  
  public String getClassName() {
    return className;
  }
  
  public void setClassName(String className) {
    this.className = className;
  }
  
  public String getImgURL() {
    return imgURL;
  }
  
  public void setImgURL(String imgURL) {
    this.imgURL = imgURL;
  }
  
  public String toString() {
    return "Student [id=" + id + ", sequence=" + sequence + ", name=" + name + ", sex=" + sex + ", birthday=" + birthday
        + ", card=" + card + ", political=" + political + ", nation=" + nation + ", nativePlace=" + nativePlace
        + ", className=" + className + ", imgURL=" + imgURL + ", condition=" + condition + ", limit=" + limit
        + ", orderBy=" + orderBy + "]";
  }

}