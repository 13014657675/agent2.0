<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
 	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">		
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Staff.js'></script> 
	<script type="text/javascript">
	function setname()
	{  
		var c_jobnumber=document.getElementsByName("agent.c_tjrgh")[0].value 
		Staff.get_name(c_jobnumber, getname);
		return false;
	}
	function getname(datas)
	{					 
		var c_tjrxm=document.getElementById("c_tjrxm");
		c_tjrxm.value=datas;	 
	} 		
	</script> 
</head> 
<body onload="setname()"> 	 			
	<html:form  action="/agent" onsubmit="return check_form(this)">
	<html:hidden property="jobname" value="agent_relation"/>
	<nested:nest property="agent">	 
	<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>
	<nested:hidden property="c_jobnumber" value="${param.c_jobnumber }"></nested:hidden>	
	<nested:hidden property="c_jobnm" value="add"></nested:hidden>
	<table width="100%" border="1" cellspacing="0">
		<tr>
					<td height="33" colspan="3" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							血缘关系添加
						</div>
					</td>
		</tr> 		
		<sql:query var="q1"  dataSource="${db_mssql}" sql="select * from t_staff where c_orgid=${param.c_orgid } and c_jobnumber='${param.c_jobnumber }'"></sql:query>
		<sql:query var="q2"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${q1.rows[0].c_orgid }"></sql:query>
		<sql:query var="q3"  dataSource="${db_mssql}" sql="select * from t_orgtype where c_no =${q2.rows[0].c_orgtypeid } "></sql:query>
		<tr>
		<td width="50%" align="right">机构类型</td>
		<td>${q3.rows[0].c_name }</td>
		</tr>
		<tr>
		<td width="50%" align="right">机构名称</td>
		<td>${q2.rows[0].c_name }</td>
		</tr>
		<tr>
		<td width="50%" align="right">工号</td>
		<td>${q1.rows[0].c_jobnumber }</td>
		</tr>
		<tr>
		<td width="50%" align="right">姓名</td>
		<td>${q1.rows[0].c_name }</td>
		</tr>	 
		<tr>
		<td width="50%" align="right">业务政策</td>
		<td>
			<!-- 直营 -->
			<sql:query var="a1"	sql="select * from t_policy where c_ptnature=3001 and c_system=1  order by c_system"	dataSource="${db_mssql}"></sql:query>
			<nested:select property="c_system">
			<c:forEach items="${a1.rows }" var="row">						
			<option value="${row.c_system}">${row.c_name}</option> 
			</c:forEach>		
			</nested:select>
		</td>
		</tr>	
		<tr>
		<td width="50%" align="right">推荐人工号</td>
		<td>
		<nested:text property="c_tjrgh" value="0000000000" styleId="req" title="推荐人工号必须填写" onchange="setname()"></nested:text>
		</td>
		</tr>	
		<tr>
		<td width="50%" align="right">推荐人姓名</td>
		<td>
		<input name="c_tjrxm" id="c_tjrxm" value="系统">
		</td>
		</tr>	
		<tr>
		<td width="50%" align="right">开始日期</td>
		<td>
		<nested:text property="c_ksrq" value="" maxlength="8" styleId="req" title="开始日期必须填写"></nested:text>
		</td>
		</tr>	
		</nested:nest>
		<tr>
			<td width="50%" align="right">
					<html:submit value=" 确 定 " /> 			 
		  	</td>
		  	<td>
		  			<html:reset value=" 重 置 " /> 	
		  	</td>
		</tr>
	</table>
	</html:form>	
</body>
</html:html>