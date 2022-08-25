<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3秒防刷</title>
<style type="text/css">
p{
font-family:黑体;
font-size: 40px;
text-align: center;
color:red;
}
body{
background-color:black;
}
</style>
	<script> 
		//取出传回来的参数error并与yes比较
		  var errori ='<%=request.getParameter("error")%>';
		  if(true){
		   		setTimeout(function () {
			    window.location = "http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp";
			}, 3000);
		   
		  }
		  
		</script>
</head>
<body>
<p>3秒防刷</p>

</body>
</html>