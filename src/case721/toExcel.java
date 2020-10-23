package case721;

import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFCell; 

public class toExcel {
	public void toxls(ResultSet rs) throws SQLException{ 
	  HSSFWorkbook wb = new HSSFWorkbook();//新建工作薄对象  
	  HSSFSheet sheet = wb.createSheet("学生基本信息表");//在工作薄中创建工作表
	  HSSFRow row = sheet.createRow(0);//在sheet中添加表头第0行
	  //定义各列
	  HSSFCell cell = row.createCell(0);  
	  cell.setCellValue("序号");
	  cell = row.createCell(1);
	  cell.setCellValue("学号");
	  cell = row.createCell(2);
	  cell.setCellValue("姓名");
	  cell = row.createCell(3);
	  cell.setCellValue("性别");
	  cell = row.createCell(4);
	  cell.setCellValue("出生日期");
	  cell = row.createCell(5);
	  cell.setCellValue("身份证号");
	  cell = row.createCell(6);
	  cell.setCellValue("民族");
	  cell = row.createCell(7);
	  cell.setCellValue("籍贯");
	  cell = row.createCell(8);  
	  cell.setCellValue("政治面貌");
	  cell = row.createCell(9);
	  cell.setCellValue("班级");
	  cell = row.createCell(10);
	  cell.setCellValue("相片");
	  //写入实体数据,实际应用中这些数据从数据库或记录结果集中得到
	  ResultSetMetaData rsmd=rs.getMetaData();
	  int i=1;
	  while(rs.next()){
	    row = sheet.createRow(i);
	    for(int j=1;j<=rsmd.getColumnCount();j++){
	    	cell = row.createCell(j-1);
	    	cell.setCellValue(rs.getString(j));
	    }
	    i++;
	  }
	  //将文件存到指定位置 
	  try{
	    FileOutputStream fout = new FileOutputStream("c:/学生基本信息表.xls");  
	    wb.write(fout);
	    fout.close();
	  }catch (Exception e){
	    e.printStackTrace();
	  }
	}
}
