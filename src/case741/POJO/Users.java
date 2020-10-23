package case741.POJO;

import case741.POJO.Base;

public class Users extends Base{

  private static final long serialVersionUID = 1L;
  
  int id;
  int userId;
  String sequence;
  String nickName;
  String password;
  String role;
  String imgURL;
  
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public int getUserId() {
    return userId;
  }
  public void setUserId(int userId) {
    this.userId = userId;
  }
  public String getNickName() {
    return nickName;
  }
  public void setNickName(String nickName) {
    this.nickName = nickName;
  }
  public String getSequence() {
    return sequence;
  }
  public void setSequence(String sequence) {
    this.sequence = sequence;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getRole() {
    return role;
  }
  public void setRole(String role) {
    this.role = role;
  }
  public String getImgURL() {
    return imgURL;
  }
  public void setImgURL(String imgURL) {
    this.imgURL = imgURL;
  }

  public String toString() {
    return "Users [id=" + id + ", userId=" + userId + ", sequence=" + sequence + ", nickName=" + nickName
        + ", password=" + password + ", role=" + role + ", imgURL=" + imgURL + ", condition=" + condition
        + ", limit=" + limit + ", orderBy=" + orderBy + "]";
  }

}