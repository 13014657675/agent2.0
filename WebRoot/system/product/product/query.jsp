<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true">  
<head>
	<html:base/>
	<script src="/tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Company.js'></script>
</head>
<body>
	<form action="../../../toModule.do?prefix=/system&page=/product/product/query2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						险种查询
					</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">性质</div></td>
				<td width="52%" >
				<div align="left">
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_namecode where c_type =30"></sql:query>				
				<select name="c_ptnature" onchange="set()">	
				<c:forEach items="${q1.rows }" var="row">
				<option value="${row.c_code }">${row.c_name }</option>
				</c:forEach>
				</select>
				</div>
				</td>
			</tr>		
			<tr>
				<td width="48%"><div align="right">保险公司</div></td>
				<td width="52%" >
				<div align="left"> 			
				<select name="c_companyid" id="c_companyid"> 
				</select>
				</div>
				</td>
			</tr>	 
	       <tr>
				<td width="48%"><div align="right"><html:submit value=" 下一步 "/></div></td>
				<td width="52%" >
				<div align="left"> 
				</div>
				</td> 
			</tr>
		</table>
		</form>
</body>
</html:html>

<script type="text/javascript">
			function set()
			{  
				var c_ptnature=document.getElementsByName("c_ptnature")[0].value   
				Company.get_company(c_ptnature, get_company)
				return false;
			}			
			 
			function get_company(datas)
			{	
				DWRUtil.removeAllOptions('c_companyid');					
				DWRUtil.addOptions('c_companyid', datas, 'value', 'label');  
			} 				
			set()	
			</script>
