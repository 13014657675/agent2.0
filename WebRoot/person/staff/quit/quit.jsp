<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
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
		<form action="../../../toModule.do?prefix=/person&page=/staff/quit/quit3.jsp?c_type=1" method="post"> 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							离司操作
						</div>
					</td>
				</tr>				 	
				<tr>
				<td align="right" width="50%">工号</td>
				<td> 
				<input  name="c_jobnumber" value="">
				</td>				
				</tr>					 
				<tr>
				<td align="right"><input type="submit" value="确 定"></td>
				<td><input type="reset" value="取 消"></td>				
				</tr>
				</table>		
		 	</form>
		<form action="../../../toModule.do?prefix=/person&page=/staff/quit/quit2.jsp" method="post"> 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							离司操作
						</div>
					</td>
				</tr>			
				<tr>
				<td align="right" width="50%">机构类型</td>
				<td> 
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order>=3  order by c_order "></sql:query>
				<select name="c_orgtypeid" id="c_orgtypeid" onchange="set()" style="width: 120">
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name } </option>
					</c:forEach>
				</select>
				</td>				
				</tr>	
				 				 
				<tr>
				<td align="right"><input type="submit" value="确 定"></td>
				<td><input type="reset" value="取 消"></td>				
				</tr>
				</table>		
		 	</form>
			</body>  
</html:html>
