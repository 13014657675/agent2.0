<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>���ַ��ʲ�ѯ</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
<body >	  
		<table width="100%" border="1" cellspacing="0">		
			<tr>
				<td height="33" colspan="8" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
					���ʲ�ѯ
				</td>
			</tr>	
			<tr>  
				<td align="center" width="25%">
					����
				</td>
				<td align="center"width="25%">
					�����ڼ�
				</td>
				<td align="center" width="25%">
					�����ڼ�
				</td>				 
				<td align="center"width="25%">
				   ��ѯ
				</td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select c_type,c_base,c_bxqlx,c_bxq,c_jfqlx,c_jfq from t_ptrate 
				where c_companyid=${param.c_companyid } and c_productid=${param.c_productid } 
				group by c_type,c_base,c_bxqlx,c_bxq,c_jfqlx,c_jfq "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr> 
				<td align="center" width="15%">
					<c:if test="${row.c_type=='1' }">ÿ${row.c_base}Ԫ����</c:if>
					<c:if test="${row.c_type=='2' }">ÿ${row.c_base}Ԫ����</c:if>
				</td> 				 
				<td align="center">
					<c:if test="${row.c_bxqlx=='0' }">����</c:if>
					<c:if test="${row.c_bxqlx=='1' }">��${row.c_bxq }��	</c:if>
					<c:if test="${row.c_bxqlx=='2' }">����${row.c_bxq }��	</c:if> 
				</td>
				<td align="center">
					<c:if test="${row.c_jfqlx=='0' }">����</c:if>
					<c:if test="${row.c_jfqlx=='1' }">��${row.c_jfq}��	</c:if>
					<c:if test="${row.c_jfqlx=='2' }">����${row.c_jfq }��	</c:if> 
				</td>				 
				<td align="center">
				<a href="../../../toModule.do?prefix=/system&page=/product/ptrate/query3.jsp?c_companyid=${param.c_companyid }&c_productid=${param.c_productid }&c_type=${row.c_type }&c_base=${row.c_base }&c_bxqlx=${row.c_bxqlx }&c_bxq=${row.c_bxq }&c_jfqlx=${row.c_jfqlx }&c_jfq=${row.c_jfq }">��ѯ</a>   
				</td>
			</tr>
			</c:forEach>						
		</table> 
	</body>
</html:html>
