<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetStudent" %>
<%@ page import ="java.util.List" %>
<%@ page import ="classes.Students" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新加学生</title>

<script type="text/javascript">
	<%// 反馈信息处理
	request.setCharacterEncoding("UTF-8");
	String message=String.valueOf((request.getSession().getAttribute("add_students_message")));
     message=message.replace("\n", " \\u000a");
	%>
		var message="<%=message%>";
		if(message.length!=0&&message!="null"){
			alert(message);
			<%request.getSession().setAttribute("add_students_message","");%>
		}
		

//输入合法性验证
	function add_student(){
		  var id = document.getElementsByName("stuId");
			for (var i = 0; i < id.length; i++) {
				if(id[i].value.length==0){
					alert("学号不能为空");
					return false;
					break;
				}				
			}
		}
	function add_one_row(){
	      var tab = document.getElementById("add_students_table");
		  var newTR=tab.insertRow();
		  var rowNum = tab.rows.length-1;
		  newTR.innerHTML=
			  "<td><input name=\"stuId\" type=\"text\" value=\"student"+rowNum+"\"/></td>"+
	          "<td><input name=\"stuName\" type=\"text\" value=\"\"/></td>"+
	          "<td><input name=\"stuGrage\" type=\"text\" value=\"\"/></td>"+
	          "<td><input name=\"stuProfess\" type=\"text\" value=\"\"/></td>"+
	          "<td><input name=\"stuInstitute\" type=\"text\" value=\"\"/></td>"+
	          "<td><input name=\"stuPwd\" type=\"text\" value=\"1234\"/></td>"+     
	          "<td><input name=\"stuPhhone\" type=\"text\" value=\"\"/></td>"+
	          "<td><input name=\"stuCourselearned\" type=\"text\" value=\"\"/></td>"; 
		  tab.lastChild.appendChild(newTR); 
		 
	       }

	 function delete_last_row(){
	     var tab = document.getElementById("add_students_table");
	     var rowNum = tab.rows.length;
	     if(rowNum>2){
	 　　　tab.deleteRow(rowNum-1);//删除一行
	     }
 		}
</script>
<link rel="stylesheet" type="text/css" href="../resource/css/admin-list.css">
<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../resource/css/table-course.css">
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
		<div class="selected">新增学生</div>
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
<%String action="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=add_students" ;%>
<form action="<%=action %>" method="post" onsubmit="return add_student()">
<table border="1" align="center" id="add_students_table" >
       <tr>
         <th>学号（非空）</th>
         <th>姓名</th>
         <th>年级</th>
         <th>专业</th>
         <th>学院</th>
		 <th>密码</th>
		 <th>手机号码</th>		
		 <th>已修课程</th>	
		 
       </tr>
              <tr>
              <td><input name="stuId" type="text" value="student1"/></td>
              <td><input name="stuName" type="text" value=""/></td>
              <td><input name="stuGrage" type="text" value=""/></td>
              <td><input name="stuProfess" type="text" value=""/></td>
              <td><input name="stuInstitute" type="text" value=""/></td>
              <td><input name="stuPwd" type="text" value="1234"/></td>     
              <td><input name="stuPhhone" type="text" value=""/></td>
              <td><input name="stuCourselearned" type="text" value=""/></td>         
              </tr>         
   </table>
    <p align="right" style="margin-right:50px">
    <input type="button"  value="添加一行" onclick="add_one_row()"/>
     <input type="button"  value="删除最后一行" onclick="delete_last_row()"/>
     </p>
   <p align="center"><button type="submit" value="添加">添加</button></p>
</form>
</body>
</html>