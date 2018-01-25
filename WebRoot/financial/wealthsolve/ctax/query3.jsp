<%@ page language="java"  pageEncoding="gbk"%>
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
<body >				
		<form action="../../../toModule.do?prefix=/financial&page=/wealthsolve/ctax/query4.jsp?c_orgid=${param.c_orgid }" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						收入税率查询
					</div>
				</td>
			</tr> 			
			<tr>
			<td align="right" width="50%" >保险公司</td>
			<td width="50%" align="left" >
					<select name="c_companyid" id="c_companyid" onchange="set();"> 
						<sql:query var="q1"	sql="select * from t_company where c_type=3002"	dataSource="${db_mssql}"></sql:query>
						<c:forEach var="row" items="${q1.rows}">
							<option value="${row.c_no}">${row.c_name}</option> 
						</c:forEach> 
					</select>
				</td>
			</tr>
			<tr>
					<td align="right" width="50%">险种名称</td>
					<td align="left"  width="50%"> 
						<select name="c_productid" id="c_productid"></select>
					</td>
			</tr>			
			<tr>
					<td align="right" width="50%">依据日期类型</td>
					<td align="left"  width="50%"> 
						<select name="c_type" id="c_type" onchange="set2();">
						<option value="1">签单日期</option>
						<option value="2">起保日期</option> 
						</select>						 
					</td>
			</tr>	
			<tr>
					<td align="right" width="50%">年</td>
					<td align="left"  width="50%"> 
					<input name="c_year" id="c_year" value="" size="4" maxlength="4" onchange="set2();">
					</td>
			</tr>
			<tr>
					<td align="right" width="50%">开始日期</td>
					<td align="left"  width="50%"> 
					<select name="c_ksrq" id="c_ksrq"></select>
					</td>
			</tr>
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
					set2();
				}					
				function set2()
				{
					var c_orgid = ${param.c_orgid };	
					var c_companyid = $("c_companyid").value;	
					var c_productid = $("c_productid").value;	
					var c_type = $("c_type").value;
					var c_year = $("c_year").value;
					Product.get_ctax_ksrq(c_orgid,c_companyid,c_productid,c_year,c_type,get2);

					return false;
				}	
				function get2(datas)
				{					
					DWRUtil.removeAllOptions('c_ksrq');					
					DWRUtil.addOptions('c_ksrq', datas, 'value', 'label');
				}					
				set()
			</script>		
			<tr>
				<td align="right" width="50%">
					<input type="submit" value="下一步 "/>
				</td>	<td align="center" width="50%"> 				
				</tr> 
				</table>
			</form>	 				
			  
	</body>			 
</html:html>
<script type="text/javascript">	
			function setyear()
			{			
				var myDate = new Date();
				var formatStr="yyyy"
				Y=myDate.getFullYear();
				formatStr=formatStr.replace("yyyy",String(Y));   
				//M=myDate.getMonth()+1
				//formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
				//D=myDate.getDate()
				//formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
				var c_year=document.getElementsByName("c_year")[0];
				c_year.value=formatStr;
			}
			setyear()			
		</script>	