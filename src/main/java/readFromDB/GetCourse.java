package readFromDB;
import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import classes.Courses;
import classes.DB;
import readFromDB.GetStudent;

public class GetCourse {
	public static void main(String[] args) throws SQLException {
		 System.out.println("已选读课程");
		 List<Courses> selected= getLearnedCourses("123456");

	}


     // 读取全部课程
	public List<Courses> getByTableName(String tablename) throws SQLException {
		 Connection conn = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      String sql="";
	      List<Courses> courseList = null;
		try { 
			courseList=new ArrayList<Courses>();
			conn=DB.GetConnection();
			stmt =conn.createStatement();
			sql="select * from "+tablename;
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Courses tempCourses=new Courses();
				tempCourses.setCuoChoesd(rs.getInt("selperson"));
				tempCourses.setCuoTeacher(rs.getString("teacher"));
				tempCourses.setCuoId(rs.getString("Cno"));
				tempCourses.setCuoLimmit(rs.getInt("plim"));
				tempCourses.setCuoName(rs.getString("Cname"));
				tempCourses.setCuoPosition(rs.getString("Cloc"));
				tempCourses.setCuoTime(rs.getString("Ctime"));
				tempCourses.setCuoPro(rs.getString("Cpno"));
				courseList.add(tempCourses);
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
		return courseList;
	}

	public static List<Courses> getLearnedCourses(String sno) throws SQLException {
		 Connection conn = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      String sql="";
	      List<Courses> courseList = null;
		try { 
			List<String> learned=GetStudent.GetLearned("20180184");
			 courseList=new ArrayList<Courses>();
			conn=DB.GetConnection();
			stmt =conn.createStatement();
			if(learned.get(1)=="-") {
				
			}
			for(String s:learned) {
				
			}
			sql="select * from  course where cno in (";
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Courses tempCourses=new Courses();
				tempCourses.setCuoChoesd(rs.getInt("selperson"));
				tempCourses.setCuoTeacher(rs.getString("teacher"));
				tempCourses.setCuoId(rs.getString("Cno"));
				tempCourses.setCuoLimmit(rs.getInt("plim"));
				tempCourses.setCuoName(rs.getString("Cname"));
				tempCourses.setCuoPosition(rs.getString("Cloc"));
				tempCourses.setCuoTime(rs.getString("Ctime"));
				tempCourses.setCuoPro(rs.getString("Cpno"));
				courseList.add(tempCourses);
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
		return courseList;
	}
}
