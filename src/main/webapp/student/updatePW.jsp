<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.updatePW{
		text-align:center;
		width:300px;
		margin:10px  auto;
		line-height:30px;
	}
	.item{
      font-size: 20px;
      margin:10px 0;
 
	}
	.item  > input{
	     height: 20px;
   		 margin-left: 20px;
   		 width:180px;
   		 border: 1px solid #92ccc7;
	}
	.item > text{
	     display: inline-block;
		 width:80px;
		 text-align: justify;
	    text-justify:distribute-all-lines; 
	    text-align-last: justify;
	}
	#submit{
		margin:10px 20%;
		width:60%;
		
	}
	
</style>
<meta charset="UTF-8">
<title>修改学生密码</title>
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
			alert("同学，新旧密码是一样的");
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
<%	String StuID=String.valueOf((request.getSession().getAttribute("ID")));
	if(StuID.equals("null")){
		   response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
	}
%>

<link rel="stylesheet" type="text/css" href="../resource/css/list.css">
<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
</head>
<body>
 <div class="list">
    <li class="now">当前位置：修改密码</li>
      <li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/choose_course.jsp">继续选课</a></li>
    <li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/showCourse.jsp">已选课程</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/schudule.jsp">查看课表</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/myinfo.jsp">个人信息</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/alter_phone.jsp">密保手机</a></li>
	<li class="exit"><a href="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=exit">退出</a></li>
	<text class="welcome">欢迎学生：<%=StuID%></text>
    </div>

  <div class="updatePW">
    <h1 align="center">修改密码</h1>
	    <form method="POST" name="updatePW" onsubmit="return validateupdate()" action="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=updatePW"><!--  -->
		    	<div class="item"><text>旧密码 </text><input name="oldpwd" placeholder="请输入旧密码" type="text" class="dfinput" /></div>
			    <div class="item"><text>新密码 </text><input name="newPwd1" placeholder="请输入新密码" type="password" class="dfinput" /></div>
			    <div class="item"><text>确认</text><input name="newPwd2" placeholder="请确认" type="password" class="dfinput" /></div>	 
		        
		        	<input id="submit" type="submit"  value="修改密码" onclick="validateupdate()"/>
		
		    </form>
</div>

</body>
</html>