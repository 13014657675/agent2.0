<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
</head>		
	<body >  
		<!-- 时间区间 -->
		<logic:equal value="1" parameter="type" scope="request">
			<sql:query var="q1" dataSource="${db_mssql }" sql="select a.*,c.c_no c_fileid ,c.c_name from t_filesigned a ,t_sprocess b ,t_file c
			where  b.c_sys=1 and a.c_no=b.c_sid and b.c_send='${sessionScope.c_jobnumber }' and a.c_fileid=c.c_no 
				and a.c_datime between '${param.date1 }' and '${param.date2 }'   "></sql:query>		
		</logic:equal>
		<!-- 签批号 -->
		<logic:equal value="2" parameter="type" scope="request">	
			<sql:query var="q1" dataSource="${db_mssql }" sql="select a.*,c.c_no c_fileid ,c.c_name from t_filesigned a ,t_sprocess b ,t_file c
			where  b.c_sys=1 and a.c_no=b.c_sid and b.c_send='${sessionScope.c_jobnumber }' and a.c_fileid=c.c_no 
				and a.c_no=${param.c_sid }  "></sql:query>		
		</logic:equal>
		<!-- 签批结束提醒 -->
		<logic:equal value="3" parameter="type" scope="request">	
				<sql:query var="q1" dataSource="${db_mssql }" sql="select a.*,c.c_no c_fileid ,c.c_name from t_filesigned a ,t_sprocess b ,t_file c
			where  b.c_sys=1 and a.c_no=b.c_sid and b.c_send='${sessionScope.c_jobnumber }' and a.c_fileid=c.c_no 
				and a.c_no in ( select c_sid from  t_sprompt where c_sys=1 and c_jobnumber = '${sessionScope.c_jobnumber }' and c_flag='0' )  "></sql:query>		
		</logic:equal>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						签批查询
					</div>
				</td>
			</tr> 			
			<tr>
				<td align="center" width="5%">签批号</td>
				<td align="center" width="15%">发文部门</td>
				<td align="center" width="15%">发文字号</td>
				<td align="center" width="50%">文件名</td>
				<td align="center" width="15%">操作</td>
			</tr>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
				<td align="center" width="5%">${row.c_no }</td>
				<td align="center" width="15%">${row.c_dname }</td>
				<td align="center" width="15%">${row.c_dcode }</td>
				<td align="center" width="50%">${row.c_name }</td>
				<td align="center" width="15%"><a   href="../../../toModule.do?prefix=/oa&page=/file/process/query3.jsp?c_no=${row.c_no }&c_fileid=${row.c_fileid }">查询</a></td>
			</tr>
			</c:forEach>					
		</table>		
	</body> 
</html:html>
