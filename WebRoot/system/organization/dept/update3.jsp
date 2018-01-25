<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">			
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 	
</head>		
	<body>	
			<sql:query var="orgtypeid" dataSource="${db_mssql }" sql="select * from t_organization  where c_no=${param.c_orgid } "></sql:query> 
			<sql:query var="orgtype" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${orgtypeid.rows[0].c_orgtypeid } "></sql:query>
			
			<c:if test="${orgtype.rows[0].c_order==3 }"> 
			<sql:query var="q" dataSource="${db_mssql }" sql="select * from t_dept where c_orgid=${param.c_orgid } order by c_ptnature"></sql:query> 			
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						部门修改
					</div>
				</td>
			</tr> 					 
			<tr>
				<td width="25%"><div align="center">性质</div></td>
				<td width="25%"><div align="center">政策体系</div></td>
				<td width="25%"><div align="center">部门名称</div></td>
				<td width="25%" align="center">修改</td>
			</tr> 
			<c:forEach items="${q.rows }" var="row">			 
			<tr>
				<html:form  action="/organization" onsubmit="return check_form(this)">
				<html:hidden property="jobname" value="dept"/>
				<nested:nest property="organization">	
				<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>				
				<td width="25%"><div align="center">
				<sql:query var="qa" dataSource="${db_mssql }" sql="select * from t_namecode where c_type =30 and c_code =${row.c_ptnature }"></sql:query>
				<c:choose>
				<c:when test="${empty qa.rows[0].c_name }">
				管理部门
				</c:when>
				<c:when test="${not empty qa.rows[0].c_name }">
				${qa.rows[0].c_name }事业部
				</c:when>
				</c:choose>		 
				<nested:hidden property="c_ptnature" value="${row.c_ptnature }"></nested:hidden>
				</div></td>				
				<td width="25%"><div align="center">
				<sql:query var="qb" dataSource="${db_mssql }" sql="select * from t_policy 
					where c_ptnature=${row.c_ptnature } and c_system=${row.c_system } "></sql:query>
				${qb.rows[0].c_name }
				<nested:hidden property="c_system" value="${row.c_system }"></nested:hidden>
				</div></td>						
				<td width="25%"><div align="center"><nested:text property="c_name" value="${row.c_name }"></nested:text></div></td>
				<td width="25%" align="center">								
				<nested:hidden property="c_jobnm" value="update"></nested:hidden>   
				<html:submit value="修 改"/>					
				</td>
				</nested:nest>					
				</html:form> 
			</tr>  
			</c:forEach>				 
			</table>		
			</c:if>			
			
			<c:if test="${orgtype.rows[0].c_order==4 }"> 
			<sql:query var="q" dataSource="${db_mssql }" sql="select * from t_dept where c_orgid=${param.c_orgid } order by c_ptnature"></sql:query> 			
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						部门修改
					</div>
				</td>
			</tr> 					 
			<tr> 
				<td width="50%"><div align="center">部门名称</div></td>
				<td width="50%" align="center">修改</td>
			</tr> 
			<c:forEach items="${q.rows }" var="row">			 
			<tr>
				<html:form  action="/organization" onsubmit="return check_form(this)">
				<html:hidden property="jobname" value="dept"/>
				<nested:nest property="organization">	
				<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
				<nested:hidden property="c_ptnature" value="${row.c_ptnature }"></nested:hidden> 
				<td width="50%"><div align="center"><nested:text property="c_name" value="${row.c_name }"></nested:text></div></td>
				<td width="50%" align="center">								
				<nested:hidden property="c_jobnm" value="update"></nested:hidden>   
				<html:submit value="修 改"/>					
				</td>
				</nested:nest>					
				</html:form> 
			</tr>  
			</c:forEach>				 
			</table>		
			</c:if>			
			
			<c:if test="${orgtype.rows[0].c_order==5 }"> 
			<sql:query var="q" dataSource="${db_mssql }" sql="select * from t_dept where c_orgid=${param.c_orgid } order by c_ptnature"></sql:query> 			
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						部门修改
					</div>
				</td>
			</tr> 					 
			<tr> 
				<td width="50%"><div align="center">部门名称</div></td>
				<td width="50%" align="center">修改</td>
			</tr> 
			<c:forEach items="${q.rows }" var="row">			 
			<tr>
				<html:form  action="/organization" onsubmit="return check_form(this)">
				<html:hidden property="jobname" value="dept"/>
				<nested:nest property="organization">	
				<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
				<nested:hidden property="c_ptnature" value="${row.c_ptnature }"></nested:hidden> 
				<td width="50%"><div align="center"><nested:text property="c_name" value="${row.c_name }"></nested:text></div></td>
				<td width="50%" align="center">								
				<nested:hidden property="c_jobnm" value="update"></nested:hidden>   
				<html:submit value="修 改"/>					
				</td>
				</nested:nest>					
				</html:form> 
			</tr>  
			</c:forEach>				 
			</table>		
			</c:if>		
	</body> 
</html:html>
