<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>手续费率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
    <script type='text/javascript' src='../../../dwr/util.js'> </script> 
    <script type='text/javascript' src='../../../dwr/interface/Product.js'> </script>
</head>
<body >  
		<html:form action="/wealthsolve" method="post">
		<html:hidden property="jobname" value="ctax"/>
		<nested:nest property="product">   
        <nested:hidden property="c_jobnm" value="add"></nested:hidden>	     
        <nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>	     
		<table width="100%" border="1" cellspacing="0">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						收入税率添加
				</td>
		</tr> 
		<tr>
			<td align="right" width="50%" colspan="3">保险公司</td>
			<td width="50%" align="left" colspan="3">
					<nested:select property="c_companyid" styleId="c_companyid" onchange="set();">
						<sql:query var="q1"	sql="select * from t_company where c_type=3002"	dataSource="${db_mssql}"></sql:query>
						<c:forEach var="row" items="${q1.rows}">
							<html:option value="${row.c_no}">${row.c_name}</html:option>							
						</c:forEach>
					</nested:select> 
				</td>
		</tr>
		<tr>
				<td align="right" colspan="3" width="50%">险种名称</td>
				<td align="left" colspan="3" width="50%"> 
					<nested:select property="c_productid" styleId="c_productid"></nested:select>
				</td>
		</tr>		
		<tr>
				<td align="right" colspan="3" width="50%">依据日期类型</td>
				<td align="left" colspan="3" width="50%"> 
					<nested:select property="c_type">
					<html:option value="1">签单日期</html:option>
					<html:option value="2">起保日期</html:option>
					</nested:select>
				</td>
		</tr>
		<tr>
				<td align="right" colspan="3" width="50%">开始日期</td>
				<td align="left" colspan="3" width="50%"> 
					<nested:text property="c_ksrq" styleId="req" title="开始日期必须填写" maxlength="8"></nested:text>
				</td>
		</tr> 
		<tr style="color: red">
			<td align="center" colspan="2" width="33%">使用性质</td>
			<td align="center" colspan="2" width="33%">收入税率</td>
			<td align="center" colspan="2" width="33%"></td>
		</tr>      
		<sql:query var="q2"	sql="select * from t_usage where c_system=11"	dataSource="${db_mssql}"></sql:query>
		<c:forEach items="${q2.rows }" var="row2">
		<tr>
			<!-- 性质id -->
			<nested:hidden property="c_ptype" value="${row2.c_no }"/>
			<nested:hidden property="c_no" value="1"/>
			<td align="center" colspan="2">${row2.c_name }</td>
			<td align="center" colspan="2">
			<nested:text property="c_dec_in" value="0" onchange="reg_num(this)"></nested:text>
			</td>
			<td align="center" colspan="2"> 
			</td>
		</tr>    
		</c:forEach>
		
	</nested:nest>	
		<tr>
			<td  align="right" colspan="3">
				<html:submit value=" 确 定 "></html:submit> 
			</td>
			<td colspan="3">
				<html:reset value=" 取 消 "></html:reset>
			</td>
		</tr>
	</table>	
	</html:form> 
	</body> 
</html:html>
<script type="text/javascript">	
			function setksrq()
			{			
				var myDate = new Date();
				var formatStr="yyyyMMdd"
				Y=myDate.getFullYear();
				formatStr=formatStr.replace("yyyy",String(Y));   
				M=myDate.getMonth()+1
				formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
				D=myDate.getDate()
				formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
				var c_ksrq=document.getElementsByName("product.c_ksrq")[0];
				c_ksrq.value=formatStr;
			}
			setksrq()
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
			set()
		</script>		
