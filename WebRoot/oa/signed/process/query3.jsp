<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<sql:query var="a0" dataSource="${db_mssql }" 
	sql="select * from t_orgtype  where c_no in (select c_orgtypeid from t_organization where c_no=${sessionScope.Staff.c_orgid })"></sql:query>
<c:if test="${not empty a0.rows[0] }">
<sql:query var="a1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order = 3 order by c_order "></sql:query>
</c:if>
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 
	<script type='text/javascript' src='../../../dwr/interface/Staff.js'></script>
	
</head>		
	<body> 
		<html:form  action="/signed" onsubmit="return check_form(this)"  >
		<html:hidden property="jobname" value="signed_return"/>
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_signed  where c_no =${param.c_no } "></sql:query>	
		<table width="100%" border="1" cellspacing="0"  >
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						签报查询
					</div>
				</td>
			</tr> 			
			<tr>
				<td width="25%"><div align="center">签批号</div></td>
				<td width="25%"><div align="center">${param.c_no }</div></td>
				<td width="25%"><div align="center">类型</div></td>
				<td width="25%"><div align="center">
				<c:choose>
				<c:when test="${q1.rows[0].c_type eq 31 }">项目签报</c:when>
				<c:when test="${q1.rows[0].c_type eq 32 }">费用签报</c:when>
				</c:choose>
				</div></td> 
			</tr>			 
			<tr>
				<td width="25%"><div align="center">内容</div></td>
				<td width="75%" colspan="3" >
				<div align="left"><textarea rows="10" cols="150" readonly="readonly">${fn:trim(q1.rows[0].c_note) }</textarea>
				</div>
				</td>					 
			</tr> 
			<c:choose>
				<c:when test="${q1.rows[0].c_type eq 31 }">
				<tr style="color: #828282">
					<td width="25%" ><div align="center">金额</div></td>
					<td width="75%" colspan="3" >				 
					<div >
						 0
					</div>
					</td>
				</tr> 	
				</c:when>
				<c:when test="${q1.rows[0].c_type eq 32 }">
				<tr style="color: #000000">
					<td width="25%" ><div align="center">金额</div></td>
					<td width="75%" colspan="3" >				 
					<div >
						 ${q1.rows[0].c_cost }
					</div>
					</td>
				</tr> 	
				</c:when>
			</c:choose>			
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_file where c_no=${q1.rows[0].c_fileid } "></sql:query>
			<c:if test="${not empty q3.rows[0] }">
				<tr>
					<td width="25%" ><div align="center">附件</div></td>
					<td width="75%" colspan="3" >				 
					<div >
						 <A href="../../../upload/signed/${q3.rows[0].c_save }">${q3.rows[0].c_name }</A>
					</div>
					</td>
				</tr> 	
			</c:if>					
			<tr>
				<td align="center" width="25%"> <b>姓名</b></td> 	 
				<td align="center" colspan="2" width="50%"><b>内容 </b></td>
				<td align="center" width="25%"><b>操作时间</td> 
			</tr>
			<sql:query var="q4" dataSource="${db_mssql }" sql="select distinct a.c_note,a.c_return,a.c_datime,b.c_name from t_sprocess a,t_staff b 
				where a.c_sys=3 and a.c_sid=${param.c_no } and a.c_send=b.c_jobnumber order by a.c_datime  "></sql:query>
			<c:forEach items="${q4.rows }" var="row">
			<tr>
				<td align="center"> ${row.c_name }</td> 	 
				<td align="left" colspan="2" >	
					<font color="red">
					<c:choose>
					<c:when test="${row.c_return eq 1 }">同意<br> </c:when>				
					<c:when test="${row.c_return eq 2 }">不同意<br> </c:when>	
					</c:choose>		
					</font> 
					<textarea rows="4" cols="100" readonly="readonly">${fn:trim(row.c_note) } </textarea>												 			 		
				 </td>
				<td align="center" >${row.c_datime }</td> 
			</tr>			
			</c:forEach>			 	
			</table></html:form>
			<!-- 修改提示表记录 -->
			<sql:update dataSource="${db_mssql }" sql="update t_sprompt set c_flag='1' where c_sys=3 and c_sid = ${param.c_no } and c_jobnumber ='${sessionScope.c_jobnumber }'  "></sql:update>			
	
	</body> 
</html:html>
