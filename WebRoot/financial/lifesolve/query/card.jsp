<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>代理人银行卡号查询</title>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 
	<script type="text/javascript">
		function set()
		{  
			var c_orgtypeid=document.getElementsByName("c_orgtypeid")[0].value   
			Organization.get_typeorg(c_orgtypeid, get);
			return false;
		}
		function get(datas)
		{					 
			DWRUtil.removeAllOptions('c_orgid');					
			DWRUtil.addOptions('c_orgid', datas, 'value', 'label'); 			 
		} 		 
	</script>
</head>
<body onload="set()">
	<form action="../../../toModule.do?prefix=/financial&page=/lifesolve/query/card2.jsp" method="post" onsubmit="return check_form(this)">  
	<table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
					代理人银行卡号查询
				</td>
			</tr> 		 		 
		<tr>
			  <td align="right" width="50%">代理人所属机构的机构类型</td>
			  <td width="57%" align="left">
					<select name="c_orgtypeid"  onchange="set()" style="width: 120">
					<sql:query var="a1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order>=3 order by c_order "></sql:query>
					<c:forEach items="${a1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>  
			  </td>
		</tr>	 		 
		<tr>
		<td align="right"><input type="submit" value="下一步 "></td>
		<td>
		</table>  
	</form>	
	 
</body>
</html:html>
