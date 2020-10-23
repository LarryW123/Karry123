package case742.com.pojo;

import java.util.*;

public class JsonRS {

  int total;//记录数
  private List rows = new ArrayList(0);//记录集
  
  public int gettotal() {
    return total;
  }
  public void settotal(int total) {
    this.total = total;
  }
  public List getRows() {
    return rows;
  }
  public void setRows(List rows) {
    this.rows = rows;
  }
  
  public String toString() {
    return "JsonRS [total=" + total + ", rows=" + rows + "]";
  }

  public JsonRS(int total,List datas){
	  this.total = total;
	  this.rows.addAll(datas);
  }
  
  public JsonRS() {
    super();
  }
  
}
