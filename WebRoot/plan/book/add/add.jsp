<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
    <script type='text/javascript' src='../../../dwr/util.js'> </script> 
    <script type='text/javascript' src='../../../dwr/interface/Product.js'> </script>
</head>
<body onclick="set();">
<form action="../../../toModule.do?prefix=/plan&page=/book/add/add2.jsp"  method="post" onsubmit="return check_form(this)"> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						计划书生成
					</div>
				</td>
			</tr>				
			<tr>
			<td align="right" width="50%"> 
			保险公司
			</td>
			<td>		
					<select name="c_companyid" id="c_companyid" onchange="set();">
						<sql:query var="q1"	sql="select * from t_company where c_type=3001"	dataSource="${db_mssql}"></sql:query>
						<c:forEach var="row" items="${q1.rows}">
							<option value="${row.c_no}">
								${row.c_name}
							</option>
						</c:forEach>
					</select>	
			</td>
			</tr>	
			<tr>
			<td align="right" width="50%">投保人姓名</td><td><input name="c_tbrname" id="req" title="投保人姓名必须填写"></td>
			</tr>
			<tr>
			<td align="right" width="50%">被保险人姓名</td><td><input name="c_bbrname" id="req" title="被保险人姓名必须填写"></td>
			</tr>
			<tr>
			<td align="right" width="50%">被保险人性别</td><td> 
			<input type="radio" name="c_sex" value="1" checked="checked">男
			<input type="radio" name="c_sex" value="2" >女
			</td>
			</tr>
			<tr>
			<td align="right" width="50%">被保险人出生日期</td>
			<td>
			<input name="c_y" id="req" size="4" maxlength="4" title="年不能为空">年
			<input name="c_m" id="req" size="2" maxlength="2" title="月不能为空">月
			<input name="c_d" id="req" size="2" maxlength="2" title="日不能为空">日
			</td>
			</tr>
			<tr>				
				<td align="right">
				<input type="submit" value=" 确定 ">
				</td>			
				<td> 
				<input type="reset" value=" 取消 ">
				</td>			
			</tr>
		</table>
</form> 
</body>
</html:html>
<script type="text/javascript">	
			function set()
			{
				var c_companyid = $("c_companyid").value;	
				Product.get_product(c_companyid, get);
				return false;
			}	
			function get(datas)
			{					
				DWRUtil.removeAllOptions('c_productid');					
				DWRUtil.addOptions('c_productid', datas, 'value', 'label');
			}							
</script> 	
