<%@page import="java.util.ArrayList"%>
<%@page import="classes.Courses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetCourse" %>
<%@ page import ="java.util.List" %>
<%@ page import ="classes.Courses" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询课程</title>


<%	String ID=String.valueOf((request.getSession().getAttribute("ID"))); %>
<script>
	function check(){
		var condi = document.getElementByName("condition");
		if(codi==""|condi=="null"){
			alert("搜索条件不能为空");
			return false;
		}
	}

</script>
<link rel="stylesheet" type="text/css" href="../resource/css/admin-list.css">
<link rel="stylesheet" type="text/css" href="../resource/css/table-course.css">
<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
</head>
<body>
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
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_course.jsp">添加课程</a>
			<div class="selected">查找课程</div>
		</div>
		</div>
		
		<div id="operate-admin" class="box">
		<div class="item-span">welcome administer  <%=ID%></div>
		<div class="item-box">
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/updatePW.jsp">修改密码</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=exit">退出</a>
		</div>
		</div>
</div>

	<%
    String action="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=select_courses";
      %> 
 <form name="select_course" action="<%=action%>" method="post" onsubmit="return check()">
<div align="center" style="margin-top:30px;">	
	<select name="select_courses">
		<option value="time">上课时间</option>
		<option value="teacher">授课教师老师</option>
		<option value="cno">课程编号</option>
	</select>
	<input type="text" name="condition" value="星期一">
	<input type="submit"  value="查询"/>
	</div>
</form>

        <%   
		Object result=request.getSession().getAttribute("select_Courses_result");
        List<Courses> list =(List<Courses>)result;  
        String first=(String)request.getSession().getAttribute("isfirst"); 
        String error="查询结果为空"; 
        List<Courses> flushList=null;
        request.getSession().setAttribute("select_Courses_result",flushList);
        if(list!=null){
        %>
        <table align="center">
       <tr>
         <th>课程编号</th>
         <th>课程名称</th>
         <th>授课教师</th>
         <th>先修课</th>
         <th>上课时间</th>
		 <th>上课地点</th>
		 <th>人数限制</th>
		 <th>已选人数</th>		
		 <th>修改</th> 
		 <th>删除</th> 		 
       </tr>
        <% 
           for(Courses course:list)
           {%>
         <tr>
              <td><%=course.getCuoId() %></td>
              <td><%=course.getCuoName() %></td>
              <td><%=course.getCuoTeacher()  %></td>
              <td><%=course.getCuoPro() %></td>
              <td><%=course.getCuoTime() %></td>
              <td><%=course.getCuoPosition() %></td>     
              <td><%=course.getCuoLimmit() %></td>
              <td><%=course.getCuoChoesd() %></td>
            <%
              String url="http://jimmysmile.site:8080/my_term_project_xuanke/admin/alter_course.jsp?CuoID=";
              String CuoID=course.getCuoId();
              String alterfo=url+CuoID;
          
              String alter=url+CuoID;
              String serveletUrl="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?";
              String delete=serveletUrl+"action=delete_course&Cno="+CuoID;
             %> 
              <td><a href="<%=alter%>"><input type="button"  value="修改"/></a></td>
              <td><a href="<%=delete%>"><input type="button"  value="删除"/></a></td>

           </tr>
             <%}
        }
               if(list==null && first=="notfirst"){
            	   request.getSession().setAttribute("isfirst","first");//刷新
       		%>
      <div>
      	 <p  align="center"><%=error%><p>
     </div>
       <% 
       }
      %>
        
   </table>
</body>
</html>