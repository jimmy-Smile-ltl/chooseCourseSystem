package readFromDB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import classes.Students;
import classes.DB;
import classes.Students;

public class GetStudent {
	public static void main(String[] args) throws SQLException {
		 System.out.println("已选读课程");
		 List<String> selected= GetSelcted("null");
		 System.out.println("已修读课程");
		 List<String> learned=GetLearned("null");
		 System.out.println("返回值验证");
		 System.out.println(selected.toString());
		 System.out.println(learned.toString());
		 System.out.println(selected.contains("a025"));
		 System.out.println(beizhu("null","a025"));
	}

   // 读取全部课程
	public List<Students> getByTableName(String tablename) throws SQLException {
		Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String sql="";
	    List<Students> studentList=new ArrayList<Students>();
		try { 
			studentList=new ArrayList<Students>();
			conn=DB.GetConnection();
			stmt =conn.createStatement();
			sql="select * from "+tablename;
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Students tempStudents=new Students();
				tempStudents.setStuId(rs.getString("Sno"));
				tempStudents.setStuName(rs.getString("Sname"));
				tempStudents.setStuGrage(rs.getString("Sgrade"));
				tempStudents.setStuProfess(rs.getString("Sdept"));
				tempStudents.setStuInstitute(rs.getString("Saca"));
				tempStudents.setStuPwd(rs.getString("Spswd"));
				tempStudents.setStuPhhone(rs.getString("Sphone"));	
				tempStudents.setStuCourselearned(rs.getString("sclno"));
				studentList.add(tempStudents);
			}
	         rs.close();
	         stmt.close();
	         conn.close();
	     } 
	    
	     catch (SQLException e) {
	         e.printStackTrace();
	         System.out.println("无法连接数据库");
	     }
	     catch(Exception e){
	         // 处理 Class.forName 错误
	         e.printStackTrace();
	     }
		return studentList;
		}
	
	public  Students getBySno(String sno) throws SQLException {
		Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String sql="";
	    Students stu=new Students();
		try { 
	
			conn=DB.GetConnection();
			stmt =conn.createStatement();
			sql="select * from  student where sno like '%"+sno+"%'";
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Students tempStudents=new Students();
				tempStudents.setStuId(rs.getString("Sno"));
				tempStudents.setStuName(rs.getString("Sname"));
				tempStudents.setStuGrage(rs.getString("Sgrade"));
				tempStudents.setStuProfess(rs.getString("Sdept"));
				tempStudents.setStuInstitute(rs.getString("Saca"));
				tempStudents.setStuPwd(rs.getString("Spswd"));
				tempStudents.setStuPhhone(rs.getString("Sphone"));	
				tempStudents.setStuCourselearned(rs.getString("sclno"));
				stu=tempStudents;
			}
	         rs.close();
	         stmt.close();
	         conn.close();
	     } 
	    
	     catch (SQLException e) {
	         e.printStackTrace();
	         System.out.println("无法连接数据库");
	     }
	     catch(Exception e){
	         // 处理 Class.forName 错误
	         e.printStackTrace();
	     }
		return stu;
		}
	
	// 获取已经修读的课程
	public static List<String>  GetLearned(String sno) throws SQLException {
		Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String sql="";
    	List<String> result=new ArrayList<String>();;//返回信息
		try { 
		
			conn=DB.GetConnection();
			stmt =conn.createStatement();
			sql="select * from student where sno like '%"+sno+"%'";
			rs=stmt.executeQuery(sql);
		
			if(rs.next()){
				String sclno=rs.getString("sclno").trim();
				if (sclno=="-") {// 没有学过什么课
					result.add("-");
				}
				else {
					for(int i=0;i<sclno.trim().split("、").length;i++) {
						//System.out.print(sclno.split("、")[i]+"\t");
						result.add(sclno.split("、")[i]);
					}
						//System.out.println("共计"+sclno.split("、").length);
						
				}
			}
	   
	     } 
	
	    
	     catch (SQLException e) {
	         e.printStackTrace();
	         System.out.println("无法连接数据库");
	     }
	     catch(Exception e){
	         // 处理 Class.forName 错误
	         e.printStackTrace();
	     }
	      rs.close();
         stmt.close();
         conn.close();
		return result;
		
		
	}
	// 获取已经选择的课程	
	public static  List<String> GetSelcted(String sno) throws SQLException{
	Connection conn = null;
    Statement stmt = null;
    ResultSet rs= null;
    List<String> result =new ArrayList<String>();
    try{
    	
    	 conn=DB.GetConnection();
    	 stmt=conn.createStatement();
    	 String sql = "select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='term_project' and TABLE_NAME like '%"+sno+"_course%'";
         rs = stmt.executeQuery(sql);// 返回查询结果
         if(rs.next()) {
        	 sql="select * from " +sno+"_course";
        	 rs = stmt.executeQuery(sql);// 返回查询结果
        	 int number=0;//记录课程数量
        	  while(rs.next()) {
        		  number++;
        		  String Cno=rs.getString("Cno");
//        		  System.out.print(Cno+"\t");
        		  result.add(Cno.trim());
        	
        	  }
//        	  System.out.println("共计"+number);
        	  
        	 
         }
         
//         完成后关闭
        rs.close();
        stmt.close();
        conn.close();
    }catch(SQLException se){
        // 处理 JDBC 错误
        se.printStackTrace();
    }catch(Exception e){
        // 处理 Class.forName 错误
        e.printStackTrace();
    }
	return result;
    
	}
	public static String beizhu(String id,String cno) throws SQLException {
		 List<String> selected= GetSelcted(id);
		 List<String> learned=GetLearned(id);
		 cno=cno.trim();
		 if(selected.contains(cno)) {
			 return "已选";
		 }
		 else  if(learned.contains(cno)) {
			 return "已修";
		 }
		 else {
			 return "未选";
		 }
		 
	}
	
	}
	
