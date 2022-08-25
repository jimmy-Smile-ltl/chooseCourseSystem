<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetStudent" %>
<%@ page import ="java.util.List" %>
<%@ page import ="classes.Students" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查看学生信息</title>
<link rel="stylesheet" type="text/css" href="../resource/css/admin-list.css">
<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../resource/css/table-student.css">
		<%
		 request.setCharacterEncoding("UTF-8");
		 String message=String.valueOf((request.getSession().getAttribute("look_student_message")));
		 String ID=String.valueOf((request.getSession().getAttribute("ID")));
		 %>
<script src="http://jimmysmile.site:8080/my_term_project_xuanke/resource/paging.js">
</script>

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
		<div class="selected">查看学生</div>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_student.jsp">新增学生</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_student.jsp">查找学生</a>
		</div>
		</div>
		<div id="operate-course"  class="box">
		  <div class="item-span">操作课程信息</div>
		    <div id="operate-stu" class="item-box">
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_course.jsp">查看课程</a>
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_course.jsp">添加课程</a>
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
<table id="show">
       <tr>
         <th>学号</th>
         <th>姓名</th>
         <th>年级</th>
         <th>专业</th>
         <th>学院</th>
		 <th>密码</th>
		 <th>手机号码</th>		
		 <th>已修课程</th>
		 <th>修改</th> 
		 <th>删除</th> 		 
       </tr>
        <%   
	        String url="http://jimmysmile.site:8080/my_term_project_xuanke/admin/alter_student.jsp?Sno=";
	        String serveletUrl="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?";
	        
           GetStudent get=new GetStudent();
           List<Students> list = get.getByTableName("student");  
           for(Students student:list)
           {%>
         <tr>
              <td><%=student.getStuId() %></td>
              <td><%=student.getStuName() %></td>
              <td><%=student.getStuGrage()  %></td>
              <td><%=student.getStuProfess() %></td>
              <td><%=student.getStuInstitute()  %></td>
              <td><%=student.getStuPwd() %></td>     
              <td><%=student.getStuPhhone() %></td>
              <td><%=student.getStuCourselearned().trim()%></td>
              <%
              String stuID=student.getStuId();
              String alter=url+stuID;         
              String delete=serveletUrl+"action=delete_student&Sno="+stuID;
              %> 
              <td><a href="<%=alter%>"><input type="button"  value="修改"/></a></td>
              <td><a href="<%=delete%>"><input type="button"  value="删除"/></a></td>
           </tr>
             <%}
        %>
      
   </table>
   <div id="page-info"></div>
</body>
<script>
//<!-- 处理反馈 -->
	var message="<%=message %>"
	if(message.length!=0&&message!="null"){
		alert(message);
		<%request.getSession().setAttribute("look_student_message","");%>
	}

	//<!-- 页数复位 -->
	  var nowpage= sessionStorage.getItem("now_page")
		console.log("nowpage")
		if(nowpage===null){
			document.getElementsByTagName("body")[0].onload=goPage(1,10)
			console.log("空值")
		}
		else{
			console.log(Number(nowpage))
			console.log(document.getElementsByTagName("body"))
			console.log(document.getElementsByTagName("body")[0])
			document.getElementsByTagName("body")[0].onload=goPage(Number(nowpage),10)
		}
</script>
</html>