<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>����������</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
<body >
	<html:form action="/product" method="post" onsubmit="return check_form(this)">
	 <html:hidden property="jobname" value="pcomponent"/>	   	
		<nested:nest property="product">
		<nested:hidden property="c_jobnm" value="add"></nested:hidden>        
        <nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>      
        <nested:hidden property="c_productid" value="${param.c_productid }"></nested:hidden>      
		<table width="100%" border="1" cellspacing="0" id="tb">
			<tr>
				<td height="33" colspan="4" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
					����������
				</td>
			</tr>	
			<tr>
				<td align="right" width="50%" colspan="2">
					���չ�˾
				</td>
				<td align="left" colspan="2"> 
					<sql:query var="q1"	sql="select * from t_company where c_no=${param.c_companyid } "	dataSource="${db_mssql}"></sql:query>
						${q1.rows[0].c_name }
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					��������
				</td>
				<td align="left" colspan="2">
					<sql:query var="q2"	sql="select * from t_product where c_companyid=${param.c_companyid } and c_no=${param.c_productid } "	dataSource="${db_mssql}"></sql:query>
						${q2.rows[0].c_fullname }					  
				</td>
			</tr> 	 
			 <tr>
				<td  align="center">
					 ��������
				</td>
				<td  >
					 ���ִ���
				</td>
				<td  >
					  ����ȫ��
				</td>
				<td  >
					  ���ּ��
				</td>
			</tr> 
			<tr>
				<td  width="25%" align="center">
					<nested:hidden property="c_no" value="1"></nested:hidden>      
					<nested:select property="c_ptype" value="1">
					<html:option value="1">����</html:option>
					<html:option value="2">������</html:option>
					</nested:select>
				</td>
				<td  width="25%">
					 <nested:text property="c_pcode" value="" styleId="req" title="���ִ��������д"></nested:text>
				</td>
				<td  width="30%">
					 <nested:text property="c_pfullname" value="" size="40"></nested:text>
				</td>
				<td  width="20%">
					 <nested:text property="c_pname" value=""></nested:text>
				</td>
			</tr>  
			<tr>
				<td  width="25%" align="center">
					<nested:hidden property="c_no" value="1"></nested:hidden>      
					<nested:select property="c_ptype" value="2">
					<html:option value="1">����</html:option>
					<html:option value="2">������</html:option>
					</nested:select>
				</td>
				<td  width="25%">
					 <nested:text property="c_pcode" value="" styleId="req" title="���ִ��������д"></nested:text>
				</td>
				<td  width="30%">
					 <nested:text property="c_pfullname" value="" size="40"></nested:text>
				</td>
				<td  width="20%">
					 <nested:text property="c_pname" value=""></nested:text>
				</td>
			</tr> 
		<tr>
			<td align="center">
			<input type="button" value=" ������� " onclick="addxz()">
			</td>
			<td align="right">
				<html:submit value=" ȷ �� "></html:submit> 
			</td>
			<td colspan="2" >
				<html:reset value=" ȡ �� "></html:reset>
			</td>
		</tr> 
	</table>
	</nested:nest>
	</html:form> 
	</body>
</html:html>
<script type="text/javascript">
 	function addxz()
	{	
		var row=tb.insertRow(tb.rows.length-1); 	
		var cell1 = row.insertCell();
		cell1.align="center"
		cell1.innerHTML="<td ><input type=hidden name=product.c_no value=\"1\"><select name=product.c_ptype><option value=\"1\">����</option><option value=\"2\" selected=\"selected\">������</option></select></td>";	
		var cell2 = row.insertCell(); 
		cell2.innerHTML="<td  ><input name=product.c_pcode value=\"\" id=req title=\"���ִ��������д\"></td>";	
		var cell3 = row.insertCell(); 
		cell3.innerHTML="<td  ><input name=product.c_pfullname size=40 value=\"\"></td>";	
		var cell4 = row.insertCell(); 
		cell4.innerHTML="<td  ><input name=product.c_pname value=\"\"><input type=button onclick=deleteitem(this,'tb') value='ɾ������' id=del ></</td>";	 
	}	
	function deleteitem(obj,id)
    {
     	var rowNum,curRow;
     	curRow = obj.parentNode.parentNode;
	 	rowNum = eval("document.all."+id).rows.length - 1;
     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
    }  
</script>
