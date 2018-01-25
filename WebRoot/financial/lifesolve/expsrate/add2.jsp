<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>佣金率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body >  
		<html:form action="/lifesolve" method="post">
		<html:hidden property="jobname" value="expsrate"/>
		<nested:nest property="product"> 
        <nested:hidden property="c_bdnd" value="${param.c_bdnd }"></nested:hidden>      
        <nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>
        <nested:hidden property="c_productid" value="${param.c_productid }"></nested:hidden>
        <nested:hidden property="c_system" value="${param.c_system }"></nested:hidden>
        <nested:hidden property="c_exptypeid" value="${param.c_exptypeid }"></nested:hidden>
        <nested:hidden property="c_jobnm" value="add"></nested:hidden>	     
		<table width="100%" border="1" cellspacing="0">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						佣金率添加
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
		<sql:query var="a3" dataSource="${db_mssql }" sql="select * from t_policy where c_system=${param.c_system }"></sql:query>
        <td width="50%"><div align="right">业务政策</div></td>
        <td width="50%"><div align="left">${a3.rows[0].c_name }</div></td>           
        </tr>
        <tr>	      	      	
        <td width="50%"><div align="center">缴费期限</div></td>
        <td width="50%"><div align="center">
            <c:choose>
            <c:when test="${empty param.c_exptypeid }">
             	佣金率
            </c:when>
            <c:otherwise>
            <sql:query var="exptypeid" dataSource="${db_mssql }" sql="select * from t_exptype where c_no=${param.c_exptypeid }"></sql:query>
            ${exptypeid.rows[0].c_name }            
            </c:otherwise>
            </c:choose>               
        </div></td>           
       </tr>		 
		<c:forEach var="c" begin="1" end="60">
			 <tr>
	    		<td width="50%">
		          	<div align="center">
		          	    <nested:hidden property="c_no" value="0"></nested:hidden>
		            	<nested:hidden property="c_jfqx" value="${c }"></nested:hidden>
		            	${c } <c:if test="${c==1 }">（趸缴）</c:if>
		          	</div>
	          </td>
	          <td>
	              <div align="center">
	            	<nested:text property="c_dec" value="0"  onchange="reg_num(this)"></nested:text> 
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
