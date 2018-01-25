<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 
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
	} 
	function getksrq()
	{					 			
		var c_yc=26
		var myDate = new Date();
		if (myDate.getDate()<c_yc) {
			myDate.setMonth(myDate.getMonth()-1);				 
			} 				
			myDate.setDate(26);			 
		var formatStr="yyyyMMdd"
		Y=myDate.getFullYear();
		formatStr=formatStr.replace("yyyy",String(Y));   
		M=myDate.getMonth()+1
		formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
		D=myDate.getDate()
		formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
		return formatStr;
	}
	function getjsrq()
	{	 
		var c_yc=26
		var myDate = new Date();
		if (myDate.getDate()>=c_yc) { 
			myDate.setMonth(myDate.getMonth()+1);	
			}
		myDate.setDate(25);			 
		var formatStr="yyyyMMdd"
		Y=myDate.getFullYear();
		formatStr=formatStr.replace("yyyy",String(Y));   
		M=myDate.getMonth()+1
		formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
		D=myDate.getDate()
		formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
		return formatStr;
	}
	function init()
	{
	set();
	document.getElementsByName('c_ksrq')[0].value=getksrq();
	document.getElementsByName('c_jsrq')[0].value=getjsrq();
	document.getElementsByName('c_ksrq')[1].value=getksrq();
	document.getElementsByName('c_jsrq')[1].value=getjsrq();
	}
	</script>
</head>
<body onload="init();">

<form action="../../../toModule.do?prefix=/life&page=/base/query/tjcx2.jsp"  method="post" onsubmit="return check_form(this)"> 
		 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						统计数据查询
					</div>
				</td>
			</tr>					
			<tr>
				<td width="50%"><div align="right">代理人所在机构的机构类型</div></td>
				<td width="50%" >
				<div align="left">
					<select name="c_orgtypeid" style="width: 120" >
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order>=3 order by c_order "></sql:query>
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr>  
			
			<tr>				
				<td align="right">
				<input type="submit" value="下一步 ">
				</td>			
				<td>  
				</td>			
			</tr>
		</table>
</form> 

<form action="../../../toModule.do?prefix=/life&page=/base/query/tjcx3.jsp?c_type=2"  method="post" onsubmit="return check_form(this)"> 
		 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						统计数据查询
					</div>
				</td>
			</tr>	   
			<tr>
			<td align="right" width="50%">保险公司</td>
			<td  align="left">
			<select name="c_companyid">
			<sql:query var="query"  sql="select * from t_company where c_type=3001" dataSource="${db_mssql}"></sql:query>
			<c:forEach var="row" items="${query.rows}" >					
				<option  value="${row.c_no}"  >${row.c_fullname}</option>					
			</c:forEach>
			</select>
			</td>			
			</tr>	
			<tr>
			<td align="right" width="50%">日期类型</td>
			<td  align="left">
			 	 <select name="c_jobnm">
			 	 <option value="a">投保日期</option>
			 	 <option value="b">承保日期</option>
			 	 <option value="c">发放日期</option>
			 	 <option value="d">回执日期</option> 
			 	 </select>
			</td>
			</tr>	 
			<tr>
			<td align="right" width="50%">开始日期</td>
			<td  align="left">
			 	<input name="c_ksrq" maxlength="8" value="" id="req" title="开始日期必须填写"> 
			</td>
			</tr>	 
			<tr>
			<td align="right" width="50%">结束日期</td>
			<td  align="left">
			 	<input name="c_jsrq" maxlength="8" value="" id="req" title="结束日期必须填写">  
			</td>
			</tr>	 
			<tr>				
				<td align="right">
				<input type="submit" value=" 确 定 ">
				</td>			
				<td> 
				<input type="reset" value=" 重 置 ">
				</td>			
			</tr>
		</table>
</form> 

<form action="../../../toModule.do?prefix=/life&page=/base/query/tjcx3.jsp?c_type=3"  method="post" onsubmit="return check_form(this)"> 
		 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						统计数据查询
					</div>
				</td>
			</tr>	   
			<tr>
			<td align="right" width="50%">代理人工号</td>
			<td> 
			<input type="text" name="c_jobnumber" id="req" title="代理人工号必须填写"> 
			</td>				
			</tr>	
			<tr>
			<td align="right" width="50%">日期类型</td>
			<td  align="left">
			 	 <select name="c_jobnm">
			 	 <option value="a">投保日期</option>
			 	 <option value="b">承保日期</option>
			 	 <option value="c">发放日期</option>
			 	 <option value="d">回执日期</option> 
			 	 </select>
			</td>
			</tr>	 
			<tr>
			<td align="right" width="50%">开始日期</td>
			<td  align="left">
			 	<input name="c_ksrq" maxlength="8" value="" id="req" title="开始日期必须填写"> 
			</td>
			</tr>	 
			<tr>
			<td align="right" width="50%">结束日期</td>
			<td  align="left">
			 	<input name="c_jsrq" maxlength="8" value="" id="req" title="结束日期必须填写">  
			</td>
			</tr>	 
			<tr>				
				<td align="right">
				<input type="submit" value=" 确 定 ">
				</td>			
				<td> 
				<input type="reset" value=" 重 置 ">
				</td>			
			</tr>
		</table>
</form> 
</body>
</html:html>
