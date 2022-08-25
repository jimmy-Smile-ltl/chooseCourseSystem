<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
	<link rel="stylesheet" href="../resource/css/forgetPW.css"> 
<meta charset="UTF-8">
<title>修改学生密码</title>
<script>
	function validateForget(){
		var id=document.forms["forgetPW"]["Id"].value;
		var phone=document.forms["forgetPW"]["Phone"].value;
		var newpwd1=document.forms["forgetPW"]["newPwd1"].value;
		var newpwd2=document.forms["forgetPW"]["newPwd2"].value;
		
		if (id==""){
			 alert("请输入用户名!");
	         return false;
		}
		if(phone==""){
			 alert("请输入密保手机!");
	         return false;
		}
		if(newpwd1 != newpwd2){
			alert("两次密码输入不一致");
	        return false;
		}
	}
</script>
</head>
<body>
<canvas id="canvas"></canvas>
	<div class="forget-body">
	<div class="forgettop">   

    <span>忘记密码</span>
    </div>

	    <form method="POST" name="forgetPW" onsubmit="return validateForget()" action="http://jimmysmile.site:8080/my_term_project_xuanke/forgetServlet?action=forgetPW"><!--  -->
			<div class="tr">
		    	<span>账 号</span><input name="Id" placeholder="请输入你的账号" type="text" class="dfinput" />
		    	</div>
		    <div class="tr">
		    	<span>手机号码</span><input name="Phone" placeholder="请输入你绑定的手机号" type="text" class="dfinput" />
		    	</div>
		    <div class="tr">
			    <span>新 密 码 </span><input name="newPwd1"  type="password" class="dfinput" />
			    </div>
			<div class="tr">
			    <span>确  认</span><input name="newPwd2" type="password" class="dfinput" />    
			   </div> 
			   <div class="choice">
					<div class="tr-choice ">
						<input type="radio" name="who" value="student" checked="checked">
						<text>学生</text>
					</div>
					<div class="tr-choice "> 
						<input type="radio" name="who" value="admin">
						<text>管理员</text>
					</div>
				</div>
		     	 <input id="submit" type="submit" value="修改密码" onclick="vatrdateForget()"/>
		    </form>
	
		</div>
	<div class="contact" >
		开发人员联系方式：点击<a href="http://jimmysmile.site:8080/my_term_project_xuanke/forget/about.jsp">这里</a>
    </div>

</body>
<script src="../resource/js/forgetPW.js">

</script>

</html>