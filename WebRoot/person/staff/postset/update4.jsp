<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head> 
		<body>		 				
		<html:form  action="/staff" onsubmit="return check(this)">
		<html:hidden property="jobname" value="postset"/>
		<nested:nest property="staff">	 
		<nested:hidden property="c_no" value="0"></nested:hidden> 
		<nested:hidden property="c_orgid" value="${param.c_orgid}"></nested:hidden> 
		<nested:hidden property="c_jobnumber" value="${param.c_jobnumber }"></nested:hidden> 
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							职位或岗位调整
						</div>
					</td>
				</tr>				
				<tr>
				<td width="48%"><div align="right">职位名称</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select  property="c_postid1" value="-1">
					<html:option value="-1">无</html:option>
					<sql:query var="q1" dataSource="${db_mssql }" sql="select b.c_name dept ,a.* from t_post a,t_dept b  
						where a.c_deptid=b.c_no and a.c_type=1 and a.c_orgid=${param.c_orgid}"></sql:query>					
					<c:forEach items="${q1.rows }" var="row">
					<html:option value="${row.c_no }">${row.dept }- ${row.c_name }</html:option>
					</c:forEach>					
					</nested:select>
				</div>
				</td>
				</tr>  
				<tr>
				<td width="48%"><div align="right">岗位名称</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select  property="c_postid2" value="-1">
					<html:option value="-1">无</html:option>
					<sql:query var="q2" dataSource="${db_mssql }" sql="select b.c_name dept ,a.* from t_post a,t_dept b  
						where a.c_deptid=b.c_no and a.c_type=2 and a.c_orgid=${param.c_orgid}"></sql:query>
					<c:forEach items="${q2.rows }" var="row">
					<html:option value="${row.c_no }">${row.dept }- ${row.c_name }</html:option>
					</c:forEach>										
					</nested:select>
				</div>
				</td>
				</tr> 
				<tr>
				<td width="48%"><div align="right">兼职名称</div></td>
				<td width="52%" >
				<div align="left"> 
					<sql:query var="q3" dataSource="${db_mssql }" sql="select b.c_name dept ,a.* from t_post a,t_dept b  
						where a.c_deptid=b.c_no and a.c_orgid=${param.c_orgid} order by a.c_deptid"></sql:query>					
					<c:forEach items="${q3.rows }" var="row3">
					<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_postset where c_jobnumber='${param.c_jobnumber }' and c_postid=${row3.c_no } "></sql:query>
					<c:if test="${not empty q4.rows[0].c_no}">
					 <input type="checkbox" name="staff.c_postid" value="${row3.c_no }" checked="checked">
					</c:if>
					<c:if test="${empty q4.rows[0].c_no }">
					<input type="checkbox" name="staff.c_postid" value="${row3.c_no }" >
					</c:if>			 
					${row3.dept }- ${row3.c_name }
					<br>					 
					</c:forEach>					 
				</div>
				</td>
				</tr> 
			</nested:nest>
			<tr>
				<td width="48%" align="right"><input type="submit" value=" 确 定 "></td>
				<td width="52%" > <input type="reset" value=" 取 消 ">
				</td> 
			</tr>		
			</table>  
		</html:form>	
</body>			 
</html:html>
<script type="text/javascript">
function check()
{ 
	c_postid=document.getElementsByName("staff.c_postid");
	for ( i = 0 ; i < c_postid.length ; i++ )
	{
		if ( c_postid(i).checked ) // 复选框中有选中的框
		{
			//提交表单 
			return true;
		}
	} 
	c_postid1=document.getElementsByName("staff.c_postid1")[0];
	c_postid2=document.getElementsByName("staff.c_postid2")[0];
	if (c_postid1.value=='-1' && c_postid2.value=='-1')
	{
		alert("至少选一个职位（岗位）")
		return false;
	}
	else
	{ 
		//提交表单 
		return true;
	}	
}
</script>