<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>�������</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
<body >
	<html:form action="/product" method="post">
	 <html:hidden property="jobname" value="ptrate"/>	   	
		<nested:nest property="rate">
		<nested:hidden property="c_jobnm" value="add"></nested:hidden>        
        <nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>      
        <nested:hidden property="c_productid" value="${param.c_productid }"></nested:hidden>     
		<nested:hidden property="c_type" value="${param.c_type }"></nested:hidden>     
		<nested:hidden property="c_base" value="${param.c_base }"></nested:hidden>    
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
					�������
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
				<td align="right">
					��������
				</td>
				<td align="left" >
					<sql:query var="q21"	sql="select * from t_product where c_companyid=${param.c_companyid } and c_no=${param.c_productid } "	dataSource="${db_mssql}"></sql:query>
						${q21.rows[0].c_fullname }					 							  
				</td>
			</tr> 	
			<tr> 		
				<td align="right" >
				���� 
				</td>
				<td  >
					<c:if test="${param.c_type=='1' }">
					ÿ${param.c_base }Ԫ����
					</c:if>
					<c:if test="${param.c_type=='2' }">
					ÿ${param.c_base }Ԫ����
					</c:if>
				</td>
				</tr>		 
			<tr>
				<td align="right">
					�����ڼ�
				</td>
				<td align="left"  >					
					<c:choose>
						<c:when test="${param.c_bxqlx =='0'}">���� 
								<nested:hidden property="c_bxqlx"  value="${param.c_bxqlx}"></nested:hidden> 
								<nested:hidden property="c_bxq"  value="${param.c_bxq0 }"></nested:hidden> </c:when>
						<c:when test="${param.c_bxqlx =='1'}">��${param.c_bxq1 }��						
								<nested:hidden property="c_bxqlx"  value="${param.c_bxqlx}"></nested:hidden> 
								<nested:hidden property="c_bxq"  value="${param.c_bxq1 }"></nested:hidden></c:when>
						<c:when test="${param.c_bxqlx =='2'}">����${param.c_bxq2 }��		
								<nested:hidden property="c_bxqlx"  value="${param.c_bxqlx}"></nested:hidden>				
								<nested:hidden property="c_bxq"  value="${param.c_bxq2 }"></nested:hidden></c:when>
					</c:choose>					
				</td>
			</tr>				  			
			<tr>
				<td align="right">
					�����ڼ�
				</td>
				<td align="left">			  
					 <c:choose> 
					 	<c:when test="${param.c_jfqlx =='0'}">
							����	
							<nested:hidden property="c_jfqlx"  value="${param.c_jfqlx}"></nested:hidden> 
							<nested:hidden property="c_jfq"  value="${param.c_jfq0 }"></nested:hidden>		 
						</c:when>
						<c:when test="${param.c_jfqlx =='1'}">
							��${param.c_jfq1 }��	
							<nested:hidden property="c_jfqlx"  value="${param.c_jfqlx}"></nested:hidden> 
							<nested:hidden property="c_jfq"  value="${param.c_jfq1 }"></nested:hidden>		 
						</c:when>
						<c:when test="${param.c_jfqlx =='2'}">
							����${param.c_jfq2 }��	
							<nested:hidden property="c_jfqlx"  value="${param.c_jfqlx}"></nested:hidden> 
							<nested:hidden property="c_jfq"  value="${param.c_jfq2 }"></nested:hidden>
						</c:when>
					</c:choose>	 					
				</td>
			</tr>					
					  			
	</table>
	<table width="100%" border="1" cellspacing="0"> 
			<c:if test="${param.c_type=='1' }">
			 <tr>
				<td align="center">
					����
				</td>
				<td align="center">
					���ѣ��У�
				</td>
				<td align="center">
					���ѣ�Ů��
				</td>
			</tr>
			</c:if>
			<c:if test="${param.c_type=='2' }">
			 <tr>
				<td align="center">
					����
				</td>
				<td align="center">
					����У�
				</td>
				<td align="center">
					���Ů��
				</td>
			</tr>
			</c:if>			
			<c:forEach begin="0" end="70" var="c">
			<tr>
				<td align="center">
					<nested:hidden property="c_no" value="0"></nested:hidden>
					<nested:hidden property="c_age" value="${c }"></nested:hidden> 
					${c }
				</td>
				<td align="center">
					<nested:text property="c_male" value="0"   onkeyup="return reg_num(this)"></nested:text>
				</td>
				<td align="center">
					<nested:text property="c_female" value="0"  onkeyup="return reg_num(this)"></nested:text>
				</td>
			</tr>
			</c:forEach> 
		<tr>
			<td colspan="3" align="center">
				<html:submit value="ȷ ��"></html:submit> 
			</td>
		</tr> 
	</table>
	</nested:nest>
	</html:form> 
	</body>
</html:html>
