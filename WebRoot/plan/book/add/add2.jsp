<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Planbook.js'></script>   
	<script type="text/javascript">
	function set()
	{
		var c_companyid = '${param.c_companyid}';	
		Planbook.get_product(c_companyid, get);
		return false;
	}	
	function get(datas)
	{					
		DWRUtil.removeAllOptions('c_productid');					
		DWRUtil.addOptions('c_productid', datas, 'value', 'label');
	}	
	</script>
</head>
<body > 
		<html:form action="/plan" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="plan_book" />
		<nested:nest property="planbook"> 
		<nested:hidden property="c_jobnm" value="add"></nested:hidden>
		<nested:hidden property="c_companyid" value="${param.c_companyid}"></nested:hidden>
		<table width="100%" border="1" cellspacing="0" id="tb">
				<tr>
					<td height="33" colspan="5" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							�ƻ�������
						</div>
					</td>
				</tr>			
				<tr>
				<td>Ͷ����������${param.c_tbrname }
				<nested:hidden property="c_tbrname" value="${param.c_tbrname }"></nested:hidden>
				</td>
				</tr>
				<tr>
				<td width="20%">��������������${param.c_bbrname }
				<nested:hidden property="c_bbrname" value="${param.c_bbrname }"></nested:hidden>
				</td>
				<td width="20%">���������Ա�
				<c:choose>
				<c:when test="${param.c_sex eq 1 }">��</c:when>
				<c:when test="${param.c_sex eq 2 }">Ů</c:when>
				</c:choose>
				<nested:hidden property="c_bbrsex" value="${param.c_sex }"></nested:hidden>
				</td>
				<td width="20%">�������˳������ڣ�${param.c_y }��${param.c_m }��${param.c_d }��
				<nested:hidden property="c_bbirthy" value="${param.c_y }"></nested:hidden>
				<nested:hidden property="c_bbirthm" value="${param.c_m }"></nested:hidden>
				<nested:hidden property="c_bbirthd" value="${param.c_d }"></nested:hidden>
				</td>
				<sql:query var="q1" dataSource="${db_mssql }" sql="exec pg_age ${param.c_y },${param.c_m },${param.c_d },null"></sql:query>
				<td width="20%">�����������䣺${q1.rows[0].c_age }
				<nested:hidden property="c_age" value="${q1.rows[0].c_age }"></nested:hidden>
				</td>
				<td></td>
				</tr> 
				<tr>
				<td width="20%">����</td>
				<td width="20%">����/����</td>
				<td width="20%">�����ڼ�</td> 
				<td width="20%">�ɷ��ڼ�</td>
				<td></td>
				</tr>
				<tr>
				<td width="20%">				 
				<nested:select property="c_productid" styleId="c_productid">
				</nested:select> 
				<script type="text/javascript">
				set() 
				</script>
				</td>
				<td width="20%">
				<nested:select property="c_basetype" value="1">				
				<html:option value="1">����</html:option>
				<html:option value="2">����</html:option>
				</nested:select> 
				<nested:text property="c_base" size="8" value="0"></nested:text> 
				</td>
				<td width="20%">
				<nested:select property="c_bxqtype" onchange="js_bxq()">				
				<html:option value="1">��*��</html:option>
				<html:option value="2">����*��</html:option>
				<html:option value="0">����</html:option>
				</nested:select><a id="c_bxq"></a>		
				<script type="text/javascript">
				function js_bxq()
				{
					var c_bxqtype=document.getElementsByName("planbook.c_bxqtype")[0].value
					var c_bxq=document.getElementById("c_bxq");
					if (c_bxqtype=='1')
					{
						c_bxq.innerHTML="��<input name=\"planbook.c_bxq\" size=\"2\" value=\"0\">��";
					}
					if (c_bxqtype=='2')
					{
						c_bxq.innerHTML="����<input name=\"planbook.c_bxq\" size=\"2\" value=\"0\">��";
					}
					if (c_bxqtype=='0')
					{
						c_bxq.innerHTML="<input type=\"hidden\" name=\"planbook.c_bxq\" value=\"0\">";
					}
				}			
				js_bxq()
				</script>
				</td> 
				<td width="20%">
				<nested:select property="c_jfqtype" onchange="js_jfq()">				
				<html:option value="1">��*��</html:option>
				<html:option value="2">����*��</html:option>
				<html:option value="0">����</html:option>
				</nested:select><a id="c_jfq"></a>		
				<script type="text/javascript">
				function js_jfq()
				{
					var c_jfqtype=document.getElementsByName("planbook.c_jfqtype")[0].value
					var c_jfq=document.getElementById("c_jfq");
					if (c_jfqtype=='1')
					{
						c_jfq.innerHTML="��<input name=\"planbook.c_jfq\" size=\"2\" value=\"0\">��";
					}
					if (c_jfqtype=='2')
					{
						c_jfq.innerHTML="����<input name=\"planbook.c_jfq\" size=\"2\" value=\"0\">��";
					}
					if (c_jfqtype=='0')
					{
						c_jfq.innerHTML="<input type=\"hidden\" name=\"planbook.c_jfq\" value=\"0\">";
					}
				}			
				js_jfq()
				</script>	
				</td>
				</tr>				
				</nested:nest>
				<tr>
				<td align="center">
				<input type="button" value=" �������� " onclick="addxz()" >
				</td>
				<td align="center"><input type="submit" value=" ȷ �� "></td>
				<td></td>
				<td align="center"><input type="reset" value=" ȡ �� "></td>			
				<td></td>	
				</tr>
				</table>	 
</html:form>				
</body>
</html:html>
<script type="text/javascript">
	function js_bxq2(c_bxqtype,c_bxq)
	{   
		if (c_bxqtype=='1')
		{
			c_bxq.innerHTML="��<input name=\"planbook.c_bxq\" size=\"2\" value=\"0\">��";
		}
		if (c_bxqtype=='2')
		{
			c_bxq.innerHTML="����<input name=\"planbook.c_bxq\" size=\"2\" value=\"0\">��";
		}
		if (c_bxqtype=='0')
		{
			c_bxq.innerHTML="<input type=\"hidden\" name=\"planbook.c_bxq\" value=\"0\">";
		}
	}	
	function js_jfq2(c_jfqtype,c_jfq)
	{  
		if (c_jfqtype=='1')
		{
			c_jfq.innerHTML="��<input name=\"planbook.c_jfq\" size=\"2\" value=\"0\">��";
		}
		if (c_jfqtype=='2')
		{
			c_jfq.innerHTML="����<input name=\"planbook.c_jfq\" size=\"2\" value=\"0\">��";
		}
		if (c_jfqtype=='0')
		{
			c_jfq.innerHTML="<input type=\"hidden\" name=\"planbook.c_jfq\" value=\"0\">";
		}
	}			
	var s_count=-1;
	function set2(c_count)
	{
		s_count=c_count; 
		c_companyid='${param.c_companyid}';	
		Planbook.get_product(c_companyid, get2);
		return false;
	}	
	function get2(datas)
	{					
		DWRUtil.removeAllOptions('c_productid'+s_count);					
		DWRUtil.addOptions('c_productid'+s_count, datas, 'value', 'label');
	}		
	var count=10;	
 	function addxz()
	{	
		count+=1;
		var row=tb.insertRow(tb.rows.length-1);		 	
		var cell1 = row.insertCell();
		cell1.innerHTML="<td ><select name=\"planbook.c_productid\" id=\"c_productid"+count+"\"></select></td>";	
		set2(count)
		var cell2 = row.insertCell(); 				
	 	cell2.innerHTML="<td  ><select name=\"planbook.c_basetype\"><option value=\"1\">����</option><option value=\"2\">����</option></select><input type=\"text\" name=\"planbook.c_base\" size=\"8\" value=\"0\"></td>";	 
		var cell3 = row.insertCell(); 		
		var a="<select name=\"planbook.c_bxqtype\" id=\"c_bxqtype"+count+"\" onchange=\"js_bxq2(this.value,document.getElementById('c_bxq"+count+"'))\"><option value=\"1\">��*��</option><option value=\"2\">����*��</option><option value=\"0\">����</option></select><a id=\"c_bxq"+count+"\"></a>";
		cell3.innerHTML="<td  >"+a+"</td>";	 
		js_bxq2(document.getElementById("c_bxqtype"+count).value,document.getElementById("c_bxq"+count));
		var cell4 = row.insertCell(); 
		var b="<select name=\"planbook.c_jfqtype\" id=\"c_jfqtype"+count+"\" onchange=\"js_jfq2(this.value,document.getElementById('c_jfq"+count+"'))\"><option value=\"1\">��*��</option><option value=\"2\">����*��</option><option value=\"0\">����</option></select><a id=\"c_jfq"+count+"\"></a>";
		cell4.innerHTML="<td  >"+b+"</</td>";	
		js_jfq2(document.getElementById("c_jfqtype"+count).value,document.getElementById("c_jfq"+count));
		var cell5 = row.insertCell(); 
		cell5.innerHTML="<td  ><input type=button onclick=deleteitem(this,'tb') value='ɾ������' id=del ></</td>";	 
	}	
	function deleteitem(obj,id)
    {
     	var rowNum,curRow;
     	curRow = obj.parentNode.parentNode;
	 	rowNum = eval("document.all."+id).rows.length - 1;
     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
    }  
</script>
