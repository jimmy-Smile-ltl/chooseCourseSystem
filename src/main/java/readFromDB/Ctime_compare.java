package readFromDB;
import classes.DB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Ctime_compare {
	public static void main(String [] args) {
		Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String test="星期四   8:30-12:10";
		String sql="select * from null_course";
		try {
			conn=DB.GetConnection();
			stmt =conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				 System.out.print(rs.getString("Cno").trim()+"\t");
		         System.out.print(rs.getString("Ctime").trim()+"\t");
		         System.out.println(isTimeOk(rs.getString("Ctime").trim(),test));
//		         if(isTimeOk(rs.getString("Ctime").trim(),test)) {
//		        	 
//		         }
			}
		} 	
	  catch (SQLException e) {
	         e.printStackTrace();
	         System.out.println("无法连接数据库");
	     }
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public static boolean isTimeOk(String ctime,String select) {//比较时间冲突与否
		String [] s=select.split("-|\s{1,}");
		String [] c=ctime.split("-|\s{1,}");
		if(s[0].equals(c[0])) {//同一天
			// selsect开始时，ctime 已结束  s[1]>c[2]  或者   selsect结束时，ctime未开始  s[2]<c[1]  
			if(isFirstEarlier(c[2],s[1]) || isFirstEarlier(s[2],c[1])) {
				return true;
			}
			else {
				return false;
			}
		}
		else {// 不在一个星期，不冲突
			return true;
		}
	}
	public static boolean isFirstEarlier(String f,String a) {//比较两个String时间的大小  11：05格式
		int ah=Integer.parseInt(a.split(":")[0]); // f==first  a==after  h==hour  m=minutes
		int am=Integer.parseInt(a.split(":")[1]);
		int fh=Integer.parseInt(f.split(":")[0]);
		int fm=Integer.parseInt(f.split(":")[1]);
		if(fh<ah) {//前者小时小
			return true;
		}
		else if(fh==ah){//在一个小时
			if(fm<=am) {
				return true;
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
		
	}
}
