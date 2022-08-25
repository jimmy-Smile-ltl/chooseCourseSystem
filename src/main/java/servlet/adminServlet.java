package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.*;
/**
 * Servlet implementation class adminServlet
 */
@WebServlet("/adminServlet")
public class adminServlet extends HttpServlet {
	  Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
	private static final long serialVersionUID = 1L;

    public adminServlet() {
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
    	String Id = (String) request.getSession().getAttribute("ID");
    	System.out.println(action);
    	if(action.equals("updatePW")) {
    		updatePW_admin(request, response, Id);
    	}
    	else if(action.equals("alter_course")) {
			alter_course(request, response);
		
    	}
    	else if(action.equals("alter_student")) {
			alter_student(request, response);
				
	}
    	else if(action.equals("delete_student")) {
			delete_student(request, response);
    	}
    	else if(action.equals("delete_course")) {		
			delete_course(request, response);
    	}
    	else if(action.equals("add_students")) {
    		add_students(request,response);
    	}
    	else if(action.equals("add_courses")) {
    		add_courses(request,response);
    	}
    	else if(action.equals("select_courses")){
    		select_courses(request, response);
    	}
    	else if(action.equals("select_students")){
    		select_students(request, response);
    	}
    	else if(action.equals("exit")){
    		request.getSession().invalidate();
    		response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
    	}
    	else {
    		HttpSession session=request.getSession();
    		session.setAttribute("admin_message", "未知错误，请联系开发人员");
    		response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/admin_home.jsp");
    	}
    	
    }
	public void select_courses(HttpServletRequest request, HttpServletResponse response)throws IOException {
		String way=request.getParameter("select_courses");
		String condition=request.getParameter("condition");
		System.out.println(way+"   "+condition);
		List<Courses> resultList=null;
        request.getSession().setAttribute("select_courses_result",null);
		String sql="select * from course";
		if(way.equals("time")) {
			sql="select * from course where Ctime like '%"+condition+"%';";
		}
		if(way.equals("cno")) {
			sql="select * from course where Cno like '%"+condition+"%';";
		}
		if(way.equals("teacher")) {
			sql="select * from course where teacher like '%"+condition+"%';";
			}
		
		   conn=DB.GetConnection();
			  try {
					stmt =conn.createStatement();
					rs=stmt.executeQuery(sql);
					resultList=Course_fromResultSet(rs);
					System.out.println(resultList.size());
					request.getSession().setAttribute("select_Courses_result",resultList);
					response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_course.jsp");
			  }
			  catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
		}
	
	public void select_students(HttpServletRequest request, HttpServletResponse response)throws IOException {
		String way=request.getParameter("select_ways");
		String condition=request.getParameter("condition").trim();
	     request.getSession().setAttribute("way",way);
	     request.getSession().setAttribute("condition",condition);
		System.out.println(way+"   "+condition);
		List<Students> resultList=null;
        request.getSession().setAttribute("select_students_result",null);
		//按照专业
        String sql="select * from student";
		if(way.equals("profess")) {
			 sql="select * from student where Sdept like '%"+condition+"%'";
		}
		else if(way.equals("grade")) {
			 sql="select * from student where Sgrade like '%"+condition+"%'";
		}
		else if(way.equals("sno")) {
			sql="select * from student where Sno like '%"+condition+"%'";
		}
		else if(way.equals("cno")) {  //判断表存在与否
			sql="select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='term_project' and TABLE_NAME like '%"+condition+"%'" ;

		}
	   conn=DB.GetConnection();
	  try {
			stmt =conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(way.equals("cno")) {
				if(rs.next()) {
					System.out.println("该表存在");
					sql="select * from "+condition.trim()+"_student";
					rs=stmt.executeQuery(sql);
			}
			
			}
			resultList=Students_fromResultSet(rs);
			request.getSession().setAttribute("select_students_result",resultList);
			 request.getSession().setAttribute("isfirst","notfirst");
			response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_student.jsp");
	  }
	  catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
	public List<Courses>  Course_fromResultSet(ResultSet rs){
		List<Courses> resultList=new ArrayList<Courses>();;
		try {
			while(rs.next()) {
				Courses tempCourses=new Courses();
				tempCourses.setCuoChoesd(rs.getInt("selperson"));
				tempCourses.setCuoTeacher(rs.getString("teacher"));
				tempCourses.setCuoId(rs.getString("Cno"));
				tempCourses.setCuoLimmit(rs.getInt("plim"));
				tempCourses.setCuoName(rs.getString("Cname"));
				tempCourses.setCuoPosition(rs.getString("Cloc"));
				tempCourses.setCuoTime(rs.getString("Ctime"));
				tempCourses.setCuoPro(rs.getString("Cpno"));
				resultList.add(tempCourses);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultList;
	}
	public List<Students> Students_fromResultSet(ResultSet rs){
		List<Students> resultList = new ArrayList<Students>();;
		try {
			while(rs.next()) {
				Students tempStudents=new Students();
				tempStudents.setStuId(rs.getString("Sno"));
				tempStudents.setStuName(rs.getString("Sname"));
				tempStudents.setStuGrage(rs.getString("Sgrade"));
				tempStudents.setStuProfess(rs.getString("Sdept"));
				tempStudents.setStuInstitute(rs.getString("Saca"));
				tempStudents.setStuPwd(rs.getString("Spswd"));
				tempStudents.setStuPhhone(rs.getString("Sphone"));	
				tempStudents.setStuCourselearned(rs.getString("Sclno"));
				resultList.add(tempStudents);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultList;
	}

	
	private void add_courses(HttpServletRequest request, HttpServletResponse response)throws IOException {
		// TODO Auto-generated method stub
		
	     HttpSession session=request.getSession();
		 String[]  CuoTeacher=request.getParameterValues("CuoTeacher");
		 String[]  CuoName=request.getParameterValues("CuoName");
		 String[]  CuoId=request.getParameterValues("CuoId");
		 String[]  CuoPro=request.getParameterValues("CuoPro");//先修课
		 String[]  CuoTime=request.getParameterValues("CuoTime");
		 String[]  CuoPosition=request.getParameterValues("CuoPosition");
	  	 String[]  CuoLimmit=request.getParameterValues("CuoLimit");
	     String[]  CuoChoesd=request.getParameterValues("CuoChosed");
		 int len=CuoId.length;
		 int i=0;
		 String add_courses_message="";
		try {
			while(i<len) {
			 //检查有没有相同编号的
			 String sql_select="select * from course where cno='"+CuoId[i]+"';";
			 conn=DB.GetConnection();
			 stmt =conn.createStatement();
			 rs=stmt.executeQuery(sql_select);
			 if(!rs.next()) {
				 String sql ="insert into course values('"+CuoTeacher[i]+"','"+CuoName[i]+"','"+CuoId[i]+"','"+CuoPro[i]+"','"+CuoTime[i]+"','"+CuoPosition[i]+"','"+CuoLimmit[i]+"','"+CuoChoesd[i]+"');";                  
				 int result= stmt.executeUpdate(sql);
				 if(result==1) {
					 String messgae=CuoId[i]+"  添加成功\n";
					 add_courses_message=add_courses_message+messgae;
				 }
				 else {
					 String messgae=CuoId[i]+"  添加失败，insert命令执行失败\n";
					 add_courses_message=add_courses_message+messgae;
					 
				 }
			 }
			 else {
				 String messgae=CuoId[i]+"  添加失败，原因：已经有相同编号课程存在\n";
				 add_courses_message=add_courses_message+messgae;
			 }
			 i++;
		 }
	 System.out.print(add_courses_message);
	 session.setAttribute("add_courses_message", add_courses_message);
	 response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_course.jsp");
		}
	 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}		

	public void add_students(HttpServletRequest request, HttpServletResponse response) throws IOException {
	     HttpSession session=request.getSession();
		 String [ ]   stuId=request.getParameterValues("stuId"); //学号
		 String [ ]   stuName=request.getParameterValues("stuName"); ; //姓名
		 String [ ]   stuGrage=request.getParameterValues("stuGrage"); ;//年级
		 String [ ]   stuProfess=request.getParameterValues("stuProfess"); ; // 专业
		 String [ ]   stuInstitute=request.getParameterValues("stuInstitute"); ; //学院
		 String [ ]   stuPwd=request.getParameterValues("stuPwd"); ; //密码
		 String [ ]   stuPhhone=request.getParameterValues("stuPhhone"); ; //联系电话
		 String [ ]   stuCourselearned=request.getParameterValues("stuCourselearned"); ;//已修课程
		 int len=stuId.length;
		 int i=0;
		 String add_students_message="";
		 try {
			 while(i<len) {
				
				 System.out.println(stuId[i]);
				 //检查有没有相同学号的
				 String sql_select="select * from student where sno = '"+stuId[i]+"';";
				 conn=DB.GetConnection();
				 stmt =conn.createStatement();
				 rs=stmt.executeQuery(sql_select);
				 if(!rs.next()) {
					 String sql ="insert into student values('"+stuId[i]+"','"+stuName[i]+"','"+stuGrage[i]+"','"+stuProfess[i]+"','"+stuInstitute[i]+"','"+stuPwd[i]+"','"+stuPhhone[i]+"','"+stuCourselearned[i]+"');";                  
					 int result= stmt.executeUpdate(sql);
					 if(result==1) {
						 String messgae=stuId[i]+"  添加成功\n";
						 add_students_message=add_students_message+messgae;
					 }
					 else {
						 String messgae=stuId[i]+"  添加失败，insert命令执行失败\n";
						 add_students_message=add_students_message+messgae;
						 
					 }
				 }
				 else {
					 String messgae=stuId[i]+"  添加失败，原因：已经有相同学号学生存在\n";
					 add_students_message=add_students_message+messgae;
				 }
				 i++;
			 }
		System.out.print(add_students_message);
		 session.setAttribute("add_students_message", add_students_message);
		 response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_student.jsp");
		 } 
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}
	public void delete_course(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			HttpSession session=request.getSession();
			String cno=request.getParameter("Cno");
			System.out.println("删除课程"+cno);
			String sql="delete from course where cno = '"+cno+"';";
			conn=DB.GetConnection();
	        stmt =conn.createStatement();
	        int result=stmt.executeUpdate(sql);
	        if(result==1) {
	        	session.setAttribute("look_course_message", "课程"+cno+"删除成功");
	        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_course.jsp");
	        } 
	        if(result==0) {
	        	session.setAttribute("look_course_message", "课程"+cno+"删除失败");
	        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_course.jsp");
	         }
        stmt.close();
        conn.close();
		} 
        catch(SQLException e) {
            e.printStackTrace();
        }
        catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
          }
	}

	
	public void delete_student(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			HttpSession session=request.getSession();
			String sno=request.getParameter("Sno");
			System.out.println("删除学生"+sno);
			String sql="delete from student where sno ='"+sno+"';";
			conn=DB.GetConnection();
	        stmt =conn.createStatement();
	        int result=stmt.executeUpdate(sql);
	        if(result==1) {
	        	session.setAttribute("look_student_message", "学号"+sno+"删除成功");
	        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_student.jsp");
	        } 
	        if(result==0) {
	        	session.setAttribute("look_student_message", "学号"+sno+"删除失败");
	        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_student.jsp");
	         }
        stmt.close();
        conn.close();
		} 
        catch(SQLException e) {
            e.printStackTrace();
        }
        catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
          }
	}
	public void alter_student(HttpServletRequest request, HttpServletResponse response) throws IOException{
		     HttpSession session=request.getSession();
			 String stuId=(String) request.getSession().getAttribute("Alter_student_ID"); //学号
			 String stuName=request.getParameter("stuName"); ; //姓名
			 String stuGrage=request.getParameter("stuGrage"); ;//年级
			 String stuProfess=request.getParameter("stuProfess"); ; // 专业
			 String stuInstitute=request.getParameter("stuInstitute"); ; //学院
			 String stuPwd=request.getParameter("stuPwd"); ; //密码
			 String stuPhhone=request.getParameter("stuPhhone"); ; //联系电话
			 String stuCourselearned=request.getParameter("stuCourselearned"); ;//已修课程
		     String newCourse="Students [stuId=" + stuId + ", stuName=" + stuName + ", stuGrage=" + stuGrage + ", stuProfess="
						+ stuProfess + ", stuInstitute=" + stuInstitute + ", stuPwd=" + stuPwd + ", stuPhhone=" + stuPhhone
						+ ", stuCourselearned=" + (stuCourselearned) + "]";
	
		     String sqlString="update student set Sname='"+stuName+"', Sgrade='"+stuGrage+"',  Sdept='"+stuProfess+"', Saca ='"+stuInstitute+"',Spswd='"+stuPwd+"',  Sclno ='"+stuCourselearned+"'  where sno ='"+stuId+"';";
		 try { 
			 conn=DB.GetConnection();
	         stmt =conn.createStatement();       
	         int result=stmt.executeUpdate(sqlString);
	         stmt.close();
	         conn.close();
	         if(result==1) {
	        	 session.setAttribute("alter_student_message", "修改成功");
	         }
	         if(result==0) {
		         session.setAttribute("alter_student_message", "修改失败");		        
		         }
	         response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/alter_student.jsp?Sno="+stuId);
		} 
	    
	catch (SQLException e) {
	         e.printStackTrace();
       }
	catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
	}

	
	public void alter_course(HttpServletRequest request, HttpServletResponse response) throws IOException{	
		     HttpSession session=request.getSession();
			 String  CuoTeacher=request.getParameter("CuoTeacher");
			 String  CuoName=request.getParameter("CuoName");
			 String  CuoId=(String) session.getAttribute("Alter_course_ID");
			 String  CuoPro=request.getParameter("CuoPro");//先修课
			 String  CuoTime=request.getParameter("CuoTime");
			 String  CuoPosition=request.getParameter("CuoPosition");
		  	 String  CuoLimmit=request.getParameter("CuoLimit");
		     String  CuoChoesd=request.getParameter("CuoChosed");
		     String newCourse="Courses [CuoTeacher=" + CuoTeacher + ", CuoName=" + CuoName + ", CuoId=" + CuoId + ", CuoPro=" + CuoPro
		 				+ ", CuoTime=" + CuoTime + ", CuoPosition=" + CuoPosition + ", CuoLimmit=" + CuoLimmit + ", CuoChoesd="
						+ CuoChoesd + "]";
		     System.out.print(newCourse);
		     String sqlString="update course set teacher='"+CuoTeacher+"', Cname='"+CuoName+"',  Cpno='"+CuoPro+"', Ctime='"+CuoTime+"',Cloc='"+CuoPosition+"',plim="+CuoLimmit+",  selperson="+CuoChoesd+" where cno ='"+CuoId+"';";
	   try {
		   	 conn=DB.GetConnection();
	         stmt =conn.createStatement();
	         int result=stmt.executeUpdate(sqlString);
	         if(result==1) {
	        
	         session.setAttribute("alter_course_message", "修改成功"+newCourse);
	         response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/alter_course.jsp?CuoID="+CuoId);
	         }
	         if(result==0) {
		         session.setAttribute("alter_course_message", "修改失败"+newCourse);
		         response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/alter_course.jsp?CuoID="+CuoId);
		         }
	         stmt.close();
	         conn.close();
		} 
	    
	catch (SQLException e) {
	         e.printStackTrace();
       }
	catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
	}
	//修改密码
	public void updatePW_admin(HttpServletRequest request, HttpServletResponse response,String Id) throws IOException {
		String oldPW = request.getParameter("oldpwd");
		String newPW = request.getParameter("newPwd1");
		System.out.print(oldPW+"  为"+newPW);
		String sql="";
	        try {                                                  
	            conn=DB.GetConnection();
	            stmt =conn.createStatement();
	            // SQL语句，查找该管理员是否存在
	            sql ="select * from adminTable where adminID like'%" + Id+"%'";
	            rs = stmt.executeQuery(sql);// 返回查询结果
	            HttpSession session=request.getSession();
	            session.setAttribute("update_message","");
				if(rs.next()) {
					//确定原密码是否正确
		            sql = "select * from adminTable where adminID like '%" + Id+"%' and adminPW like '%"+oldPW+"%';";
		            System.out.print(sql);
		            rs = stmt.executeQuery(sql);// 返回查询结果
		            if(rs.next()) {
			            sql = "update adminTAble set adminPW='"+newPW+"' where adminID like'%" + Id + "%';";
			            int result = stmt.executeUpdate(sql);// 返回查询结果
			            System.out.println(result);
			            if (result==1) {
			                // 如果记录集非空，表明有匹配的用户名和密码，登陆成功
			            	System.out.println("管理员："+Id+"   修改密码成功");
			            	session.setAttribute("loginmessage", "密码修改成功，使用新密码登录吧");
			                response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/login/login.jsp");
			            } else {
				            session.setAttribute("update_message", "未知错误");
			                System.out.println("管理员："+Id+"  密码修改失败");
			                response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/updatePW.jsp");
			            }
		            }
		            else {
		            	session.setAttribute("update_message", "原密码错误");
			        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/updatePW.jsp");
		            }
		        } 
	            else {
		        	session.setAttribute("update_message", "该管理员不存在");
		        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/admin/updatePW.jsp");
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