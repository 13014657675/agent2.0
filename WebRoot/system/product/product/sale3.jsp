<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<title>销售设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Product.js'></script> 		
</head> 
<body>
<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_product 
				where c_no=${param.c_no }"></sql:query>	
<sql:query var="q2" dataSource="${db_mssql }" sql="select a.c_code ptnature,b.c_no ptclass,c.c_no pttype from t_namecode a,t_ptclass b,t_pttype c
			where  a.c_code=b.c_ptnature and b.c_no=c.c_ptclassid and c.c_no=${q1.rows[0].c_pttypeid }"></sql:query>					
<html:form  action="/product" onsubmit="return check_form(this)">
<html:hidden property="jobname" value="add_update_delete"/>
	<nested:nest property="product">	
	<nested:hidden property="c_jobnm" value="set"></nested:hidden> 
	<nested:hidden property="c_no" value="${param.c_no }"></nested:hidden> 
	<nested:hidden property="c_pttypeid" value="${q1.rows[0].c_pttypeid }"></nested:hidden> 
	<nested:hidden property="c_code"   value="${q1.rows[0].c_code }"></nested:hidden> 
	<nested:hidden property="c_code_comp" value="${q1.rows[0].c_code_comp }"></nested:hidden> 	
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						销售设置
					</div>
				</td>
			</tr>	 			
			<tr>
				<td width="48%"><div align="right">保险公司</div></td>
				<td width="52%" >
				<div align="left">
				<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_company where c_type='${q1.rows[0].c_ptnature }' " ></sql:query>				
				<nested:select property="c_companyid" value="${q1.rows[0].c_companyid }">
				<c:forEach items="${q4.rows }" var="row">
				<html:option value="${row.c_no }">${row.c_name }</html:option>
				</c:forEach>
				</nested:select>
				</div>
				</td>
			</tr>	
			<tr>
				<td width="48%"><div align="right">险种名称</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_name" value="${q1.rows[0].c_name }" size="50" styleId="req" title="险种名称必须填写"></nested:text>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">销售</div></td>
				<td width="52%" >
				<div align="left">
				 <c:set target="${productForm.product }" property="c_flag" value="${q1.rows[0].c_flag }"></c:set>
				 <nested:radio property="c_flag" value="0">启售</nested:radio>
				 <nested:radio property="c_flag" value="1">停售</nested:radio>
				</div>
				</td>
			</tr>					  
			</nested:nest>	
			<tr>
				<td width="48%"><div align="right"><html:submit value="确 定"/></div></td>
				<td width="52%" >
				<div align="left">
					<html:reset  value="取 消" />
				</div>
				</td> 
			</tr>
		</table>	
</html:form>
</body>
</html:html>
