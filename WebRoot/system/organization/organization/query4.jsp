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
	<script type='text/javascript' src='../../../dwr/interface/Staff.js'></script>	
</head>		
	<body>	
		<sql:query var="q" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid } "></sql:query>
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${param.c_no }"></sql:query> 
			<html:form  action="/organization" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="add_update_delete"/>
			<nested:nest property="organization">	
			<nested:hidden property="c_jobnm" value="update"></nested:hidden>
			<nested:hidden property="c_no" value="${param.c_no }"></nested:hidden>  
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						������ѯ
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="40%"><div align="right">${fn:trim(q.rows[0].c_name) }����</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_name" value="${q1.rows[0].c_name }" styleId="req" title="�������Ʋ���Ϊ�� " size="30"></nested:text>
					<c:choose>
					<c:when test="${q.rows[0].c_mark eq 0 }">
					ǰ׺<nested:text property="c_prefix" value="${q1.rows[0].c_prefix }" styleId="req" title="����ǰ׺����Ϊ�� " size="2"></nested:text>
					</c:when>
					<c:when test="${q.rows[0].c_mark eq 1 }">
					<nested:hidden property="c_prefix" value="**"></nested:hidden>
					</c:when>
					</c:choose>	
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">����Ӫҵִ�ձ��</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_license" value="${q1.rows[0].c_license }"  ></nested:text>
					��Ч��ʼ��<nested:text property="c_lbeg" value="${q1.rows[0].c_lbeg }"  maxlength="8" size="8"></nested:text>
					��Ч������<nested:text property="c_lend" value="${q1.rows[0].c_lend }"  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">��ҵ��Ӫ���֤��</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_permit" value="${q1.rows[0].c_permit }"  ></nested:text>
					��Ч��ʼ��<nested:text property="c_pbeg" value="${q1.rows[0].c_pbeg }"  maxlength="8" size="8"></nested:text>
					��Ч������<nested:text property="c_pend" value="${q1.rows[0].c_pend }"  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">˰��Ǽ�֤��</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_tax" value="${q1.rows[0].c_tax }"  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">��֯��������</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_organization" value="${q1.rows[0].c_organization }"  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">�����˹���</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_jobnumber" styleId="c_jobnumber" value="${q1.rows[0].c_jobnumber }"  onchange="findjobnumber()" ></nested:text>
					����<input name="head_name" size="6"> 
					��ϵ�绰<input name="head_phone">
				</div>
				</td>
			</tr> 			
			<tr>
				<td width="40%"><div align="right">�Ƿ���׭�̹���</div></td>
				<td width="60%" >
				<div align="left">
					<nested:select property="c_seal" value="${q1.rows[0].c_seal }"  >
					<html:option value="0">��׭��</html:option>
					<html:option value="1">δ׭��</html:option>
					</nested:select>
					���´�ŵ�ַ<nested:text property="c_slocation" value="${q1.rows[0].c_slocation }" ></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">������</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="bank" dataSource="${db_mssql }" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bbank" value="${q1.rows[0].c_bbank }"  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					�˺�<nested:text property="c_bcard" value="${q1.rows[0].c_bcard }" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">һ�㻧</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank1" value="${q1.rows[0].c_gbank1 }"  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					�˺�<nested:text property="c_gcard1" value="${q1.rows[0].c_gcard1 }" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">һ�㻧</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank2" value="${q1.rows[0].c_gbank2 }"  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					�˺�<nested:text property="c_gcard2" value="${q1.rows[0].c_gcard2 }" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">�绰</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_phone" value="${q1.rows[0].c_phone }"  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">��ַ</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_address" value="${q1.rows[0].c_address }"  size="60"></nested:text>
				</div>
				</td>
			</tr> 			
			</nested:nest>		
			 
			</table>	
			</html:form> 					
	</body> 
</html:html>
<script type="text/javascript"> 
				function getjobnumber(datas)
				{	 					
					document.getElementsByName("head_name")[0].value= datas.c_name;
					document.getElementsByName("head_phone")[0].value= datas.c_mobilephone;
				} 	
				function findjobnumber()
				{
					var c_jobnumber=document.getElementById("c_jobnumber");					
					Staff.getstaff(c_jobnumber.value,getjobnumber); 
					return false;
				}
				findjobnumber()				
</script>