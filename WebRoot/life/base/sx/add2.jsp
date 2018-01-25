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
	<script type="text/javascript">
		function check()
		{
			var c_companyid=document.getElementsByName("sxbd.c_companyid")[0].value 
			Company.get_length(c_companyid, back);
			return false;
		}
		function back(data)
		{ 
			var str=document.getElementsByName("sxbd.c_bd")[0].value 
			str = str.replace(/[ ]/g,""); 
			document.getElementsByName("sxbd.c_bd")[0].value=str 
			if (data.c_bdl!=str.length)
			{
				alert("保单号码长度为："+data.c_bdl)
				document.getElementsByName("sxbd.c_bd")[0].focus();
			}
		}
		function setname()
		{  
			var c_jobnumber=document.getElementsByName("sxbd.c_jobnumber")[0].value 
			Staff.get_name(c_jobnumber, getname);
			return false;
		}
		function getname(datas)
		{					 
			var c_name=document.getElementById("c_name");
			c_name.innerText=datas;	 
		} 		
		function js_submit()
		{	
			if (document.getElementsByName("sxbd.c_bd")[0].value!=document.getElementsByName("c_bd")[0].value)
			{ 
				alert("您两次输入的保单号不一致，请重新输入！"); 
				return false;
			}	
			if (check_form(document.forms[0]))
			{		 
				return true;
			}
			else
			{
				return false;
			}
		}
	</script>
</head>
<body>  
		<html:form action="/sxbd" onsubmit="return js_submit()">
		<html:hidden property="jobname" value="sxbdsx" />
		<nested:nest property="sxbd"> 
		<nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>
		<nested:hidden property="c_tbd" value="${param.c_tbd }"></nested:hidden>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						保单生效
					</div>
				</td>
			</tr>					
			<tr>
				<td width="50%" align="right">保险公司</td>
				<td>
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_company where c_no=${param.c_companyid }"></sql:query>
					${q1.rows[0].c_name }
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">投保单号</td>
				<td>
					 ${param.c_tbd }
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">投保人证件号码</td>
				<td>
					<nested:text property="c_cardnum" value="" styleId="req" title="投保人证件号码必须填写" size="40"></nested:text>
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">代理人工号</td>
				<td>
					<nested:text property="c_jobnumber" value="${fn:substring(sessionScope.c_jobnumber,0,2)}" styleId="req" title="代理人工号必须填写" onchange="setname()"></nested:text>
					姓名：<span id="c_name"></span>
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">保险费合计</td>
				<td>
					<nested:text property="c_bxf" value="" styleId="req" title="保险费合计必须填写" onchange="reg_num(this)"></nested:text>
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">承保日期</td>
				<td>
					<nested:text property="c_date" value="" styleId="req" title="承保日期必须填写" maxlength="8"></nested:text>
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">保单号</td>
				<td>
					<nested:text property="c_bd" value="" styleId="req" title="保单号必须填写" size="40" onchange="check()"></nested:text>
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">重复保单号</td>
				<td>
					<input type="password" name="c_bd"  value="" size="40">
				</td>
			</tr> 
			</nested:nest>
			<tr>
				<td width="50%" align="right">
				<input type="submit" value=" 确 定 ">
				</td>
				<td width="50%" >
				<input type="reset" value=" 重 置 ">
				</td>
			</tr> 
		</table>
</html:form> 
</body>
</html:html>
