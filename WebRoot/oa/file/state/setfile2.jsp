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
						�ļ�����
					</div>
				</td>
			</tr> 			
			<tr  >
				<td  align="center" width="25%">
				 	�ļ���
				</td>	
				<td  align="center" width="25%">
				 	�Ϲ�ʱ��  
				</td>				 	
				<td  align="center" width="25%">
				 	�Ϲ���ͣ��
				</td>	
				<td  align="center" width="25%">
				 	����
				</td>										
			</tr>			
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_file 
				where c_sys=1 and c_catalogid='${param.c_catalogid }' and c_no in (select c_fileid from t_fileJT where c_flag='0')  "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			 	<tr  >
				<td  align="center" width="25%">
				 	<A href="../../../upload/file/${row.c_save }">${row.c_name }</A>
				</td>	
				<td  align="center" width="25%">
				 	${row.c_datime }
				</td>		
				<html:form  action="/file" >
				<html:hidden property="jobname" value="file_update_del"/>
				<nested:nest property="file">	
				<nested:hidden property="c_jobnm" value="update"></nested:hidden> 
				<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden> 				
				<td  align="center" width="25%">
				 	 <nested:select property="c_flag" value="${row.c_flag }">
				 	 <html:option value="0">�Ϲ�</html:option>
				 	 <html:option value="1">ͣ��</html:option>
				 	 </nested:select>
				 	 </nested:nest>		 
				<td  align="center" width="25%">
				 	 <input type="submit" value=" ȷ�� "> 
				</html:form> 
			</tr>	
			</c:forEach> 	
		</table>	 
	</body> 
</html:html>
