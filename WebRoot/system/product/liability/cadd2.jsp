<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>��������������ʶ���</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
<body >
	<html:form action="/product" method="post" onsubmit="return check_form(this)">
	 <html:hidden property="jobname" value="pliabilityc"/>	   	
		<nested:nest property="product">		  
		<nested:hidden property="c_jobnm" value="add"></nested:hidden>            
		<table width="100%" border="1" cellspacing="0" >
			<tr>
				<td height="33" colspan="4" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
					��������������ʶ���
				</td>
			</tr>	 
			<tr>
				<td align="right" width="50%">
					���չ�˾
				</td>
				<td align="left" > 
					<sql:query var="q1"	sql="select * from t_company where c_no=${param.c_companyid } "	dataSource="${db_mssql}"></sql:query>
					${q1.rows[0].c_name }
					<nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>	
				</td>
			</tr>
			<tr>
				<td align="right" >
					��������
				</td>
				<td align="left" >					
					<sql:query var="q21"	sql="select * from t_product where c_companyid=${param.c_companyid } and c_no=${param.c_productid } "	dataSource="${db_mssql}"></sql:query>
						${q21.rows[0].c_fullname }		 
					<nested:hidden property="c_productid" value="${param.c_productid }"></nested:hidden>
				</td>
			</tr> 			  
			<script type="text/javascript">
				function js_bxq2(c_bxqtype,c_bxq)
				{    
					var temp=c_bxqtype.substr(c_bxqtype.length-1,c_bxqtype.length)							
					if (temp=='1')
					{
						c_bxq.innerHTML="��<input name=\"product.c_bxq\" size=\"2\" value=\"\" id=\"req\" title=\"�����ڼ������д\">��";
					}
					if (temp=='2')
					{
						c_bxq.innerHTML="����<input name=\"product.c_bxq\" size=\"2\" value=\"\" id=\"req\" title=\"�����ڼ������д\">��";
					}
					if (temp=='0')
					{
						c_bxq.innerHTML="<input type=\"hidden\" name=\"product.c_bxq\" value=\"\">";
					}
				}	
				function js_jfq2(c_jfqtype,c_jfq)
				{  
					if (c_jfqtype=='1')
					{
						c_jfq.innerHTML="��<input name=\"product.c_jfq\" size=\"2\" value=\"\" id=\"req\" title=\"�����ڼ������д\">��";
					}
					if (c_jfqtype=='2')
					{
						c_jfq.innerHTML="����<input name=\"product.c_jfq\" size=\"2\" value=\"\" id=\"req\" title=\"�����ڼ������д\">��";
					}
					if (c_jfqtype=='0')
					{
						c_jfq.innerHTML="<input type=\"hidden\" name=\"product.c_jfq\" value=\"\">";
					}
				}	
			</script>
			<tr>
			<td colspan="2">
			<table width="100%" id="tx">
			<tr>			
			<td width="25%">����</td> 
			<td width="75%" colspan="3"> 
			</td>
			</tr> 	
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_pliabilityc 
				where c_companyid=${param.c_companyid } and  c_productid=${param.c_productid } "></sql:query>
			<c:forEach items="${q3.rows }" var="row" varStatus="x"> 
			<tr>			
			<td width="25%">			  
			���ʣ�
			<nested:text property="c_name_temp" value="${row.c_name }" styleId="req" title="���ʱ�����д"></nested:text> <input type="button" value="�������" onclick="add(tb${row.c_no },${row.c_no })">
			<br>
			<input type="button" value="ɾ��������" onclick="deleteitem(this,'tx')"> 
			</td>
			<sql:query var="q3x" dataSource="${db_mssql }" sql="select * from t_pliabilitycv 
				where c_companyid=${param.c_companyid } and  c_productid=${param.c_productid } and c_pliabilitycid=${row.c_no } order by c_bxqtype"></sql:query>
			<td colspan="3">
			<table id="tb${row.c_no }" width="100%" >
			<nested:hidden property="c_pcode" value="${row.c_no }"></nested:hidden>			
			<tr>
			<td width="25%">�����ڼ�</td>
			<td width="25%">�����ڼ�</td>
			<td width="25%"></td>
			<td width="25%"></td>
			</tr>
			<c:forEach items="${q3x.rows }" var="rowx" varStatus="xx">
			<tr>	
			<td width="25%">
				<nested:select property="c_bxqtype" value="${row.c_no }${rowx.c_bxqtype }" styleId="c_bxqtype${row.c_no }${xx.index+1 }"  onchange="js_bxq2(this.value,document.getElementById('c_bxq${row.c_no }${xx.index+1}'))" >			
				<html:option value="${row.c_no }1">��*��</html:option>
				<html:option value="${row.c_no }2">����*��</html:option>
				<html:option value="${row.c_no }0">����</html:option>
				</nested:select>
				<a id="c_bxq${row.c_no }${xx.index+1 }"></a>	
			</td>
			<td width="25%">
			<nested:select property="c_jfqtype" value="${rowx.c_jfqtype }" styleId="c_jfqtype${row.c_no }${xx.index+1 }" onchange="js_jfq2(this.value,document.getElementById('c_jfq${row.c_no }${xx.index+1}'))" >							
				<html:option value="1">��*��</html:option>
				<html:option value="2">����*��</html:option>
				<html:option value="0">����</html:option>
				</nested:select>
				<a id="c_jfq${row.c_no }${xx.index+1 }"></a>		 
			</td>
			<script type="text/javascript"> 
				js_bxq2(document.getElementById("c_bxqtype${row.c_no }${xx.index+1}").value,document.getElementById("c_bxq${row.c_no }${xx.index+1}"));
				var bxqid=document.getElementById("c_bxq${row.c_no }${xx.index+1}");
				var bxq=bxqid.getElementsByTagName("input")[0]
				bxq.value='${rowx.c_bxq }'				 
				js_jfq2(document.getElementById("c_jfqtype${row.c_no }${xx.index+1}").value,document.getElementById("c_jfq${row.c_no }${xx.index+1}"));
				var jfqid=document.getElementById("c_jfq${row.c_no }${xx.index+1}");
				var jfq=jfqid.getElementsByTagName("input")[0]
				jfq.value='${rowx.c_jfq }'	
			</script>				
			<td width="25%">
			������Ŀ��<nested:select property="c_t" value="${rowx.c_t }">
			<html:option value="1">�������</html:option>
			<html:option value="2">����������</html:option>
			</nested:select>		
			<br>
			��ֵ��<nested:text property="c_v" size="2" value="${rowx.c_v }" styleId="req" title="��ֵ������д"></nested:text>
			</td>
			<td width="25%">
			<input type="button" onclick=deleteitem(this,'tb${row.c_no }') value='ɾ��������' id=del >
			</td>
			</tr>
			</c:forEach>
			</table>
			</td>			
			</tr> 	
			</c:forEach>					
			</table>
			</td>
			</tr>  			
		  <tr> 
			<td align="right">
				<input type="button" value=" ������� " onclick="addname()">
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
 	var count=10;	
 	function add(tb,zid)
	{	
		sid=tb.getAttribute("id")
		count+=1;
		var row=tb.insertRow(tb.rows.length);		 	
		var cell1 = row.insertCell(); 
		var a="<select name=\"product.c_bxqtype\" id=\"c_bxqtype"+count+"\" onchange=\"js_bxq2(this.value,document.getElementById('c_bxq"+count+"'))\"><option value=\""+zid+"1\">��*��</option><option value=\""+zid+"2\">����*��</option><option value=\""+zid+"0\">����</option></select><a id=\"c_bxq"+count+"\"></a>";
	 	cell1.innerHTML="<td  width=\"25%\">"+a+"</td>";	
		var cell2 = row.insertCell(); 
		var b="<select name=\"product.c_jfqtype\" id=\"c_jfqtype"+count+"\" onchange=\"js_jfq2(this.value,document.getElementById('c_jfq"+count+"'))\"><option value=\"1\">��*��</option><option value=\"2\">����*��</option><option value=\"0\">����</option></select><a id=\"c_jfq"+count+"\"></a>";
		cell2.innerHTML="<td  width=\"25%\">"+b+"</td>";		
		var cell3 = row.insertCell(); 
		var c="������Ŀ��<select name=\"product.c_t\" ><option value=1>�������</option><option value=2>����������</option></select><br> ��ֵ��<input name=product.c_v size=2 value=\"\" id=\"req\" title=\"��ֵ������д\">";
		cell3.innerHTML="<td  width=\"25%\">"+c+"</</td>";	 
		var d="<input type=button onclick=deleteitem(this,'"+sid+"') value='ɾ��������' id=del >";
		var cell4 = row.insertCell(); 
		cell4.innerHTML="<td  width=\"25%\">"+d+"</</td>";	 		
		js_bxq2(document.getElementById("c_bxqtype"+count).value,document.getElementById("c_bxq"+count));		
		js_jfq2(document.getElementById("c_jfqtype"+count).value,document.getElementById("c_jfq"+count));	
	}	
	var xcount=1000;
	function addname()
	{	 
		xcount+=1;
		var row=tx.insertRow(tx.rows.length);		 	
		var cell1 = row.insertCell();  
		var a="���ʣ�<input name=\"product.c_name_temp\" value=\"\" id=\"req\" title=\"���ʱ�����д\" > <input type=\"button\" value=\"�������\" onclick=\"add(tb"+xcount+","+xcount+")\">";
	 	a+="<br><input type=\"button\" value=\"ɾ��������\" onclick=\"deleteitem(this,'tx')\">";
	 	cell1.innerHTML="<td  >"+a+"</td>";			 
		var cell2 = row.insertCell();  
		cell2.colSpan = 3;	 
		var b="<table id=tb"+xcount+" width=\"100%\"><input type=\"hidden\" name=\"product.c_pcode\" value=\""+xcount+"\" ><tr><td width=\"25%\">�����ڼ�</td><td width=\"25%\">�����ڼ�</td><td width=\"25%\"> </td><td width=\"25%\"> </td></tr></table>";
		cell2.innerHTML="<td  >"+b+"</td>";	
	 	add(document.getElementById("tb"+xcount),xcount);		
	}	
	function deleteitem(obj,id)
    {
     	var rowNum,curRow;
     	curRow = obj.parentNode.parentNode;
	 	rowNum = eval("document.all."+id).rows.length - 1;
     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
    }  
</script>
