package case742.com.pojo;

public class User extends Base{
  int id;
  String userId;
  String name;
  String password;
  int role;
  String qq;
  String email;
  String phone;
  String address;
  
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public String getUserId() {
    return userId;
  }
  public void setUserId(String userId) {
    this.userId = userId;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public int getRole() {
    return role;
  }
  public void setRole(int role) {
    this.role = role;
  }
  public String getQq() {
    return qq;
  }
  public void setQq(String qq) {
    this.qq = qq;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getPhone() {
    return phone;
  }
  public void setPhone(String phone) {
    this.phone = phone;
  }
  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }

  public String toString() {
    return "User [id=" + id + ", userId=" + userId + ", name=" + name
        + ", password=" + password + ", role=" + role + ", qq=" + qq
        + ", email=" + email + ", phone=" + phone + ", address=" + address
        + "]";
  }
  
  public User(int id, String userId, String name, String password, int role,
      String qq, String email, String phone, String address) {
    super();
    this.id = id;
    this.userId = userId;
    this.name = name;
    this.password = password;
    this.role = role;
    this.qq = qq;
    this.email = email;
    this.phone = phone;
    this.address = address;
  }
  
  public User() {
    super();
  }

}
