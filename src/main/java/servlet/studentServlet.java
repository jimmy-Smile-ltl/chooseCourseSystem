package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.DB;
import readFromDB.*;
/**
 * Servlet implementation class studentServlet
 * 处理学生修改密码，选课，删除已选课程，修改手机号码
 */
@WebServlet("/studentServlet")
public class studentServlet extends HttpServlet {
	  Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
	private static final long serialVersionUID = 1L;

    public studentServlet() {
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
    	String who = (String) request.getSession().getAttribute("who");
    	
    	if(action.equals("updatePW")){
    		System.out.print(who+"  "+Id+ "修改密码  ");
    		updatePW_student(request, response,Id);
    	}
    	else if(action.equals("choose")){
    		choose_course(request, response);
    	}
    	else if(action.equals("delete")){
    		delete_course(request, response);
    	}
    	else if(action.equals("alter_phone")){
    		alter_phone(request, response);
    	}
    	else if(action.equals("alter_phone")) {
    		alter_phone(request, response);
    	}
    	else if(action.equals("exit")){
    		//清空session，返回登录页面
    		request.getSession().invalidate();
    		response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
    	}
    	else {
    		HttpSession session=request.getSession();
    		session.setAttribute("student_message", "未知错误，请联系开发人员");
    		response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/student/choose_course.jsp");
    		}
	}
	//退出
	//处理修改密保手机
	public void alter_phone(HttpServletRequest request, HttpServletResponse response) {
		String newPh=request.getParameter("newphone");
		String idString=(String) request.getSession().getAttribute("ID");
		System.out.println(newPh.length());
		if(newPh.length()!=0) {
			String sqlString="update student set Sphone='"+newPh+"' where sno like '%"+idString+"%'";
			request.getSession().setAttribute("alter_phone_message", "密保手机修改成功");
			System.out.println("学生："+idString+"新手机号码:  "+newPh);
		}
		else {
			request.getSession().setAttribute("alter_phone_message", "同学，请输入号码");
		}
			try {
				response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/student/alter_phone.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	//处理修改密码
	public void updatePW_student(HttpServletRequest request, HttpServletResponse response,String Id) throws IOException {
		String oldPW = request.getParameter("oldpwd");
		String newPW = request.getParameter("newPwd1");
		System.out.print(oldPW+"  为"+newPW);
		String sql="";
	        try {                                                  
	            conn=DB.GetConnection();
	            stmt =conn.createStatement();
	            // SQL语句，查找该学生是否存在
	            sql = "select * from student where Sno like '%" + Id+"%';";
	            rs = stmt.executeQuery(sql);// 返回查询结果
	            HttpSession session=request.getSession();
	            session.setAttribute("update_message","");
				if(rs.next()) {
					//确定原密码是否正确
		            sql = "select * from student where Sno like '%" + Id+"%' and Spswd like '%"+oldPW+"%';";
		            System.out.print(sql);
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
				            session.setAttribute("update_message", "未知错误");
			                System.out.println("学生："+Id+"  密码修改失败");
			                response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/student/updatePW.jsp");
			            }
		            }
		            else {
		            	session.setAttribute("update_message", "原密码错误");
			        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/student/updatePW.jsp");
		            }
		        } 
	            else {
		        	session.setAttribute("update_message", "该学生不存在");
		        	response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/student/updatePW.jsp");
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
	//处理选课
	public void choose_course(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		String ID= (String) session.getAttribute("ID");
		//为这个学生建表，储存他选的课程
		String sql_create_table="create table if not exists "+ID+"_course"
				+ "("
				+ "	   teacher char(20) not null,"
				+ "    Cname char(20),"
				+ "    Cno char(10),"
				+ "    Cpno char(10),"
				+ "    Ctime char(20),"
				+ "    Cloc char(20),"
				+ "    plim char(10),"
				+ "    selperson char(10)"
				+ ");";
		conn=DB.GetConnection();
	    try {
			stmt =conn.createStatement();
			stmt.executeUpdate(sql_create_table);
			System.out.println("建表成功或表存在");
			String [] cnos =request.getParameterValues("choose_this");
			String all_message="";
			if(cnos!=null) {
				List<String>  learned=GetStudent.GetLearned(ID);
				List<String>  selected =GetStudent.GetSelcted(ID);
				for(String cno:cnos) {
					cno=cno.trim();
					//判断是否已经选了该课程或者是修读了该课程
					String sqlString="select * from course where  Cno like'%"+cno+"%'";
					rs=stmt.executeQuery(sqlString);
					rs.next();
					String cpno=rs.getString("Cpno");//获取先修课。都只有一门，直接比较
					String ctime=rs.getString("Ctime");//获取上课时间，比较时间冲突与否，调用java/readfromDB/ctimecompare
					System.out.print(cpno.trim().equals("-"));
					if(!cpno.trim().equals("-") && !learned.contains(cpno)) {
						String message=cno+":请先修"+cpno+"\n";
						all_message=all_message+message;
					}
					else if(selected.contains(cno)) {
						String message=cno+":已经选了\n";
						all_message=all_message+message;
					}
					else if(learned.contains(cno)) {
						String message=cno+":已经修了\n";
						all_message=all_message+message;
					}
		
					else{
						//比较选课人数是否超出
						sqlString="select * from course where plim>selperson and Cno like'%"+cno+"%'";
						rs=stmt.executeQuery(sqlString);
						if(rs.next()) {
							//检查时间是否冲突,其实这么搞是有问题的
						String sql="select * from null_course";
	    					//更新同学课表
						rs=stmt.executeQuery(sql);
						boolean timeok=true;
						while(rs.next()) {
					         if(!Ctime_compare.isTimeOk(rs.getString("Ctime").trim(),ctime)) {
					        	 timeok=false;
					        	 break;
					         	};
					         }//调用函数
					       
							if(timeok) {
		//	    			
			    					String sql_insert="insert into "+ID+"_course (select * from course where Cno like '%"+cno+"%')";
			    					stmt.executeLargeUpdate(sql_insert);
			    					//更新课程表已选人数
			    					String sql_update="update course set selperson=selperson+1 where Cno like '%"+cno+"%';";
			    					stmt.executeLargeUpdate(sql_update);
			    					String message=cno+":加入课表，选课人数已更新\n";
			    					all_message=all_message+message;
			    					
					    			String	stuofcou="create table if not exists "+cno+"_student("+
					    						"Sno char(20)  primary key unique,"+
					    					    "Sname char(20) , "+
					    					    "Sgrade char(20),"+
					    						"Sdept char(20),"+
					    					    "Saca char(20),"+
					    					    "Spswd char(20),"+
					    					    "Sphone char(20),"+
					    					    "Sclno char(100));";
					    			stmt.executeUpdate(stuofcou);
					    			String insert="insert into "+cno+"_student (select * from student where sno='"+ID+"');";
					    			stmt.executeUpdate(insert);
								}
							else {
							
								String message=cno+	"与"+rs.getString("cno")+":上课时间冲突\n";
								all_message=all_message+message;
							}
						}
						else {
							String message=cno+":没有余量，如有需要请联系管理员\n";
							all_message=all_message+message;
						}
					}
				}
			}
			else {
				String message="同学，你什么都没有选\n";
				all_message=all_message+message;
			}
				System.out.println(all_message);
				session.setAttribute("choose_course_message", all_message);
				response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/student/choose_course.jsp");
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}
	//处理删除已选课程
	public void delete_course(HttpServletRequest request, HttpServletResponse response) throws IOException{
		   HttpSession session = request.getSession();
		   String ID= (String) session.getAttribute("ID");
		   conn=DB.GetConnection();
	        try {
				stmt =conn.createStatement();
				String [] cnos =request.getParameterValues("delete_this");
				String all_message="";
				if(cnos!=null) {
	    			for(String cno:cnos) {
	    				//判断是否已经选了该课程
	    				String sql_isChosed="select * from "+ID+"_course where Cno like '%"+cno+"%';";
	    				rs=stmt.executeQuery(sql_isChosed);
	    				if(rs.next()) {
	    						//删除该课程
		    					String sql_delete="delete from "+ID+"_course where Cno like '%"+cno+"%'; ";
		    					System.out.print(sql_delete);
		    					stmt.executeLargeUpdate(sql_delete);
		    					//更新课程表已选人数
		    					String sql_update="update course set selperson=selperson-1 where Cno like '%"+cno+"%';";
		    					stmt.executeLargeUpdate(sql_update);
		    					String message=cno+":移出课表，选课人数已更新\n";
		    					all_message=all_message+message;
	    					}
	    				else {
	    					String message=cno+":不在您的课表\n";
	    					all_message=all_message+message;
	
	    				}
	    			}
				}
				else {
					String message="同学，你什么都没有选\n";
					all_message=all_message+message;
				}
	    			System.out.println(all_message);
	    			session.setAttribute("delete_course_message", all_message);
	    			response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/student/showCourse.jsp");
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
	}
}