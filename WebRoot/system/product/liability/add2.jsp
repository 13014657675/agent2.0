<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>�����������</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
<body >
	<html:form action="/product" method="post" onsubmit="return check_form(this)">
	 <html:hidden property="jobname" value="pliability"/>	   	
		<nested:nest property="product">		  
		<nested:hidden property="c_jobnm" value="add"></nested:hidden>        
        <nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>      
        <nested:hidden property="c_productid" value="${param.c_productid }"></nested:hidden>      
		<table width="100%" border="1" cellspacing="0" id="tb">
			<tr>
				<td height="33" colspan="4" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
					�����������
				</td>
			</tr>	
			<tr>
				<td align="right" width="50%">
					���չ�˾
				</td>
				<td align="left" > 
					<sql:query var="q1"	sql="select * from t_company where c_no=${param.c_companyid } "	dataSource="${db_mssql}"></sql:query>
						${q1.rows[0].c_name }
				</td>
			</tr>
			<tr>
				<td align="right" >
					��������
				</td>
				<td align="left" >
					<sql:query var="q21"	sql="select * from t_product where c_companyid=${param.c_companyid } and c_no=${param.c_productid } "	dataSource="${db_mssql}"></sql:query>
						${q21.rows[0].c_fullname }		 		  
				</td>
			</tr> 	 
			 <tr>
				<td  align="center">
					 ������������
				</td>
				<td  align="center">
					 ������������
				</td> 
			</tr> 
			<tr> 
				<td  width="50%"  align="center">
					 <nested:hidden property="c_no" value="1"></nested:hidden> 
					 <nested:text property="c_pname" size="60" value="" styleId="req" title="�����������Ʊ�����д"></nested:text>
				</td>
				<td  width="50%">
					 <nested:textarea property="c_pdesc" value="" cols="100" rows="5" styleId="req" title="������������������д"></nested:textarea>
				</td> 
			</tr>  			 
		  <tr> 
			<td align="right">
				<input type="button" value=" ��ӱ������� " onclick="add()">
				<html:submit value=" ȷ �� "></html:submit> 
			</td>
			<td >
				<html:reset value=" ȡ �� "></html:reset>
			</td>
		</tr> 
	</table>
	</nested:nest>
	</html:form> 
	</body>
</html:html>
<script type="text/javascript">
 	function add()
	{	
		var row=tb.insertRow(tb.rows.length-1); 	
		var cell1 = row.insertCell();
		cell1.align="center"
		cell1.valign="top"
		cell1.innerHTML="<td ><input type=hidden name=product.c_no value=\"1\"><input name=product.c_pname size=60 value=\"\" id=\"req\" title=\"�����������Ʊ�����д\"></td>";	
		var cell2 = row.insertCell(); 
		cell2.innerHTML="<td  ><textarea name=product.c_pdesc cols=100 rows=5 id=\"req\" title=\"������������������д\"></textarea><input type=button onclick=deleteitem(this,'tb') value='ɾ������' id=del ></td>";	
	}	
	function deleteitem(obj,id)
    {
     	var rowNum,curRow;
     	curRow = obj.parentNode.parentNode;
	 	rowNum = eval("document.all."+id).rows.length - 1;
     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
    }  
</script>
