<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetStudent" %>
<%@ page import ="java.util.List" %>
<%@ page import ="classes.Students" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生信息</title>
		<%
		 request.setCharacterEncoding("UTF-8");
		 String message=String.valueOf((request.getSession().getAttribute("alter_student_message")));
	     message=message.replace("\n", " \\u000a");
		%>
		<script>
		var message='<%=message%>';
		if(message.length!=0&&message!="null"){
			alert(message);
		}
		</script>	
		<%//复原
			request.getSession().setAttribute("alter_student_message","");
		%>		
</head>
<body>

 <% 
  String adminID=String.valueOf((request.getSession().getAttribute("ID")));
	if(adminID.equals("null")){
		   response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
	}

%>	
 <div id="list">
	  <div id="operate-stu" class="box">
	    <div class="item-span">操作学生信息</div>
	     <div class="item-box">
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_student.jsp">查看学生</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_student.jsp">新增学生</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_student.jsp">查找学生</a>
		</div>
		</div>
		<div id="operate-course"  class="box">
		  <div class="item-span">操作课程信息</div>
		    <div id="operate-stu" class="item-box">
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_course.jsp">查看课程</a>
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_course.jsp"  class="selected">添加课程</a>
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_course.jsp">查找课程</a>
		</div>
		</div>
		
		<div id="operate-admin" class="box">
		<div class="item-span">welcome administer  <%=adminID%></div>
		<div class="item-box">
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/updatePW.jsp">修改密码</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=exit">退出</a>
		</div>
		</div>
</div>

  <table border="1" align="center">
       <tr>
         <th>学号(不可修改)</th>
         <th>姓名</th>
         <th>年级</th>
         <th>专业</th>
         <th>学院</th>
		 <th>密码</th>
		 <th>手机号码</th>		
		 <th>已修课程</th>		 
       </tr>
        <%
           GetStudent get=new GetStudent();
           List<Students> list = get.getByTableName("student");  
           String sno=request.getParameter("Sno");
           for(Students student:list){
           		if(sno.equals(student.getStuId())){
           %>
         <tr>
              <td><%=student.getStuId() %></td>
              <td><%=student.getStuName() %></td>
              <td><%=student.getStuGrage()  %></td>
              <td><%=student.getStuProfess() %></td>
              <td><%=student.getStuInstitute()  %></td>
              <td><%=student.getStuPwd() %></td>     
              <td><%=student.getStuPhhone() %></td>
              <td><%=student.getStuCourselearned() %></td>
              </tr>
                      <%
            	String alter_student="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=alter_student";
                request.getSession().setAttribute("Alter_student_ID",sno);
              %>
 <form action="<%=alter_student %>" method="post">
              <tr>
              <td><%=student.getStuId()%></td>
              <td><input name="stuName" type="text" value="<%=student.getStuName() %>"/></td>
              <td><input name="stuGrage" type="text" value="<%= student.getStuGrage() %>"/></td>
              <td><input name="stuProfess" type="text" value="<%=student.getStuProfess() %>"/></td>
              <td><input name="stuInstitute" type="text" value="<%= student.getStuInstitute()%>"/></td>
              <td><input name="stuPwd" type="text" value="<%=student.getStuPwd()  %>"/></td>     
              <td><input name="stuPhhone" type="text" value="<%=student.getStuPhhone() %>"/></td>
              <td><input name="stuCourselearned" type="text" value="<%=student.getStuCourselearned()%>"/></td>          
              </tr>
                 </table>

              <p align="center">
              		<input type="submit"  value="修改"/>
            	    <input type="reset" value="重置">
              </p>
             <%}
           }
        %>
        

</body>
</html>