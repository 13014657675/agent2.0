<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">   
	<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script> 
	<script type='text/javascript' src='../../../dwr/interface/Staff.js'></script>  
	<script type='text/javascript' src='../../../dwr/interface/Company.js'></script> 
	<script type='text/javascript' src='../../../dwr/interface/Cxbd.js'></script> 
	<script type="text/javascript">
		function check()
		{
			var c_companyid=document.getElementsByName("cxbd.c_companyid")[0].value 
			Company.get_length(c_companyid, back);
			return false;
		}
		function back(data)
		{ 
			var str=document.getElementsByName("cxbd.c_bd")[0].value 
			str = str.replace(/[ ]/g,""); 
			document.getElementsByName("cxbd.c_bd")[0].value=str 
			if (data.c_bdl!=str.length)
			{
				alert("保单号码长度为："+data.c_bdl)
				document.getElementsByName("cxbd.c_bd")[0].focus();
			}
		}		
		function setname()
		{  
			var c_jobnumber=document.getElementsByName("cxbd.c_jobnumber")[0].value 
			Cxbd.get_name(c_jobnumber, getname);
			return false;
		}
		function getname(datas)
		{					 
			var c_name=document.getElementById("c_name");
			c_name.innerText=datas;	  
		} 				
		function setlrrq()
		{			
			var myDate = new Date();
			var formatStr="yyyyMMdd"
			Y=myDate.getFullYear();
			formatStr=formatStr.replace("yyyy",String(Y));   
			M=myDate.getMonth()+1
			formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
			D=myDate.getDate()
			formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
			var c_lrrq=document.getElementsByName("cxbd.c_lrrq")[0];
			c_lrrq.value=formatStr;
		}
	</script>
	</head>
	<body onload="setname()">
		<sql:query var="cxbd"  sql="select * from t_cxbd where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_jobnm='check' and c_flag='0' " dataSource="${db_mssql}"></sql:query>
		<html:form action="/wealth" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="cxbdadd" />
		<table width="100%" border="0" cellspacing="0" align="center" >
				<tr>
					<td height="33" colspan="8" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							保单核销
						</div>
					</td>
				</tr>						
				<nested:nest property="cxbd">
				<nested:hidden property="c_no" value="${cxbd.rows[0].c_no }"></nested:hidden>
				<nested:hidden property="c_orgid" value="${cxbd.rows[0].c_orgid }"></nested:hidden>
				<nested:hidden property="c_companyid" value="${cxbd.rows[0].c_companyid }"></nested:hidden>
				<nested:hidden property="c_jobnm" value="0"></nested:hidden> 							
				<tr>
				<td align="right" width="16%">保险公司：</td>
				<td align="left" width="16%">
				<sql:query var="q1"  sql="select * from t_company where c_no=${param.c_companyid }" dataSource="${db_mssql}"></sql:query>
				${q1.rows[0].c_name }
				</td>
				<td align="right" width="16%">险种：</td>
				<td align="left" width="16%">
				<sql:query var="q2"  sql="select * from t_product where c_companyid=${param.c_companyid }" dataSource="${db_mssql}"></sql:query>
				<nested:select property="c_productid" value="${cxbd.rows[0].c_productid }">
				<c:forEach items="${q2.rows }" var="row">
				<html:option value="${row.c_no }">${row.c_name }</html:option>
				</c:forEach>
				</nested:select>
				</td>
				<td colspan="2"></td>
				</tr>	 
				<tr>
				<td align="right" width="16%">保单号：</td>
				<td align="left" width="16%">
				<nested:text property="c_bd" styleId="req" title="保单号必须填写！" size="40" onchange="check()" value="${cxbd.rows[0].c_bd }"></nested:text>
				</td>
				<td align="right" width="16%">保险费：</td>
				<td align="left" width="16%">
				<nested:text property="c_bxf" onchange="reg_num(this)" styleId="req" title="保险费必须填写！" value="${cxbd.rows[0].c_bxf }"></nested:text>
				</td>
				<td align="right" width="16%">车船税：</td>
				<td align="left" width="16%">
				<nested:text property="c_ccs" onchange="reg_num(this)" styleId="req" title="车船税必须填写！" value="${cxbd.rows[0].c_ccs }"></nested:text>
				</td>
				</tr> 	
				<tr>
				<td align="right" width="16%">
				车牌号码：
				</td>
				<td align="left" width="16%">
				<nested:text property="c_platenumber" value="${cxbd.rows[0].c_platenumber }" styleId="req" title="车牌号码必须填写！"  size="30"></nested:text>
				</td>
				<td align="right" width="16%">
				车驾号：
				</td>
				<td align="left" width="16%">
				<nested:text property="c_hisnumber" value="${cxbd.rows[0].c_hisnumber }" size="30"></nested:text>
				</td>
				<td colspan="2"></td>
				</tr>
				<tr>
				<td align="right" width="16%">被保险人姓名：</td>
				<td align="left" width="16%">
				<nested:text property="c_customer" value="${cxbd.rows[0].c_customer }" styleId="req" title="被保险人姓名必须填写！"></nested:text>				
				</td>
				<td align="right" width="16%">证件类型：</td>
			 	<td align="left" width="16%">
			 	<sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
			 	<nested:select property="c_cardtype" value="${cxbd.rows[0].c_cardtype }">
			 	<c:forEach var="row" items="${query1.rows}" >		
					<html:option value="${row.c_code }">${row.c_name }</html:option>
				</c:forEach>
			 	</nested:select>
			 	</td>
			 	<td align="right" width="16%">证件号码：</td>
			 	<td align="left" width="16%"><nested:text property="c_cardnum" value="${cxbd.rows[0].c_cardnum }" size="40" styleId="req" title="证件号码必须填写！"></nested:text></td>
				</tr>			 	
			 	<tr>
			 	<td align="right" width="16%">代理人工号：</td>
			 	<td align="left" width="16%"><nested:text property="c_jobnumber" value="${cxbd.rows[0].c_jobnumber }"  styleId="req" title="代理人工号必须填写！" onchange="setname()"></nested:text></td>
			 	<td align="right" width="16%">代理人姓名：</td>
			 	<td align="left" width="16%"><A id="c_name"></A></td>
			 	<td colspan="2"></td>
			 	</tr> 
			 	<tr>
			 	<td align="right" width="16%">使用性质：</td>
			 	<td align="left" width="16%">
			 			<sql:query var="q3"	sql="select * from t_usage where c_system=11"	dataSource="${db_mssql}"></sql:query>
			 			<nested:select property="c_usageid" value="${cxbd.rows[0].c_usageid }">
			 			<c:forEach items="${q3.rows }" var="row3">
			 			<html:option value="${row3.c_no }">${row3.c_name }</html:option>
			 			</c:forEach>
			 			</nested:select>
			 	</td>
			 	<td align="right" width="16%">付款方式：</td>
			 	<td align="left" width="16%">
			 			<nested:select property="c_pay" value="${cxbd.rows[0].c_pay }"> 
			 			<html:option value="1">信用卡刷卡</html:option> 
			 			<html:option value="2">转账</html:option>
			 			<html:option value="3">现金</html:option>
			 			</nested:select>
			 	</td>
			 	<td colspan="2"></td>
			 	</tr> 
			 	<tr>
			 	<td align="right" width="16%">发票流水号：</td>
			 	<td align="left" width="16%">
			 			<nested:text property="c_fpserial" value="${cxbd.rows[0].c_fpserial }"  size="40"></nested:text>
			 	</td>
			 	<td align="right" width="16%">单证流水号：</td>
			 	<td align="left" width="16%">
			 			<nested:text property="c_dzserial" value="${cxbd.rows[0].c_dzserial }"  size="40" styleId="req" title="单证流水号必须填写！" ></nested:text>
			 	</td>
			 	<td colspan="2">			 			
			 	</td>
			 	</tr> 
			 	<tr>
			 	<td align="right" width="16%">签单日期：</td>
			 	<td align="left" width="16%"><nested:text property="c_lrrq" value="${cxbd.rows[0].c_lrrq }"  styleId="req" title="签单日期必须填写！" maxlength="8"></nested:text></td>
			 	<td align="right" width="16%">起保日期：</td>
			 	<td align="left" width="16%"><nested:text property="c_cbrq" value="${cxbd.rows[0].c_cbrq }"  styleId="req" title="起保日期必须填写！" maxlength="8"></nested:text></td>
			 	<td colspan="2"></td>
			 	</tr> 			 	
				</nested:nest>
				<tr> 
					<td align="right" colspan="3" width="50%">
					<html:submit value=" 确 定 " style="font: bold;font-size: 14" /></td> 
					<td colspan="3" width="50%">
					<input type="reset" value=" 重 置 " style="font: bold;font-size: 14"></td> 
				</tr>
			</table> 
			<br><br>
		</html:form>
	</body>
</html:html>

