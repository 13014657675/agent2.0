<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<title>���ֶ���</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Product.js'></script> 	
	<script type='text/javascript' src='../../../dwr/interface/Company.js'></script>
		
</head> 
<body>
<html:form  action="/product" onsubmit="return check_form(this)">
<html:hidden property="jobname" value="add_update_delete"/>
	<nested:nest property="product">	
	<nested:hidden property="c_no" value="1"></nested:hidden> 
	<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						�������
					</div>
				</td>
			</tr>	 
			<tr>
				<td width="48%"><div align="right">����</div></td>
				<td width="52%" >
				<div align="left">
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_namecode where c_type =30"></sql:query>				
				<nested:select property="c_ptnature" onchange="set()">	
				<c:forEach items="${q1.rows }" var="row">
				<html:option value="${row.c_code }">${row.c_name }</html:option>
				</c:forEach>
				</nested:select>
				</div>
				</td>
			</tr>		
			<tr>
				<td width="48%"><div align="right">����</div></td>
				<td width="52%" >
				<div align="left">				 			
				<nested:select property="c_ptclassid" styleId="c_ptclassid" onchange="set2()">			
				</nested:select>
				</div>
				</td>
			</tr>	
			<tr>
				<td width="48%"><div align="right">���</div></td>
				<td width="52%" >
				<div align="left">							
				<nested:select property="c_pttypeid" styleId="c_pttypeid">				
				</nested:select>
				</div>
				</td>
			</tr>	
			<script type="text/javascript">
			function set()
			{  
				var c_ptnature=document.getElementsByName("product.c_ptnature")[0].value  
				Product.get_ptclass(c_ptnature, get);				
				return false;
			}			
			function get(datas)
			{	
				DWRUtil.removeAllOptions('c_ptclassid');					
				DWRUtil.addOptions('c_ptclassid', datas, 'value', 'label'); 
				set2()	
			} 			
			function set2()
			{  
				var c_ptclassid=document.getElementsByName("product.c_ptclassid")[0].value  
				Product.get_pttype(c_ptclassid, get2);
				return false;
			}
			function get2(datas)
			{	
				DWRUtil.removeAllOptions('c_pttypeid');					
				DWRUtil.addOptions('c_pttypeid', datas, 'value', 'label'); 
				var c_ptnature=document.getElementsByName("product.c_ptnature")[0].value  
				Company.get_company(c_ptnature, get_company)
			} 	 	
			function get_company(datas)
			{	
				DWRUtil.removeAllOptions('c_companyid');					
				DWRUtil.addOptions('c_companyid', datas, 'value', 'label');  
			} 				
			set()	
			</script>
			<tr>
				<td width="48%"><div align="right">���չ�˾</div></td>
				<td width="52%" >
				<div align="left"> 			
				<nested:select property="c_companyid" styleId="c_companyid"></nested:select>
				</div>
				</td>
			</tr>	
			<tr>
				<td width="48%"><div align="right">��������</div></td>
				<td width="52%" >
				<div align="left">
				 <c:set value="1" property="c_type" target="${productForm.product }"></c:set>
				 <nested:radio property="c_type" value="1"> ����</nested:radio>
				 <nested:radio property="c_type" value="2"> ������</nested:radio>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">���ִ���</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_code" value="" styleId="req" title="���ִ��������д"></nested:text>
				</div>
				</td>
			</tr>		
			<tr>
				<td width="48%"><div align="right">����ȫ��</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_fullname" value="" size="50" styleId="req" title="����ȫ�Ʊ�����д"></nested:text>
				</div>
				</td>
			</tr>
			
			<tr>
				<td width="48%"><div align="right">���ּ��</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_name" value="" styleId="req" title="���ּ�Ʊ�����д"></nested:text>
				</div>
				</td>
			</tr>			 
			</nested:nest>	
			<tr>
				<td width="48%"><div align="right"><html:submit value="ȷ ��"/></div></td>
				<td width="52%" >
				<div align="left">
					<html:reset  value="ȡ ��" />
				</div>
				</td> 
			</tr>
		</table>	
</html:form>
</body>
</html:html>

<ul>
  <li> �������з��ʱ�����Ϊ����ͨ���֡���</li> 	
  <li> ������û�з��ʱ�����Ϊ�������������</li> 
</ul>

