<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resource/css/admin-list.css">
<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
<style type="text/css">
.table{
width:300px;
margin:30px auto;
}
.title{
    font-size: 25px;
    margin: 25%;
}
.contact{
margin:40%;
}
</style>
<meta charset="UTF-8">
<title>修改管理员密码</title>
<!-- 输入验证 -->
<script>
	function validateupdate(){
		var oldpwd=document.forms["updatePW"]["oldpwd"].value;
		var newpwd1=document.forms["updatePW"]["newPwd1"].value;
		var newpwd2=document.forms["updatePW"]["newPwd2"].value;
		if(oldpwd==""){
			 alert("请输入旧密码!");
	         return false;
		}
		if(oldpwd== newpwd2){
			alert("管理员先生，新旧密码是一样的");
	        return false;
		}
		
		if(newpwd1 != newpwd2){
			alert("两次密码输入不一致");
	        return false;
		}
	}
</script>
<!-- 处理反馈 -->
		<%
		 request.setCharacterEncoding("UTF-8");
		 String message=String.valueOf((request.getSession().getAttribute("update_message")));
		 %>
<script>
	var message="<%=message %>"
	if(message.length!=0&&message!="null"){
		alert(message);
		<%request.getSession().setAttribute("update_message","");%>
	}
	
</script>
<%	String ID=String.valueOf((request.getSession().getAttribute("ID"))); %>
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
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_student.jsp">查找学生</a>
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
		<div class="selected">修改密码</div>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=exit">退出</a>
		</div>
		</div>
</div>


<div class="table">
    <span class="title">修改密码</span>
	    <div>
	    <form method="POST" name="updatePW" onsubmit="return validateupdate()" action="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=updatePW"><!--  -->
		    
		    <table>
		    	<tr><td>&nbsp;&nbsp;&nbsp;旧 密 码</td><td><input name="oldpwd" placeholder="请输入原密码" type="text" class="dfinput" /></td></tr>
			    <tr><td>&nbsp;&nbsp;&nbsp;新 密 码</td><td><input name="newPwd1" placeholder="请输入新密码" type="password" class="dfinput" /></td></tr>
			    <tr><td>&nbsp;&nbsp;&nbsp;确&nbsp;&nbsp;&nbsp;认 	</td><td><input name="newPwd2" placeholder="确认新密码" type="password" class="dfinput" /></td></tr>    	 
		        <tr><td>&nbsp;&nbsp;&nbsp;<input name="" type="submit" class="scbtn1" value="修改密码" onclick="validateupdate()"/></td>
			   		<td>&nbsp;&nbsp;&nbsp; <input name="" type="reset" class="scbtn1" value="重置" onclick="validateupdate()"/></td></tr>
		    </table>	
		    </form>
		    </div>
		    </div>
	    <span class="contact">开发人员联系方式：1111111111 参见<a href="http://jimmysmile.site:8080/my_term_project_xuanke/login/about.jsp">关于</a></span>

</body>
</html>