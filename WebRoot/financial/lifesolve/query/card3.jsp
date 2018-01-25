<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>代理人银行卡号查询</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body>   
	<table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="30" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
					代理人银行卡号查询
				</td>
			</tr> 
		 <tr> 
		 <td>上级机构</td> 
		 <td>代理人所属机构</td>
		 <td>所用政策</td> 		 
		 <td>代理人姓名</td>
		 <td>代理人工号</td>
		 <td>证件类型</td> 
		 <td>证件号码</td>
		 <td>银行名称</td>
		 <td>银行卡号</td>
		 <td>入司日期</td> 
		 </tr>
		 <sql:query var="p1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid }"></sql:query> 
		 <sql:query var="p2" dataSource="${db_mssql }" sql="select left(c_path,${p1.rows[0].c_order } * 2)+'%' c_path from t_organization where c_no=${param.c_orgid }"></sql:query> 
	  
		 <sql:query var="q1" dataSource="${db_mssql }" sql="select a.*,convert(char(8),a.c_datime,112) c_rsrq,b.c_system from t_staff a ,t_agentset b
		 	where a.c_orgid in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' ) 
		 		and a.c_jobnumber=b.c_jobnumber and b.c_system in (1,2) and b.c_flag='0'
		 		order by a.c_orgid,a.c_jobnumber"></sql:query>
		 <c:forEach items="${q1.rows }" var="row">
		 <tr>		  
		 <sql:query var="a1" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_orgid } "></sql:query>
		 <sql:query var="a2" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${a1.rows[0].c_parent } "></sql:query>
		 <td>${a2.rows[0].c_name }</td>	
		 <td>${a1.rows[0].c_name }</td>			 
		 <c:if test="${not empty row.c_system }">
		  		<sql:query var="zc" dataSource="${db_mssql }" sql="select * from t_policy where c_system=${row.c_system } "></sql:query>
		 </c:if>
		 <td>${zc.rows[0].c_name }</td>		
		 <td>${row.c_name }</td> 	  
		 <td>${row.c_jobnumber }</td> 
		 <sql:query var="sfz"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${row.c_certificatetype}"></sql:query>
		 <td>${sfz.rows[0].c_name }</td>
		 <td>'${row.c_certificate }</td>
		 <sql:query var="a3" dataSource="${db_mssql }" sql="select * from t_namecode where c_type=15 and c_code=${row.c_bank } "></sql:query>
		 <td>${a3.rows[0].c_name }</td> 
		 <td>'${row.c_bankcode }</td> 
		 <td>${row.c_rsrq }</td>  
		 </tr>
		 </c:forEach>		 
		</table>    
</body>
</html:html>
