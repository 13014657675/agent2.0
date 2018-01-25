<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Sxbd.js'></script> 
	<script type="text/javascript">
		function set()
		{
			var c_companyid=document.getElementsByName("sxbd.c_companyid")[0].value 
			var c_tbd=document.getElementsByName("sxbd.c_tbd")[0].value 
			var c_jobnm=document.getElementsByName("sxbd.c_jobnm")[0].value 
			Sxbd.get_sxbdrq(c_companyid,c_tbd,c_jobnm, get);
			return false;
		}
		function get(data)
		{ 
			var c_date=document.getElementsByName("sxbd.c_date")[0]
			c_date.value=data;	 
		}
	</script>
</head>
<body onload="set()">  
		<c:choose>
		<c:when test="${param.c_type eq 1 }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxbd 
				where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_jobnm='0' and c_flag='0'"></sql:query>
		</c:when>
		<c:when test="${param.c_type eq 2 }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxbd 
				where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_jobnm='0' and c_flag='0'"></sql:query>
		</c:when>
		</c:choose>
		<html:form action="/sxbd">
		<html:hidden property="jobname" value="sxbdrq" />
		<nested:nest property="sxbd">  	
		<nested:hidden property="c_companyid" value="${q1.rows[0].c_companyid }"></nested:hidden>
		<nested:hidden property="c_tbd" value="${q1.rows[0].c_tbd }"></nested:hidden>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						保单日期修改
					</div>
				</td>
			</tr>					
			<tr>
				<td width="50%" align="right">保险公司</td>
				<td>
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${q1.rows[0].c_companyid }"></sql:query>
					${q2.rows[0].c_name }
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">投保单号</td>
				<td>
					${q1.rows[0].c_tbd }
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">保单号</td>
				<td>
					${q1.rows[0].c_bd }
				</td>
			</tr> 			
			<tr>
				<td width="50%" align="right">
					日期类型
				</td>
				<td>
					<nested:select property="c_jobnm" onchange="set()">
						<html:option value="a">投保日期</html:option>
						<html:option value="b">承保日期</html:option>
						<html:option value="c">回执日期</html:option>
					</nested:select>
				</td>
			</tr>  
			<tr>
				<td width="50%" align="right">日期修改为</td>
				<td>
					 <nested:text property="c_date" value="" styleId="req" title="日期修改为必须填写" maxlength="8"></nested:text>
				</td>
			</tr>			 
			</nested:nest>
			<tr>
				<td width="50%" align="right">
				<input type="submit" value=" 确 定 ">
				</td>
				<td width="50%" >
				<input type="reset" value=" 重 置 ">
				</td>
			</tr> 
		</table>
</html:form> 
</body>
</html:html>
