<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<sql:query var="q1" dataSource="${db_mssql }" sql="select c_pid c_xid ,c_name from tb_param  
						union select c_o c_xid ,c_name from vb_processor where c_projectclass=${param.c_projectclass } order by c_xid"></sql:query>
	<script type="text/javascript">
	function addfj()
	{ 
		var param="<select name='processor.c_xid'>"
		<c:forEach items="${q1.rows }" var="row">
		param+="<option value=${row.c_xid }>${row.c_name }</option>"
		</c:forEach>			
		param+="</select>"
		var row=tb1.insertRow(tb1.rows.length-1);		
		var cell1 = row.insertCell();
		cell1.align="center";
		cell1.innerHTML="<td >${param.c_name } </td>";		
		var cell2 = row.insertCell(); 
		cell2.align="center";
		cell2.innerHTML="<td  >${param.c_proc }</td>";		
		var cell3 = row.insertCell(); 
		cell3.align="center";
		cell3.innerHTML="<td  >"+param+"</td>";			
		var cell4 = row.insertCell(); 
		cell4.align="center";
		cell4.innerHTML="<td  ><input type=button onclick=deleteitem(this,'tb1') value='删除本行' id=del ></td>";			 
	}	
	function deleteitem(obj,id)
    {
     	var rowNum,curRow;
     	curRow = obj.parentNode.parentNode;
	 	rowNum = eval("document.all."+id).rows.length - 1;
     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
    }  
	</script> 
</head>		
	<body>		
		<html:form  action="/project" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="function"/>
		<nested:nest property="processor">	
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 		
		<nested:hidden property="c_projectclass" value="${param.c_projectclass }"></nested:hidden>
		<nested:hidden property="c_name" value="${param.c_name }"></nested:hidden> 
		<nested:hidden property="c_proc" value="${param.c_proc }"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0" id="tb1">
			<tr>
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						函数添加
					</div>
				</td>
			</tr> 	 
			<tr>
				<td width="25%"><div align="center">中文名称</div></td>
				<td width="25%"><div align="center">英文名称</div></td>
				<td width="25%"><div align="center">参数</div></td>
				<td width="25%"><div align="center"></div></td>
			</tr> 			 
			</nested:nest>		
			<tr>
				<td width="50%" align="right" colspan="2"><input type="button" value="增加一行" onclick="addfj()"></td>
				<td width="50%" colspan="2"><html:submit value=" 确  定 "/></td>				 
			</tr>		
		</table>	
	</html:form> 
	</body> 
</html:html>
