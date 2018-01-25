<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Library.js'></script>  
	<script type="text/javascript">
	function set()
	{  
		var c_libraryid=document.getElementsByName("c_libraryid")[0].value 
		Library.get_goodstype(c_libraryid, get);
		return false;
	}
	function get(datas)
	{					
		DWRUtil.removeAllOptions('c_goodstypeid');					
		DWRUtil.addOptions('c_goodstypeid', datas, 'value', 'label'); 		 
	} 		
	</script> 
</head>		
	<body onload="set()">		
		<html:form  action="/shop" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="goods"/>
		<nested:nest property="library">	
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						物品添加
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="50%"><div align="right">机构 </div></td>
				<td width="50%" >
				<div align="left">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization where c_no in 
						( select c_orgid from t_postset where c_jobnumber ='${sessionScope.c_jobnumber }' ) "></sql:query>
					<nested:select property="c_orgid" styleId="c_orgid" >
					<c:forEach items="${q1.rows }" var="row">
					<html:option value="${row.c_no }">${row.c_name }</html:option>
					</c:forEach>
					</nested:select>
				</div>
				</td>
			</tr> 	
			<tr>
				<td width="50%"><div align="right">库房名</div></td>
				<td width="50%" >
				 	 <nested:select property="c_libraryid" styleId="c_libraryid" onchange="set()" >
						<html:option value="1">资产管理</html:option>
						<html:option value="2">办公用品</html:option>
						<html:option value="3">普通单证</html:option>
				 	 </nested:select>
				</td>
			</tr>		
			<tr>
				<td width="50%"><div align="right">分类名</div></td>
				<td width="50%"><div align="left">
				<nested:select property="c_goodstypeid" styleId="c_goodstypeid" >
				</nested:select>
				</div></td>
			</tr>		 
			<tr>
				<td width="50%"><div align="right">物品名</div></td>
				<td width="50%"><div align="left">
				<nested:text property="c_name" styleId="req" title="物品名必须填写" value=""></nested:text>
				</div></td>
			</tr>				 
			<tr>
				<td width="50%"><div align="right">厂商</div></td>
				<td width="50%" colspan="3"><div align="left">
				<nested:text property="c_factory" size="80" value=""></nested:text>
				</div></td>				 						
			</tr> 
			<tr>
				<td width="50%"><div align="right">地址</div></td>
				<td width="50%" colspan="3"><div align="left">
				<nested:text property="c_address" size="80" value="" ></nested:text>
				</div></td>				 						
			</tr> 
			</nested:nest>		
			<tr>
				<td width="50%" align="right" ><html:submit value=" 确 定 "/></td>
				<td width="50%" >
					<html:reset  value=" 取 消 " />
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 
</html:html> 