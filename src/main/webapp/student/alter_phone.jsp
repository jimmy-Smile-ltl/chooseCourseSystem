<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密保手机</title>
<%
		String message=String.valueOf((request.getSession().getAttribute("alter_phone_message")));
		%>
		<script>
		var message="<%=message%>";
		if(message.length!=0&&message!="null"){
			alert(message);
			
			
		}
		<% request.getSession().setAttribute("alter_phone_message","");%>
		</script>
		<% 
	String StuID=String.valueOf((request.getSession().getAttribute("ID")));
		if(StuID.equals("null")){
			   response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
		}
	String action ="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=alter_phone";
%>
		
</head>
	<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="../resource/css/list.css">
<style type="text/css">
	.alter_phone{
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
<body>
 	<div class="list">
    <li class="now">当前位置：密保手机</li>
    <li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/choose_course.jsp">继续选课</a></li>
    <li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/showCourse.jsp">已选课程</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/schudule.jsp">查看课表</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/myinfo.jsp">个人信息</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/updatePW.jsp">修改密码</a></li>
	<li class="exit"><a href="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=exit">退出</a></li>
	<span class="welcome">欢迎学生：<%=StuID%></span>
    </div>
    <div class="alter_phone">
	<h2>本学期已选课程</h2>	

	    <form method="POST" name="alter_phone" onsubmit="return validate_alter_phone()" action="<%=action%>"><!--  -->  
		
		    <div class="item"><text>原号码</text> <input name="newphone" type="text" class="dfinput" /></div>
			<div class="item"><text>新号码</text><input name="newphone" type="text" class="dfinput" /> 	 </div>
			 <input id="submit" type="submit" value="提交" onclick="validate_alter_phone()"/>
		    </form>
		    </div>
		    
</body>
</html>