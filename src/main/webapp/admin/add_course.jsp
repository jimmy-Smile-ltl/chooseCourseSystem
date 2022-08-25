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
<title>新加课程</title>
         
           <script type="text/javascript">
       	<%// 反馈信息处理
    	request.setCharacterEncoding("UTF-8");
    	String message=String.valueOf((request.getSession().getAttribute("add_courses_message")));
         message=message.replace("\n", " \\u000a");
    	%>
    		var message="<%=message%>";
    		if(message.length!=0&&message!="null"){
    			alert(message);
    			<% request.getSession().setAttribute("add_courses_message" ,"");%>
    		}
    		
           function addNewTr(){
        	     var tab = document.getElementById("add_courses_table");
        		 var rowNum = tab.rows.length;
        		 var newTR=tab.insertRow();
        		 newTR.innerHTML="<td><input name=\"CuoId\" type\"text\" value=\"course"+rowNum+"\"/></td>"+
        		 "<td><input name=\"CuoName\" type=\"text\" value=\"\"/></td>"+
        		"<td><input name=\"CuoTeacher\" type=\"text\" value=\"\"/></td>"+
               	"<td><input name=\"CuoPro\" type=\"text\" value=\"\"/></td>"+
				"<td><input name=\"CuoTime\" type=\"text\" value=\"\"/></td>"+
              	"<td><input name=\"CuoPosition\" type=\"text\" value=\"\"/></td>"+     
                "<td><input name=\"CuoLimit\" type=\"text\" value=\"100\"/></td>"+
                "<td><input name=\"CuoChosed\" type=\"text\" value=\"0\"/></td>";
		        tab.lastChild.appendChild(newTR); 
		        }
	           
	       function delete_last_row(){
	    	     var tab = document.getElementById("add_courses_table");
	    	     var rowNum = tab.rows.length;
	    	     if(rowNum>2){
	    	 　　　tab.deleteRow(rowNum-1);//删除一行
	    	     }
	    	     
	       }

	       function check_course(){
				 var id = document.getElementsByName("CuoId");
				 var limit = document.getElementsByName("CuoLimit");
				 var chosed = document.getElementsByName("CuoChosed");
					for (var i = 0; i < id.length; i++) {
						if(!isNum(id[i])){
							alert("");
							return false;
							break;
						}
						if(id[i].value.length==0){
							alert("课程编号不能为空");
							return false;
							break;
						}
						 var num_li=Number.parseInt(limit[i].value);
						 var num_cho=Number.parseInt(chosed[i].value);
						 if(num_li<=num_cho){
								alert("选课人数超过限制");
								return false;		
						 }						
					
					
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
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_student.jsp">新增学生</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_student.jsp">查找学生</a>
		</div>
		</div>
		<div id="operate-course"  class="box">
		  <div class="item-span">操作课程信息</div>
		    <div id="operate-stu" class="item-box">
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_course.jsp">查看课程</a>
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_course.jsp"  class="selected">添加课程</a>
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

<form name="add_course" onsubmit="return check_course()" action="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=add_courses" method="post">
<table id="add_courses_table">
       <tr>
         <th>课程编号（非空）</th>
         <th>课程名称</th>
         <th>授课教师</th>
         <th>先修课</th>
         <th>上课时间</th>
		 <th>上课地点</th>
		 <th>人数限制</th>
		 <th>已选人数</th>	
			 
       </tr>
         <tr>
 			  <td><input name="CuoId" type="text" value="course1"/></td>
              <td><input name="CuoName" type="text" value=""/></td>
              <td><input name="CuoTeacher" type="text" value=""/></td>
              <td><input name="CuoPro" type="text" value=""/></td>
              <td><input name="CuoTime" type="text" value=""/></td>
              <td><input name="CuoPosition" type="text" value=""/></td>     
              <td><input name="CuoLimit" type="text" value="100"/></td>
              <td><input name="CuoChosed" type="text" value="0"/></td>
        
           </tr>
          
		</table>
		<div align="right" style="margin-right:50px;">
		    <input type="button" value="添加一行" onclick="addNewTr()"/>
            <input type="button" value="删除最后一行" onclick="delete_last_row()"/>
		</div>
		<div align="center">
			<button type="submit" value="添加" >添加</button>
			<input type="reset" value="重置"/>
		</div>
</form>
</body>
</html>