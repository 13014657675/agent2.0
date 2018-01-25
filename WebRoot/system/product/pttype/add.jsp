<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Product.js'></script> 	
	
</head>		
	<body>		
		<html:form  action="/product" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="pttype"/>
		<nested:nest property="product">	
		<nested:hidden property="c_no" value="1"></nested:hidden> 
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						产品类型添加
					</div>
				</td>
			</tr> 	 
			<tr>
				<td width="48%"><div align="right">性质</div></td>
				<td width="52%" >
				<div align="left">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_namecode where c_type=30"></sql:query>
					<nested:select property="c_ptnature" onchange="set()">
					<c:forEach items="${q1.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach>
					</nested:select>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">产品分类</div></td>
				<td width="52%" >
				<div align="left"> 
					<nested:select property="c_ptclassid" styleId="c_ptclassid">					 
					</nested:select>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">类型</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="类型不能为空 "></nested:text>
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
<script type="text/javascript">
			function set()
			{   
				var c_ptnature=document.getElementsByName("product.c_ptnature")[0].value  				
				Product.get_ptclass(c_ptnature, get);
				return false;
			}
			function get(datas)
			{	
				DWRUtil.removeAllOptions('c_ptclassid');					
				DWRUtil.addOptions('c_ptclassid', datas, 'value', 'label'); 
			} 	
			set()	 
</script>