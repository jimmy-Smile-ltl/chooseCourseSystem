<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon" href="./resource/image/logo.png" type="image/x-icon">
		<link rel="stylesheet" href="./resource/css/index.css">  
		<title>欢迎登录选课系统</title>
		<%
		String message=String.valueOf((request.getSession().getAttribute("loginmessage")));
		%>
		<script>
		var message="<%=message%>";
		if(message.length!=0&&message!="null"){
			alert(message);
			
		}
		<% request.getSession().setAttribute("loginmessage","");%>
		</script>
		 <%// 生成验证码
			    String code="";
				String codes []={"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		        int len=codes.length;
		        int l=0;
		        while(l<6) {
		        	int m=(int) (Math.random()*len);
		        	code=code+codes[m];
		        	l++;
		        	}
			    %>
			     <script>
			    function validateLogin(){
			    	var Id=document.forms["LoginFrom"]["Id"].value;
					var password=document.forms["LoginFrom"]["Pwd"].value;
					var yzm=document.forms["LoginFrom"]["yzm"].value;
					var yzcode=document.getElementById("yzmcode").innerHTML;
					console.log("运行validate");
					console.log(yzcode);
			        if (Id ==""){
			         alert("请输入用户名!");
			         return false;
			        }
			       
			        else if (password ==""){
			         alert("请输入密码!");
			         return false;
			        }
					
					else if(yzm!=yzcode){
			       		alert("验证码错误");
			       		return false;
			        }    
			    }
			  
			    </script>
	</head>

	<body>
	<video autoplay="autoplay" muted="muted" loop="loop">
             <source src="./resource/video/index.mp4" type="video/mp4">
                   你的浏览器不支持播放视频
         </video>
		<div class="login-body">
		<div class="logintop">    
		    <span>欢迎登录选课系统	
		      <a  class="help" href="http://jimmysmile.site:8080/my_term_project_xuanke/login/help.jsp" title="帮助">
		      <image class="help" src="./resource/image/Help.png"  title="帮助"/>
		      </a>
		    
		    
		     </span>
	
		</div>	   
		    <form method="POST" name="LoginFrom" onsubmit="return validateLogin()" action="http://jimmysmile.site:8080/my_term_project_xuanke/loginServlet?action=login"   ><!--  -->
		    <div class="tr">
				   <span>账号</span>
				   <input name="Id" type="text" placeholder="请输入账号" value = "123456">
				   </div>
			<div class="tr">
				   <span>密码</span>
				   <input name="Pwd" type="password" placeholder="请输入密码" value="123456"/>
					</div>
			    <div class="tr">
				    <span>验证码</span>
				    <input name="yzm"  id="yzm" placeholder="请输入验证码" type="text" value="<%=code%>"/>
				    <text id="yzmcode"><%=code%></text>
			   	</div>
			      <div class="choice">
				    <div  class="tr-choice"><input name="remember_password" type="checkbox" value="" checked="checked" /><text>保存密码</text></div>
				  	<div  class="tr-choice"><input type="radio" name="who" value="student" checked="checked"><text>学生</text></div>
					<div  class="tr-choice"><input type="radio" name="who" value="admin"><text>管理员</text></div>
					</div>			
					
					<div class="buttons">	
				  	<button  type="submit" onclick="validateLogin()">提交</button>
				  	     <button name="cancel" type="reset">重置</button>
					</div>	
			    </form>
		   <div class="links">
		      <a href="http://jimmysmile.site:8080/my_term_project_xuanke/login/about.jsp">关于</a>
			   <a href="http://jimmysmile.site:8080/my_term_project_xuanke/login/forgetPW.jsp">忘记密码？</a>
			   
		   				    
		</div>
		</div>
		
		<div class="copyright" >©all copyright reserved  仅供<a style="text-decoration: none;" href="https://www.swufe.edu.cn/">SWUFE</a>选课使用</div>
	</body>
</html>