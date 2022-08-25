/**
 * 分页函数
 * pno--页数
 * psize--每页显示记录数
 * 分页部分是从真实数据行开始，因而存在加减某个常数，以确定真正的记录数
 * 纯js分页实质是数据行全部加载，通过是否显示属性完成分页功能
 **/
		
		function goPage(pno,psize){	
			 sessionStorage.setItem("now_page", pno);
			  var itable = document.getElementById("show");
			  var num = itable.rows.length-1;//表格所有行数(所有记录数)
			  //console.log(num);
			  var totalPage = 0;//总页数
			  var pageSize = psize;//每页显示行数
			  //总共分几页
			  if(num/pageSize > parseInt(num/pageSize)){
			      totalPage=parseInt(num/pageSize)+1;
			    }else{
			      totalPage=parseInt(num/pageSize);
			    }
			  var currentPage = pno;//当前页数
			  var startRow = (currentPage - 1) * pageSize+2;//开始显示的行 2  因为第一行标签必须显示
			    var endRow = currentPage * pageSize+1;//结束显示的行  11
			    endRow = (endRow > num+1)? num+1 : endRow;  //40
			    //console.log(endRow);
			    //遍历显示数据实现分页
			  for(var i=1;i<(num+2);i++){  
			    var irow = itable.rows[i-1];
				if(i==1){ // 第一行不受翻页影响
				  irow.style.display = "";
				}
			    else if(i>=startRow && i<=endRow ){
			      irow.style.display = "";
			    }
				else{
			      irow.style.display = "none";
			    }
			  }
			  var tempStr = "<span class='pageinfo'>共 "+num+" 条记录   分 "+totalPage+" 页 当前第 <now_page>"+currentPage+"</now_page> 页</span>";
			  if(currentPage>1){
			    tempStr += "<a href=\"#\" onClick=\"goPage("+(1)+","+psize+")\">首页</a>";
			    tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage-1)+","+psize+")\">上一页</a>"
			  }else{
			    tempStr += "首页       ";
			    tempStr += "上一页   ";
			  }
			  if(currentPage<totalPage){
			    tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage+1)+","+psize+")\">下一页</a>";
			    tempStr += "<a href=\"#\" onClick=\"goPage("+(totalPage)+","+psize+")\">尾页</a>";
			  }else{
			    tempStr += "下一页   ";
			    tempStr += "尾页";
			  }
			  document.getElementById("page-info").innerHTML = tempStr;
			 
			}
	
	window.onload=function(){
	//<!-- 页数复位 -->
	  var nowpage= sessionStorage.getItem("now_page")
		console.log("nowpage")
		if(nowpage===null){
			document.getElementsByTagName("table")[0].onload=goPage(1,15)
			console.log("空值")
		}
		else{
			console.log(Number(nowpage))
			console.log(document.getElementsByTagName("body"))
			console.log(document.getElementsByTagName("body")[0])
			document.getElementsByTagName("body")[0].onload=goPage(Number(nowpage),15)
		}
		}
		
	/**
 * 
 */