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
	<script type='text/javascript' src='../../../dwr/interface/Bankoutlets.js'></script> 	
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
			set2()		 
		} 
		function set2()
		{  
			var c_orgid=document.getElementsByName("bankoutlets.c_orgid")[0].value  
			Bankoutlets.get_outlets(c_orgid, get2);
			return false;
		}
		function get2(datas)
		{					
			DWRUtil.removeAllOptions('c_outletsid');					
			DWRUtil.addOptions('c_outletsid', datas, 'value', 'label'); 			 
		} 		 
	</script>
</head>		
	<body >		
		<html:form  action="/channel" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="bankrelate"/>
		<nested:nest property="bankoutlets">	 
		<nested:hidden property="c_jobnm" value="set"></nested:hidden> 
		<nested:hidden property="c_no"    value="1"></nested:hidden>   
		<nested:hidden property="c_orgid"    value="${param.c_orgid }"></nested:hidden>   
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						关联设置
					</div>
				</td>
			</tr> 					
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from  t_bankoutlets where c_orgid=${param.c_orgid }"> </sql:query>
			<tr>
			<td align="right">网点名称</td>
			<td>
				<nested:select property="c_outletsid" >	
				<c:forEach items="${q1.rows }" var="row">
				<html:option value="${row.c_no }">${row.c_name }</html:option>
				</c:forEach>			
				</nested:select>
			</td>
			</tr>
			<tr>
			<td align="right">渠道专员工号</td>
			<td><nested:text property="c_jobnumber" value="" title="渠道专员工号必需填写" styleId="req"></nested:text> </td>
			</tr> 
			<tr>
			<td align="right">开始日期</td>
			<td><nested:text property="c_ksrq" value="" title="开始日期必需填写" styleId="req"></nested:text> </td>
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
