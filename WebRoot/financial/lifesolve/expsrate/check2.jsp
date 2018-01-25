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
        <nested:hidden property="c_jobnm" value="check"></nested:hidden>	     
		<table width="100%" border="1" cellspacing="0">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						佣金率复核
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
            <c:when test="${ param.c_exptypeid eq 0 }">
             	佣金率
             	<c:set var="c_exptypeid" value="0"></c:set>
            </c:when>
            <c:otherwise>
            <sql:query var="exptypeid" dataSource="${db_mssql }" sql="select * from t_exptype where c_no=${param.c_exptypeid }"></sql:query>
            ${exptypeid.rows[0].c_name }  
            <c:set var="c_exptypeid" value="${param.c_exptypeid }"></c:set>          
            </c:otherwise>
            </c:choose>  
        </div></td>           
       </tr>		 
       <sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_expsrate where c_companyid=${param.c_companyid } and c_productid=${param.c_productid } 
       	and c_system=${param.c_system }	and c_bdnd=${param.c_bdnd } and c_exptypeid=${c_exptypeid }  order by c_jfqx"></sql:query>	
		<c:forEach items="${q1.rows }" var="row">
			 <tr>
	    		<td width="50%">
		          	<div align="center">
		          	    <nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
		            	<nested:hidden property="c_jfqx" value="${row.c_jfqx }"></nested:hidden>
		            	${row.c_jfqx } <c:if test="${row.c_jfqx eq 1 }">（趸缴）</c:if>
		          	</div>
	          </td>
	          <td >
	              <div align="center" >
	              	 <c:choose>
	              	 <c:when test="${row.c_srate gt 0}">
	              	 <nested:text property="c_dec" value="${row.c_srate }"  onchange="reg_num(this)" style="color: red"></nested:text> 
	              	 </c:when>
	              	 <c:otherwise>						
	              	 <nested:text property="c_dec" value="${row.c_srate }"  onchange="reg_num(this)" ></nested:text>  
	              	 </c:otherwise>        
	              	 </c:choose>  	
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
