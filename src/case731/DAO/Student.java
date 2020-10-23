package case731.DAO;

public class Student{
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
  String condition;
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
  public String getCondition() {
    return condition;
  }
  public void setCondition(String condition) {
    this.condition = condition;
  }
  /**
   * 牢记一点：
   * 除了定义geXXX()和setXXX()，我们也顺便为该类定义一个toString()
   * 以后调试程序时，利用该方法查看传输的数据
   */
  public String toString() {
    return "Student [id=" + id + ", sequence=" + sequence + ", name="
        + name + ", sex=" + sex + ", birthday=" + birthday + ", card="
        + card + ", political=" + political + ", nation=" + nation
        + ", nativePlace=" + nativePlace + ", className=" + className
        + ", condition=" + condition + "]";
  }
  
}