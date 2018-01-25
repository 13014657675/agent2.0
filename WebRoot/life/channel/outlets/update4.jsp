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
	<body>		
		<html:form  action="/channel" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="outlets"/>
		<nested:nest property="bankoutlets">	 
		<nested:hidden property="c_jobnm" value="update"></nested:hidden> 
		<nested:hidden property="c_no"    value="${param.c_no }"></nested:hidden>   
		<nested:hidden property="c_orgid"    value="${param.c_orgid }"></nested:hidden>   
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_bankoutlets where c_no=${param.c_no }"></sql:query>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						网点修改
					</div>
				</td>
			</tr> 				 
			<tr>
			<td align="right">银行名称</td>
			<td> 
				<sql:query var="query5"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=15"></sql:query>
				<nested:select property="c_bank" value="${q1.rows[0].c_bank }">
					<c:forEach var="row2" items="${query5.rows}" >		
						<html:option value="${row2.c_code }">${row2.c_name }</html:option>
					</c:forEach>
				</nested:select>
			</td>				
			</tr>
			<tr>
			<td align="right">网点代码</td>
			<td><nested:text property="c_code" value="${q1.rows[0].c_code }" title="网点代码必需填写" styleId="req"></nested:text> </td>
			</tr>
			<tr>
			<td align="right">网点名称</td>
			<td><nested:text property="c_name" value="${q1.rows[0].c_name }" size="30" title="网点名称必需填写" styleId="req"></nested:text> </td>
			</tr>
			<tr>
			<td align="right">电话</td>
			<td><nested:text property="c_phone" value="${q1.rows[0].c_phone }" ></nested:text> </td>
			</tr>
			<tr>
			<td align="right">地址</td>
			<td><nested:text property="c_address" value="${q1.rows[0].c_address }" size="50"></nested:text> </td>
			</tr>			
			<tr>
				<td width="48%" align="right"><input type="submit" value=" 确定 "></td>
				<td width="52%" > <input type="reset" value=" 取消 ">
				</td> 
			</tr>		
		</table>	
		</nested:nest>
	</html:form>
	</body> 
</html:html>
