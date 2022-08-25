/**判断输入格式是否合法
 * 
 */
		function isValid(str) { //判断输入是否为数字、字母、下划线组成
	    	   return /^\w+$/i.test(str);
	    	   }
	       function isNum(str) { //判断输入是否为数字
	    	   return /^\d+$/.test(str);
	    	   }
	       function isChar(str) { //判断输入是否为字母
	    	   return /^[a-zA-Z]+$/.test(str);
	    	   }
	       function isNum_Char(str) { //判断输入是否为字母与字母
	    	   return /^[a-zA-Z0-9]+$/.test(str);
	    	   }
		  function ischina(str) {//判断是否是中文
			    var reg=/^[\u4E00-\u9FA5]+$/;   /*定义验证表达式*/
			    return reg.test(str);     /*进行验证*/
			}
		function ischina_char(str) {//判断是否是中文
			    var reg=/^[a-zA-Z\u4E00-\u9FA5]+$/i;   /*定义验证表达式*/
			    return reg.test(str);     /*进行验证*/
			}