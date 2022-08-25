<%@page import="classes.Courses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetCourse" %>
<%@ page import ="readFromDB.GetStudent" %>
<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html>
<head>

	
	<% 
		String StuID=String.valueOf((request.getSession().getAttribute("ID")));
		if(StuID.equals("null")){
			   response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
		}
		String action ="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=choose";
	%>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resource/css/list.css">
<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../resource/css/table-course.css">

<title>开始选课</title>
	
    	


		<%
		 request.setCharacterEncoding("UTF-8");
		 String message=String.valueOf((request.getSession().getAttribute("choose_course_message")));
	     message=message.replace("\n", " \\u000a");
		%>	
		<%//复原
			request.getSession().setAttribute("choose_course_message","");
		%>	
		<script>
		
		var message="<%=message%>";
		if(message.length!=0&&message!="null"){
			alert(message);
		}
		
		</script>
		


</head>
 <body>
 <div class="list">
    <li class="now">当前位置：选课</li>
    <li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/showCourse.jsp">已选课程</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/schudule.jsp">查看课表</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/myinfo.jsp">个人信息</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/updatePW.jsp">修改密码</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/alter_phone.jsp">密保手机</a></li>
	<li class="exit"><a href="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=exit">退出</a></li>
	<span class="welcome">欢迎学生：<%=StuID%></span>
    </div>
 
	<h2>开始选课吧</h2>
   <table id="show" >
        <tr>
         <th>课程编号</th>
         <th>课程名称</th>
         <th>授课教师</th>
         <th>先修课</th>
         <th>上课时间</th>
		 <th>上课地点</th>
		 <th>人数限制</th>
		 <th>已选人数</th>		
		 <th>选择</th> 	
		 <th>备注</th> 	 
       </tr>
   <form name="chooseCourses" action="<%=action%>" method="post">
        <%
           GetCourse get=new GetCourse();
           List<Courses> list = get.getByTableName("course");  
           for(Courses course:list)
           {%>
         <tr class="oneclass">
              <td><%=course.getCuoId() %></td>
              <td><%=course.getCuoName() %></td>
              <td><%=course.getCuoTeacher()  %></td>
              <td><%=course.getCuoPro() %></td>
              <td><%=course.getCuoTime() %></td>
              <td><%=course.getCuoPosition() %></td>     
              <td><%=course.getCuoLimmit() %></td>
              <td><%=course.getCuoChoesd() %></td>
              <td><input type="checkbox" name="choose_this" value="<%=course.getCuoId() %>"/></td>
              <td><%=GetStudent.beizhu(StuID,course.getCuoId().trim()) %></td>
           </tr>
             <%}
        %> 
     </table>
	<div id="page-info">
	</div>
	
   <div  id="submit">
      <input class="submit" type="submit" value="提交" /> 
      <input class="reset" type="reset" value="重置"/>
   </div>
   </form>
</body>
		<script src="http://jimmysmile.site:8080/my_term_project_xuanke/resource/paging.js">
		</script>
</html>