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
						薪酬系数添加
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="48%"><div align="right">基本系数名称</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_var" value="" styleId="req" title="基本系数名称不能为空 "></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">对应指标名称</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="对应指标名称不能为空 "></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">数据类型</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select property="c_input">
					<html:option value="11">手动输入指标</html:option>
					<html:option value="21">系统提取指标</html:option>
					</nested:select>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">数据有效期</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select property="c_period">
					<html:option value="1">月度</html:option>
					<html:option value="3">季度</html:option>
					<html:option value="12">年度</html:option>
					</nested:select>
				</div>
				</td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select c_no,c_name from tb_projectclass "></sql:query>
			<tr>
				<td width="48%"><div align="right">处理器类型</div></td>
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
				<td width="48%"><div align="right">处理器</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select property="c_o" styleId="c_o"></nested:select>
				</div>
				</td>
			</tr>
			</nested:nest>		
			<tr>
				<td width="48%" align="right"><html:submit value="确 定"/></td>
				<td width="52%" colspan="2">
					<html:reset  value="取 消" />
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 	 
</html:html>
