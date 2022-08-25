<%@page import="classes.Courses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetStudent" %>
<%@ page import ="java.util.List" %>
<%@ page import ="classes.Students" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resource/css/table-student.css">
<link rel="stylesheet" type="text/css" href="../resource/css/admin-list.css">
<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
<meta charset="UTF-8">
<title>查找学生</title>

<%	String ID=String.valueOf((request.getSession().getAttribute("ID"))); %>
<title>查找学生</title>

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
		<div class="selected">查找学生</div>
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

	<%
    String url="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=select_students";
    String condition=(String)request.getSession().getAttribute("condition")==null? "":(String)request.getSession().getAttribute("condition");
    String way=request.getSession().getAttribute("way")==null? "":(String)request.getSession().getAttribute("way");
      %> 
 <form name="select_students" action="<%=url%>" method="post" onsubmit="return check()">
<div align="center" style="margin-top:30px;">	
	<select id="select_ways" name="select_ways" onchange="set_input">
		<option value="sno"  <%if(way.equals("sno")){%> <%="selected=\"selected\"" %> <%} %>  >学号</option>
		<option value="profess" <%if(way.equals("profess")){%> <%="selected=\"selected\"" %> <%} %>>专业</option>
		<option value="grade"  <%if(way.equals("grade")){%> <%="selected=\"selected\"" %> <%} %>>年级</option>
		<option value="cno"   <%if(way.equals("cno")){%> <%="selected=\"selected\"" %> <%} %>>课程编号</option>
	</select>
	
	<input type="text" name="condition" id="condition" value=
	<%if(condition.equals("")||condition.equals("null")){ %>
					<%="20" %>
	<%}else{ %>    <%=condition %>    <%} %>
	/>
	<input type="submit"  value="查询"/>
 </div>

 </form> 
 
              

        <%
        
        List<Students> list =(List<Students>)request.getSession().getAttribute("select_students_result");  
        String error="查询结果为空";

        String first=(String)request.getSession().getAttribute("isfirst");      //是否第一次进入
        List<Students> flushList=null;
        request.getSession().setAttribute("select_students_result",flushList); 
        request.getSession().setAttribute("way","null"); 
        request.getSession().setAttribute("condition","null"); 
       if(list!=null){    %>   
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
              <td><%=student.getStuCourselearned() %></td> 
              <%
              String alter_url="http://jimmysmile.site:8080/my_term_project_xuanke/admin/alter_student.jsp?Sno=";
              String stuID=student.getStuId();
              String alter=alter_url+stuID;
              String serveletUrl="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?";
              String delete=serveletUrl+"action=delete_student&Sno="+stuID;
              %> 
              <td><a href="<%=alter%>"><input type="button"  value="修改"/></a></td>
              <td><a href="<%=delete%>"><input type="button"  value="删除"/></a></td>
           </tr>
             <%} %> 
          
          <%  }
       
       if(list==null && first=="notfirst"){
       		%>
      <div>
      	 <p  align="center"><%=error%><p>
     </div>
     
       <%
       }
       request.getSession().setAttribute("isfirst","first");//刷新
      %>
        
    </table>
       <div id="page-info"></div>

    </body>
        <script>
	function check(){
		var condi = document.getElementByName("condition");
		if(codi==""|condi=="null"){
			alert("搜索条件不能为空");
			return false;
		}
	}

</script>   
<script src="http://jimmysmile.site:8080/my_term_project_xuanke/resource/paging.js"></script>
    
    </html>