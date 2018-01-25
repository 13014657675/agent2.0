<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>手续费率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body >  
		<html:form action="/lifesolve" method="post">
		<html:hidden property="jobname" value="srate"/>
		<nested:nest property="product"> 
        <nested:hidden property="c_bdnd" value="${param.c_bdnd }"></nested:hidden>      
        <nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>
        <nested:hidden property="c_productid" value="${param.c_productid }"></nested:hidden>
        <nested:hidden property="c_jobnm" value="update"></nested:hidden>	     
		<table width="100%" border="1" cellspacing="0">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						手续费率修改
				</td>
		</tr> 
		<tr>	      	      	
		<sql:query var="a1" dataSource="${db_mssql }" sql="select * from t_company where c_no=${param.c_companyid }"></sql:query>
        <td width="50%"><div align="right">保险公司</div></td>
        <td width="50%"><div align="left">${a1.rows[0].c_fullname }</div></td>           
        </tr>
		<tr>	      	      	
		<sql:query var="a2" dataSource="${db_mssql }" sql="select * from t_product where c_no=${param.c_productid }"></sql:query>
        <td width="50%"><div align="right">险种名称</div></td>
        <td width="50%"><div align="left">${a2.rows[0].c_fullname }</div></td>           
        </tr>
        <tr>	      	      	
        <td width="50%"><div align="right">保单年度</div></td>
        <td width="50%"><div align="left">第${param.c_bdnd }年度</div></td>           
        </tr> 
       <tr>	      	      	
        <td width="50%"><div align="center">缴费期限</div></td>
        <td width="50%"><div align="center">手续费率</div></td>           
       </tr>		 
        <sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_srate where c_companyid=${param.c_companyid } and c_productid=${param.c_productid } 
       	and c_bdnd=${param.c_bdnd } order by c_jfqx"></sql:query>
		<c:forEach items="${q1.rows }" var="row">
			 <tr>
	    		<td width="50%">
		          	<div align="center">
		          	    <nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
		            	<nested:hidden property="c_jfqx" value="${row.c_jfqx }"></nested:hidden>
		            	${row.c_jfqx } <c:if test="${row.c_jfqx eq 1 }">（趸缴）</c:if>
		          	</div>
	          </td>
	          <td>
	              <div align="center">
	            	<nested:text property="c_dec" value="${row.c_srate }"  onchange="reg_num(this)"></nested:text> 
	           	 </div>
	           </td> 
    		 </tr>
		</c:forEach> 
	</nested:nest>	 
	<tr>
			<td colspan="2" align="center">
				<html:submit value="确 定"></html:submit> 
			</td>
	</tr>
	</table>	
	</html:form> 
	</body> 
</html:html>
