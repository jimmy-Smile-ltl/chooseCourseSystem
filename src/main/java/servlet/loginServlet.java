package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.DB;
/**
 * Servlet implementation class loginServlet
 * 处理学生与管理员的登录与忘记密码
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	  Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
	private static final long serialVersionUID = 1L;

    public loginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
    	String action = request.getParameter("action");
    	System.out.println(action);
    	if(action.equals("login")){
    		login(request, response);
    	}
    	else if(action.equals("forgetPW")){
    		forgetPW(request, response);
    	}
    	else {
            HttpSession session = request.getSession();
            session.setAttribute("loginmessage", "异常错误，请联系开发人员维护");
    		response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/3seconds.jsp?error=yes");
    	}
	}
	//处理修改密码
	
	//处理学生与管理员忘记密码
	public void forgetPW(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String who =request.getParameter("who");
		if(who.equals("student")){
			forgetPW_student(request,  response);
		}
		else if(who.equals("admin")){ 
			
			forgetPW_admin(request,  response);
		}
		else {
    		response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/3seconds.jsp?error=yes");
    	}
	}
	
	public void forgetPW_student(HttpServletRequest request, HttpServletResponse response) {
		String Id = request.getParameter("Id");
		String Phone = request.getParameter("Phone");
		String newPW = request.getParameter("newPwd1");//已经验证前后密码一致
        System.out.println("账号:"+Id);
        System.out.println("新密码："+newPW);
        HttpSession session = request.getSession();
        
        session.setAttribute("loginmessage", "");
        String sql="";
        try {                                                  
            conn=DB.GetConnection();
            stmt =conn.createStatement();
            // SQL语句，查找该手机号码与该学生是否匹配
            sql = "select * from student where Sno like '%" + Id+"%'"+"and Sphone like'%"+Phone+"%';";
            rs = stmt.executeQuery(sql);// 返回查询结果
            if(rs.next()) {
	            sql = "update student set Spswd='"+newPW+"' where Sno like'%" + Id + "%';";
	            int result = stmt.executeUpdate(sql);// 返回查询结果
	            System.out.println(result);
	            if (result==1) {
	                // 如果记录集非空，表明有匹配的用户名和密码，登陆成功
	            	System.out.println("学生："+Id+"   修改密码成功");
	            	session.setAttribute("loginmessage", "密码修改成功，使用新密码登录吧");
	                response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/login.jsp");
	            } else {
		            session.setAttribute("forget_message", "未知错误");
	                System.out.println("学生："+Id+"  登录失败");
	                response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/forgetPW.jsp");
	            }
	        } 
            else {
	        	session.setAttribute("forget_message", "用户名与密保手机匹配失败");
	        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/forgetPW.jsp");
	        }
            rs.close();
            stmt.close();
            conn.close();
        } 
       
        catch (SQLException e) {
            e.printStackTrace();
        }
        catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
          }

	}
	public void forgetPW_admin(HttpServletRequest request, HttpServletResponse response) {
		String Id = request.getParameter("Id");
        String Phone = request.getParameter("Phone");
		String newPW = request.getParameter("newPwd1");//已经验证前后密码一致
        System.out.println("账号:"+Id);
        System.out.println("新密码："+newPW);
        HttpSession session = request.getSession();
        session.setAttribute("StuId", Id);
        session.setAttribute("loginmessage", "");
        String sql="";
        try {                                                  
            conn=DB.GetConnection();
            stmt =conn.createStatement();
            // SQL语句，查找该手机号码与该学生是否匹配
            sql = "select * from adminTable where adminID like '%" + Id+"%'"+"and adminPH like'%"+Phone+"%';";
            rs = stmt.executeQuery(sql);// 返回查询结果
            if(rs.next()) {
	            sql = "update student set Spswd='"+Id+"' where Sno like'%" + Id + "%';";
	            int result = stmt.executeUpdate(sql);// 返回查询结果
	            System.out.println(result);
	            if (result==1) {
	                // 如果记录集非空，表明有匹配的用户名和密码，登陆成功
	            	System.out.println("学生："+Id+"   修改密码成功");
	            	session.setAttribute("loginmessage", "密码修改成功，使用新密码登录吧");
	                response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/login.jsp");
	            } else {
		            session.setAttribute("forget_message", "未知错误");
	                System.out.println("学生："+Id+"  登录失败");
	                response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/forgetPW.jsp");
	            }
	        } 
            else {
	        	session.setAttribute("forget_message", "用户名与密保手机匹配失败");
	        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/forgetPW.jsp");
	        }
            rs.close();
            stmt.close();
            conn.close();
        } 
       
        catch (SQLException e) {
            e.printStackTrace();
        }
        catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
          }

	}
	
	//处理学生与管理员登录，
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String who =request.getParameter("who");
		HttpSession session = request.getSession();
		session.setAttribute("who", who);
		session.setAttribute("now_page", 1);
		System.out.println("执行"+who+"登录");	
		if(who.equals("student")){
			login_student(request,  response);
		}
		else if(who.equals("admin")){ 
			login_admin(request,  response);
		}
		else {
    		response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/3seconds.jsp?error=yes");
    	}
	}
	//学生登录	
	public void login_student(HttpServletRequest request, HttpServletResponse response) {
		String Id = request.getParameter("Id");
        String Pwd = request.getParameter("Pwd");
        System.out.println("账号:"+Id);
        System.out.println("密码："+Pwd);
        HttpSession session = request.getSession();
        session.setAttribute("loginmessage", "");
        String sql="";
        try {                                                  
            conn=DB.GetConnection();
            stmt =conn.createStatement();
            // SQL语句
            sql = "select * from student where Sno ='"+Id+"';";
            rs = stmt.executeQuery(sql);// 返回查询结果
            if(rs.next()) {
	            sql = "select * from student where Sno like'%" + Id + "%' and sPswd like '%" + Pwd + "%';";
	            rs = stmt.executeQuery(sql);// 返回查询结果
	            if (rs.next()) {
	                // 如果记录集非空，表明有匹配的用户名和密码，登陆成功
	            	 System.out.println("学生："+Id+"   登录成功");
	            	 session.setAttribute("ID", Id);
	                response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/student/choose_course.jsp");
	            } else {
		            session.setAttribute("loginmessage", "用户名或密码不匹配。");
	                System.out.println("学生："+Id+"  登录失败");
	                response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/3seconds.jsp?error=yes");
	            }
	        } 
            else {
	        	session.setAttribute("loginmessage", "用户名不存在");
	        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/3seconds.jsp?error=yes");
	        }
            rs.close();
            stmt.close();
            conn.close();
        } 
       
        catch (SQLException e) {
            e.printStackTrace();
        }
        catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
          }

	}

	//管理员登录
	public void login_admin(HttpServletRequest request, HttpServletResponse response) {
		String Id = request.getParameter("Id");
	    String Pwd = request.getParameter("Pwd");
	    System.out.println("账号:"+Id);
	    System.out.println("密码："+Pwd);
	    HttpSession session = request.getSession();
	    String sql ="";
	    session.setAttribute("loginmessage", "");
	    try {                                                  
	        conn=DB.GetConnection();
	        stmt =conn.createStatement();
	        // SQL语句
	        sql = "select * from admintable where adminID=" + Id;
	        rs = stmt.executeQuery(sql);// 返回查询结果
	        if (rs.next()) {
		        sql = "select * from admintable where adminID='" + Id + "' and adminPW= '" + Pwd + "'";
		        rs = stmt.executeQuery(sql);// 返回查询结果
		        if (rs.next()) {
		            // 如果记录集非空，表明有匹配的用户名和密码，登陆成功
		        	 System.out.println("管理员："+Id+"   登录成功");
		        	 session.setAttribute("ID", Id);
		        	 response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_course.jsp");
		        } else {
		            session.setAttribute("loginmessage", "用户名或密码不匹配");
		            System.out.println("管理员："+Id+"登录失败");
		            response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/3seconds.jsp?error=yes");
		          
		        }
	        }
	        else {
	        	session.setAttribute("loginmessage", "用户名不存在");
	        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/3seconds.jsp?error=yes");
		          
	        }
	        rs.close();
	        stmt.close();
	        conn.close();
	    } 
	   
	    catch (SQLException e) {
	        e.printStackTrace();
	    }
	    catch(Exception e){
	        // 处理 Class.forName 错误
	        e.printStackTrace();
	      }
	
	}
}	
