<%@ page language="java" pageEncoding="gbk"%>
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
<body onload="set();">	
	<form action="../../../toModule.do?prefix=/life&page=/xuqi/cj/query2.jsp" method="post" onsubmit="return check_form(this)">
		<table width="100%" border="1" cellspacing="0" >
			<tr >
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">						
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						催缴查询
					</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">代理人所在机构的机构类型</div></td>
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
				<td align="right">
				<input type="submit" value="下一步 ">
				</td>			
				<td>  
				</td>			
			</tr>
		</table>
	</form>	 
</body>
</html:html>

