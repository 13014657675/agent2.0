<%@ page language="java"  pageEncoding="gbk"%>
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
		</script>	
</head> 
<body  onload="setyear()">	
		<form action="../../../toModule.do?prefix=/life&page=/agent/commission/query2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						佣金查询
					</div>
				</td>
			</tr> 			
			<tr>
				<td align="right" width="50%">
					<div align="right">
						年:
					</div>
				</td>
				<td  >
					<div align="left">
						<input name="c_year" value="" id="req" title="年必须输入" maxlength="4" />
					</div>
				</td>
			</tr>
			<tr>
				<td align="right" width="50%">
					<div align="right">
						月:
					</div>
				</td>
				<td  >
					<div align="left">
						<select name="c_month">
							<c:forEach begin="1" end="12" var="row">
								<option value="${row}">
									${row }月
								</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>	 
			<tr>
				<td align="right" width="50%">
					<input type="submit" value="下一步 "/>
				</td>	<td width="50%"> 	 
				</td>			
				</tr> 
				</table>
			</form>	 		 
	</body>			 
</html:html>
