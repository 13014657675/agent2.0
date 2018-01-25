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
<body  >				
		<form action="../../../toModule.do?prefix=/financial&page=/wealthsolve/advance/query4.jsp?c_orgid=${param.c_orgid }&c_companyid=${param.c_companyid }" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						佣金预提查询
					</div>
				</td>
			</tr> 			
			<tr>
			<td align="right" width="50%">年</td>
			<td  align="left">
			 	<input name="c_year" value="" onchange="jsset()" maxlength="4">
			</td>
			</tr>	 
			<tr>
			<td align="right" width="50%">发放日期</td>
			<td  align="left">
			 	<select name="c_ffrq" id="c_ffrq"> </select>
			</td>
			</tr>	 			
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
				function jsset()
				{
					var c_orgid = ${param.c_orgid };	
					var c_companyid = ${param.c_companyid };	
					var c_year = $("c_year").value;	 
					Product.get_cxytyj_ffrq(c_orgid,c_companyid,c_year,jsget);
					return false;
				}	
				function jsget(datas)
				{					
					DWRUtil.removeAllOptions('c_ffrq');					
					DWRUtil.addOptions('c_ffrq', datas, 'value', 'label');
				}					
				jsset()
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
