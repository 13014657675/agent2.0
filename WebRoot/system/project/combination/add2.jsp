<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">		
	<sql:query var="q1" dataSource="${db_mssql }" sql="select c_o,c_name from vb_processor where c_projectclass=${param.c_projectclass }"></sql:query> 	
</head>		
	<body>		 
		<html:form  action="/project" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="combination"/>
		<nested:nest property="processor">	
		<nested:hidden property="c_jobnm" value="add"></nested:hidden>   
		<nested:hidden property="c_projectclass" value="${param.c_projectclass }"></nested:hidden>   
		<table width="100%" border="1" cellspacing="0" id="tb1">
			<tr>
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						项目添加
					</div>
				</td>
			</tr> 	 
			<tr>
				<td   colspan="2"><div align="right">中文名称</div></td>
				<td   colspan="2"><div align="lefts">
				<nested:text property="c_name" value="" size="80" styleId="req" title="中文名称必须填写"></nested:text>
				</div></td> 
			</tr> 		 
			<tr>
				<td width="15%"><div align="center">公式</div></td>
				<td width="35%" nowrap="nowrap"><div align="center">	
				<nested:select property="c_t1" styleId="c_t1" value="1" onchange="js_t(this,'s1')">
				<html:option value="1">地址</html:option>
				<html:option value="2">数字</html:option> 
				</nested:select><div id="s1" name="s1"></div>				 
				</div>				 
				</td>
				<td width="15%"><div align="center">
				<nested:select property="c_op">
				<html:option value="1">加</html:option>
				<html:option value="2">减</html:option>
				<html:option value="3">乘</html:option>
				<html:option value="4">除</html:option>
				</nested:select></div>
				</td>
				<td width="35%"><div align="center">
				<nested:select property="c_t2" styleId="c_t2" value="1" onchange="js_t(this,'s2')">
				<html:option value="1">地址</html:option>
				<html:option value="2">数字</html:option> 
				</nested:select><div id="s2" name="s2"></div>	
				</div></td> 
			</tr> 			 
			</nested:nest>		
			<tr>
				<td colspan="2" align="right" ><html:submit value=" 确 定 "/></td>
				<td colspan="2"><html:reset value=" 取 消 "/></td>				 
			</tr>		
		</table>	
	</html:form> 
	</body> 
</html:html>
<script type="text/javascript">	
	function js_t(t,s)
	{					
		var str='<div>';
		var address1='<select name="processor.c_o1">';
		<c:forEach items="${q1.rows }" var="row">
				address1+='<option value="${row.c_o }">${row.c_name }</option>' 
		</c:forEach>	
		address1+='</select>'  
		var address2='<select name="processor.c_o2">';
		<c:forEach items="${q1.rows }" var="row">
				address2+='<option value="${row.c_o }">${row.c_name }</option>' 
		</c:forEach>	
		address2+='</select>'  
		var v=t.value;	 
		//alert(v)
        if (v=='1'){//地址
        	if (s=='s1')
        	{
        	str+=address1;
        	str+='<input type="hidden" name="processor.c_x1" value="0">'
        	}
        	if (s=='s2')
        	{
        	str+=address2;
        	str+='<input type="hidden" name="processor.c_x2" value="0">'
        	}        	
        }
        if (v=='2'){//数字
        	if (s=='s1')
        	{
        	str+='<input type="hidden" name="processor.c_o1" value="0">';
        	str+='<input type="text" name="processor.c_x1" value="0">';      
        	}
        	if (s=='s2')
        	{
        	str+='<input type="hidden" name="processor.c_o2" value="0">';
        	str+='<input type="text" name="processor.c_x2" value="0">';      
        	}       		 	
        }       
        str+='</div>'        
        var ss=document.getElementById(s); 
        ss.innerHTML=str;
        ss.style.display = "block"; 
	}
	var t1=document.getElementById("c_t1");
	var t2=document.getElementById("c_t2");
	js_t(t1,"s1")
	js_t(t2,"s2")
</script>	