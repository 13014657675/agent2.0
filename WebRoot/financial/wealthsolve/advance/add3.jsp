<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  		
	   <logic:equal value="1" parameter="c_type">	   
	   	<c:choose>
		<c:when test="${param.c_jobnm eq 'a' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_cxbd 
			where c_orgid_sq = ${param.c_orgid } and c_companyid=${param.c_companyid }
			and c_lrrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			and c_bd not in (select c_bd from t_cxytyj where c_companyid=${param.c_companyid })
			order by c_companyid,c_lrrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'b' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_cxbd 
			where c_orgid_sq = ${param.c_orgid } and c_companyid=${param.c_companyid }
			and c_cbrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			and c_bd not in (select c_bd from t_cxytyj where c_companyid=${param.c_companyid })
			order by c_companyid,c_cbrq"></sql:query>
		</c:when>		
		</c:choose>
	   </logic:equal>
	   	
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="80" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						Ӷ��Ԥ�ᷢ��
					</div>
				</td>
			</tr>					
			<tr>	
			<td></td>	
			<td>���</td>		
			<td>�ϼ�����</td>
			<td>��������������</td>
			<td>���չ�˾</td> 
			<td>������</td>
			<td>��������</td>
			<td>���շ�</td>	
			<td>ʹ������</td>
			<td>������������</td>					
			<td>ǩ������</td>
			<td>������</td>			
			<td>�����˹���</td>
			<td>����������</td>			
			<td>��������������</td> 
			<td>Ӷ����</td>
			<td>Ӷ��</td>	
			<td>֧��˰��</td>
			<td>֧��˰</td>					
			</tr> 
			<html:form action="/wealthsolve" method="post" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="cxytyj"/>
			<nested:nest property="product">   
	        <nested:hidden property="c_jobnm" value="add"></nested:hidden>	     
	        <nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>	 
	        <nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>	
			<c:forEach items="${q1.rows }" var="row" varStatus="x">
			<tr>
			<td>
			<nested:checkbox property="c_no" value="${x.index }"></nested:checkbox>
			<nested:hidden property="c_bd" value="${row.c_bd }"></nested:hidden>
			</td>	
			<td>${x.index+1 }</td>
			<sql:query var="q8" dataSource="${db_mssql }" sql="select c_orgid,c_jobnumber,c_name from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>	
			<c:if test="${not empty q8.rows[0].c_orgid }">			
			<sql:query var="q10" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q8.rows[0].c_orgid }"></sql:query>
			<sql:query var="q11" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q10.rows[0].c_parent }"></sql:query>		
			</c:if>			
			<td>${q11.rows[0].c_name }</td>
			<td>${q10.rows[0].c_name }</td>			
			<td>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td> 
			<td>${row.c_bd }</td>
			<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>	
			<td>${q5.rows[0].c_name }</td>
			<td>${row.c_bxf }</td>			 
			<td>
				<sql:query var="c_usageid"	sql="select * from t_usage where c_system=11 and c_no=${row.c_usageid }"	dataSource="${db_mssql}"></sql:query>
				${c_usageid.rows[0].c_name }
			</td>
			<td>${row.c_customer }</td>
			<td>${row.c_lrrq }</td>
			<td>${row.c_cbrq }</td>
			<td>${row.c_jobnumber }</td>
			<td>${q8.rows[0].c_name }</td> 
			<c:if test="${not empty row.c_system_sq }">
		  		<sql:query var="zc" dataSource="${db_mssql }" sql="select * from t_policy where c_system=${row.c_system_sq } "></sql:query>
		 	</c:if>
			<td>${zc.rows[0].c_name }</td>			
			<td>${row.c_bxfr2 }</td>
			<td>${row.c_bxfy2 }</td> 
			<td>${row.c_ccsr2 }</td>
			<td>${row.c_ccsy2 }</td>   
			<td></td>
			</tr>
			</c:forEach>				
			<tr>
			<td>
			ȫѡ
			<input type="checkbox" value="1" onclick="js_select(this)">
			</td>			
			<td>�������ڣ�</td>
			<td>
			<nested:text property="c_ffrq" value="" styleId="req" title="�������ڱ�������" maxlength="8" size="8"></nested:text>
			</td>
			<td><input type="submit" value=" �� �� "></td>
			</tr>
			</nested:nest>
			</html:form>		 
		</table> 
</body>
</html:html>

<script type="text/javascript">
	function setlrrq()
	{			
		var myDate = new Date();
		var formatStr="yyyyMMdd"
		Y=myDate.getFullYear();
		formatStr=formatStr.replace("yyyy",String(Y));   
		M=myDate.getMonth()+1
		formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
		D=myDate.getDate()
		formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
		var c_ffrq=document.getElementsByName("product.c_ffrq")[0];
		c_ffrq.value=formatStr;
	}
	setlrrq()
	function js_select(all)
	{ 
		var c_no=document.getElementsByName("product.c_no");
		for (var i=0;i<c_no.length;i++) 
		{   var e=c_no[i]; 
			e.checked=all.checked; 
		}
	}
	</script>