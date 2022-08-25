package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DB {
	private static String DRVIER = "com.mysql.cj.jdbc.Driver"; // MySQL 驱动
	private static String URL = "jdbc:mysql://127.0.0.1:3306/term_project?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"; // URL
    private static String USERNAMR = "root"; // Oracle用户名
    private static String PASSWORD = "1215"; // 密码

    public static Connection GetConnection(){
    	Connection conn = null;
    	try{
    		// 这里使用Class.forName() 方法创建驱动程序的实例并且自动调用DriverManager 对其注册
    		Class.forName(DRVIER);
    		// 通过DriverManager 获取数据库连接
    		conn = DriverManager.getConnection(URL, USERNAMR, PASSWORD);
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    	catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
    	return conn;
    }
    
    /**
     * 关闭连接
     * @param conn
     */
    public static void close(Connection conn){
    	try{
    		if(conn != null && !conn.isClosed() )
    			conn.close();
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    /**
     * 得到PreparedStatement 对象
     * @param conn
     * @param sql
     * @return
     */
    public static PreparedStatement getStatement(Connection conn, String strsql){
    	if(strsql == null || "".equals(strsql) ){
    		System.out.println("SQL 为空……");
    		return null;
    	}
    	if(conn == null){
    		System.out.println("连接为空……");
    		return null;
    	}
    	
    	try{
    		return conn.prepareStatement(strsql,  // 预编译语句得到PreparedStatement 对象
    				ResultSet.TYPE_SCROLL_INSENSITIVE,
    				ResultSet.CONCUR_UPDATABLE);
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    	return null;
    }
    
    /**
     * 得到 ResultSet
     * @param pstmt
     * @return
     */
    public static ResultSet executeQuery(PreparedStatement pstmt){
    	try{
    		if(pstmt!=null)
    			return pstmt.executeQuery(); // 查询
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    	return null;
    }
    
    /**
     * 执行增、删、改的操作
     * @param sql
     * @return
     */
    public static int executeUpdate(String sql){
    	int returnvalue = 0;
    	Connection conn = DB.GetConnection();
    	try{
    		Statement stmt = conn.createStatement();
    		returnvalue = stmt.executeUpdate(sql);
    		return returnvalue;
    	} catch(SQLException e){
    		System.out.println(e.getMessage());
    		return -1;
    	}
    }
    
    /**
     * 关闭Statement 对象
     * @param stmt
     */
    public static void close(Statement stmt){
    	try{
    		if(stmt!=null) {
    			stmt.close();
    		}
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    /**
     * 关闭结果集
     * @param rs
     */
    public static void close(ResultSet rs){
    	try{
    		if(rs!=null){
    			rs.close();
    		}
    	} catch(SQLException e){
			e.printStackTrace();
		}
    }
    
    
    
    
    public static void main(String[] args){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs= null;
        try{
        	
        	conn=DB.GetConnection();
        	stmt=conn.createStatement();
        	 String sql = "select * from student where sno="+"'20200273'";
             rs = stmt.executeQuery(sql);// 返回查询结果
             if(rs.next()) {
            	 System.out.println("有");
             }
             else {
            	 System.out.println("无");
             }
//             完成后关闭
            rs.close();
            stmt.close();
            conn.close();
        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
//          }
        }
       }
}
