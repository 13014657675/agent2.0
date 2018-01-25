<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Processor.js'></script>
	<script type="text/javascript">
			function set()
			{  
				var c_projectclass=document.getElementsByName("c_projectclass")[0].value   
				Processor.get_childpro(c_projectclass, get);
				return false;
			}
			function get(datas)
			{	
				DWRUtil.removeAllOptions('c_o');					
				DWRUtil.addOptions('c_o', datas, 'value', 'label'); 			 
			} 					 
			</script>
</head>		
	<body onload="set()">		
		<html:form  action="/pay" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="pcoefficient"/>
		<nested:nest property="pay">	
		<nested:hidden property="c_no" value="1"></nested:hidden> 
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						н��ϵ�����
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="48%"><div align="right">����ϵ������</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_var" value="" styleId="req" title="����ϵ�����Ʋ���Ϊ�� "></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">��Ӧָ������</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="��Ӧָ�����Ʋ���Ϊ�� "></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">��������</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select property="c_input">
					<html:option value="11">�ֶ�����ָ��</html:option>
					<html:option value="21">ϵͳ��ȡָ��</html:option>
					</nested:select>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">������Ч��</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select property="c_period">
					<html:option value="1">�¶�</html:option>
					<html:option value="3">����</html:option>
					<html:option value="12">���</html:option>
					</nested:select>
				</div>
				</td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select c_no,c_name from tb_projectclass "></sql:query>
			<tr>
				<td width="48%"><div align="right">����������</div></td>
				<td width="52%" >
				<div align="left">
					<select name="c_projectclass" id="c_projectclass" onchange="set()">
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">������</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select property="c_o" styleId="c_o"></nested:select>
				</div>
				</td>
			</tr>
			</nested:nest>		
			<tr>
				<td width="48%" align="right"><html:submit value="ȷ ��"/></td>
				<td width="52%" colspan="2">
					<html:reset  value="ȡ ��" />
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 	 
</html:html>
