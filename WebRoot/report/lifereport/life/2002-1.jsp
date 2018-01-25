<%@ page language="java" pageEncoding="gbk"%>
<jsp:directive.page import="java.util.Date"/>
<%@ include file="/tool/common/taglib.jsp"%> 
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
	</script>
</head>		
	<body onload="set();document.getElementsByName('c_ksrq')[0].value=getksrq();document.getElementsByName('c_jsrq')[0].value=getjsrq();">		
		<form action="../../../toModule.do?prefix=/report&page=/lifereport/life/2002-2.jsp" method="post" onsubmit="return check_form(this)">
		<input name="c_time" value="<%=new Date().getTime()%>" type="hidden">
		<input name="c_code" value="2002" type="hidden">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						供应商业绩表
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="48%"><div align="right">所在机构的机构类型</div></td>
				<td width="52%" >
				<div align="left">
					<select name="c_orgtypeid" style="width: 120" onchange="set()">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order=3 order by c_order "></sql:query>
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr>  
			<tr>
			<td align="right" width="50%">所在机构名称</td>
			<td> 
			<select name="c_orgid" id="c_orgid" > 
			</td>				
			</tr>	
			<tr>
			<td align="right" width="50%">年度</td>
			<td> 
			<input name="c_year" value="" id="req" title="年度必须填写" maxlength="4">
			</td>				
			</tr>	
			<tr>
			<td align="right" width="50%">投保开始日期</td>
			<td> 
			<input name="c_ksrq" value="" id="req" title="投保开始日期必须填写" maxlength="8">
			</td>				
			</tr>	
			<tr>
			<td align="right" width="50%">投保结束日期</td>
			<td> 
			<input name="c_jsrq" value="" id="req" title="投保结束日期必须填写" maxlength="8">
			</td>				
			</tr>	
			<tr>
				<td width="48%" align="right"><input type="submit" value=" 确定 "></td>
				<td width="52%"  > <input type="reset" value=" 重置 "></td> 
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