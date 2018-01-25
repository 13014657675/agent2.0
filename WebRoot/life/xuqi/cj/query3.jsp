<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base />
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>
<body>	<sql:query var="q1" dataSource="${db_mssql }" sql="p_cjcx_xq ${param.c_orgid },${param.c_companyid },'${param.c_year }','${param.c_month }'"></sql:query>
		<table width="100%" border="1" cellspacing="0" id="table">
			<tr >
				<td height="33" colspan="30" background="../../../tool/images/113.gif">
					<div align="left">						
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						催缴查询  
					</div>
				</td>
			</tr> 
		 	<tr>
		 	<td>序号</td>
		 	<td>上级机构</td>
		 	<td>机构名称</td>
		 	<td>保险公司</td>
		 	<td>保单号</td>		 	
		 	<td>承保日期</td>
		 	<td>银行名称</td>
		 	<td>银行卡号</td>	
		 	<td>险种代码</td> 
		 	<td>险种名称</td> 
		 	<td>交费年期</td>		 	
		 	<td>交费年度</td>
		 	<td>保险费</td>
		 	<td>投保人姓名</td>
		 	<td>投保人固定电话</td>
		 	<td>投保人手机</td>
		 	<td>投保人地址</td>
		 	<td>被保人姓名</td>
		 	<td>代理人工号</td>
		 	<td>代理人姓名</td>
		 	<td>代理人固定电话</td> 
		 	<td>代理人手机</td> 
		 	</tr>
		 	<c:forEach items="${q1.rows }" var="row" varStatus="x">
		 	<tr>
		 	<td>${x.index+1 }</td>
		 	<sql:query var="a1"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid }"></sql:query>
			<sql:query var="parent" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${a1.rows[0].c_parent } "></sql:query>
		 	<td>${parent.rows[0].c_name }</td>
		 	<td>${row.c_orgname }</td>
		 	<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			<td>${q2.rows[0].c_name }</td>
		 	<td>${row.c_bd }</td>		 	
		 	<td>${row.c_cbrq }</td>
		 	<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_namecode where c_code='${row.c_bank }'"></sql:query>
		 	<td>${q3.rows[0].c_name }</td>
		 	<td>${row.c_bankcode }</td>	
		 	<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>
		 	<td>${q4.rows[0].c_code }</td>
		 	<td>${q4.rows[0].c_name }</td>
		 	<td>${row.c_jfqx }</td>		 	
		 	<td>${row.c_bdnd }</td>
		 	<td>${row.c_bxf }</td>
		 	<td>${row.c_tbrname }</td>
		 	<td>${row.c_phone }</td>
		 	<td>${row.c_mobile }</td>
		 	<td>${row.c_hddr }</td>
		 	<td>${row.c_bbrname }</td>
		 	<td>${row.c_jobnumber }</td>
		 	<td>${row.c_name }</td>
		 	<td>${row.c_telephone }</td> 
		 	<td>${row.c_mobilephone }</td> 
		 	</tr>		 	
		 	</c:forEach>
		</table> 
</body>
</html:html>