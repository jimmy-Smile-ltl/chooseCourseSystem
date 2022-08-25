<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetCourse" %>
<%@ page import ="java.util.List" %>
<%@page import="classes.Courses"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课表</title>
	<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="../resource/css/list.css">
		<link rel="stylesheet" type="text/css" href="../resource/css/schudule.css">
<%String StuID=String.valueOf((request.getSession().getAttribute("ID"))); 
if(StuID.equals("null")){
	   response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
}
  GetCourse get=new GetCourse();
  List<Courses> list = get.getByTableName(StuID+"_course");
  String infos[]=new String [list.size()];//储存课程内容
  String locas[][]=new String [list.size()][3];//储存课程位置
	int count=0;
  		 int i=0;
           for(Courses course:list){
        	   String info=course.getCuoName()+"<br>"+course.getCuoTeacher()+"-"+course.getCuoPosition();
           		//System.out.print(info);
           		infos[i]=info;
           		String loca []=course.getSchudule();
           		locas[i]=loca;
           		System.out.println(loca[0]+"  "+loca[1]+"  "+loca[2]+"  ");
           		i++;
           }          
           %>

 <script>
function schudule(){
     var tb = document.getElementById('schudule_table');
	 var i=0;
	 var j=0;
	 var rowCount = tb.rows.length;  // 行数
	 var colCount=tb.rows[0].cells.length; //   列数  
	 // 遍历每一个单元格  
	 <%for(int m=0;m<list.size();m++){ %>  
		  	tb.rows[<%=locas[m][1]%>].cells[<%=locas[m][0]%>].innerHTML="<%=infos[m]%>";
		  	tb.rows[<%=locas[m][2]%>].cells[<%=locas[m][0]%>].innerHTML="<%=infos[m]%>";
		  	<%if(Integer.parseInt(locas[m][1])<Integer.parseInt(locas[m][2])-1){		
		  		int mid=Integer.parseInt(locas[m][2])-1;
		  		String mids=String.valueOf(mid);
		  		%>
		  		tb.rows[<%=mids%>].cells[<%=locas[m][0]%>].innerHTML="<%=infos[m]%>";
	 	
	 	<%
		  	} 		
		}
	%>
}
</script>
</head>
<body onLoad="schudule()">
	<div class="list">
    <li class="now">当前位置：查看课表</li>
    <li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/choose_course.jsp">继续选课</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/showCourse.jsp">已选课程</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/myinfo.jsp">个人信息</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/updatePW.jsp">修改密码</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/alter_phone.jsp">密保手机</a></li>
	<li class="exit"><a href="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=exit">退出</a></li>
	<span class="welcome">欢迎学生：<%=StuID%></span>
    </div>
<table id="schudule_table" > 
            <tr>
                <th></th>
                <th>星期一</th>
                <th>星期二</th>
                <th>星期三</th>
                <th>星期四</th>
                <th>星期五</th>
            </tr>
            <tr>
                <th>第一节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>      
            </tr>
            <tr>
            	<th>第二节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                
                
            </tr>
            <tr>
            	<th>第三节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>        
            </tr>
            <tr>
            	<th>第四节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>          
            </tr>
            <tr>
            	<th>第五节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
            	<th>第六节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>              
            </tr>        
            <tr>
            	<th>第七节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
            	<th>第八节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>                             
            </tr>
            <tr>
            	<th>第九节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>      
            </tr>
            <tr>
            	<th>第十节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>                            
            </tr>
            <tr>
            	<th>第十一节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>                             
            </tr>
            <tr>
            	<th>第十二节</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>                             
            </tr>
           
 </table>

</body>
</html>