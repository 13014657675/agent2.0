<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
</head>		
	<body>   
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						工具设置
					</div>
				</td>
			</tr> 			
			<tr  >
				<td  align="center" width="25%">
				 	文件名
				</td>	
				<td  align="center" width="25%">
				 	上挂时间  
				</td>				 	
				<td  align="center" width="25%">
				 	上挂与停挂 
				</td>	
				<td  align="center" width="25%">
				 	操作
				</td>										
			</tr>			
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_file 
				where c_sys=2 and c_catalogid=${param.c_catalogid }   "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			 	<tr  >
				<td  align="center" width="25%">
				 	<A href="../../../upload/tool/${row.c_save }">${row.c_name }</A>
				</td>	
				<td  align="center" width="25%">
				 	${row.c_datime }
				</td>		
				<html:form  action="/tool" >
				<html:hidden property="jobname" value="tool_update_del"/>
				<nested:nest property="file">	
				<nested:hidden property="c_jobnm" value="update"></nested:hidden> 
				<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden> 				
				<td  align="center" width="25%">
				 	 <nested:select property="c_flag" value="${row.c_flag }">
				 	 <html:option value="0">上挂</html:option>
				 	 <html:option value="1">停挂</html:option>
				 	 </nested:select>
				 	 </nested:nest>						
				<td  align="center" width="25%">
				 	 <input type="submit" value=" 确定 ">
				</td>									
				</html:form> 
			</tr>	
			</c:forEach> 	
		</table>	 
	</body> 
</html:html>
