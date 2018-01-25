<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 
	<script type="text/javascript">
		function set()
		{  
			var c_orgtypeid=document.getElementsByName("c_orgtypeid")[0].value  
			Organization.get_typeorg(c_orgtypeid, get);
			return false;
		}
		function get(datas)
		{					
			DWRUtil.removeAllOptions('c_orgid');					
			DWRUtil.addOptions('c_orgid', datas, 'value', 'label'); 			 
		} 	
		function js_select(all)
		{ 
			var c_no=document.getElementsByName("sxbd.c_id");
			for (var i=0;i<c_no.length;i++) 
			{   var e=c_no[i]; 
				e.checked=all.checked; 
			}
		}	 
	</script>
</head>
<body>   
		<html:form action="/sxbd" >
		<html:hidden property="jobname" value="sxbdff" />
		<nested:nest property="sxbd"> 				
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="9" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						保单发放
					</div>
				</td>
			</tr>					
			<tr>
			<td width="20%">保险公司</td>
			<td width="20%">保单号</td>
			<td width="10%">投保人</td>
			<td width="10%">代理人工号</td> 
			<td width="10%">代理人姓名</td> 
			<td width="10%">目标机构</td>
			<td width="20%"></td>	
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxbd 
				where c_orgid=${sessionScope.Staff.c_orgid } 
				and c_bd in (select c_bd from t_sxbdzt where c_companyid=t_sxbd.c_companyid and  c_type=1 and c_flag='0')  
				and c_jobnm='0' and c_flag='0' order by c_companyid "></sql:query>
			<c:forEach items="${q1.rows }" var="row" varStatus="x">
			<tr>
			<td width="20%">
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td>
			<td width="30%">			
			<nested:hidden property="c_companyid_temp" value="${row.c_companyid }"></nested:hidden>
			<nested:hidden property="c_tbd_temp" value="${row.c_tbd }"></nested:hidden>
			<nested:hidden property="c_bd_temp" value="${row.c_bd }"></nested:hidden>
			${row.c_bd }</td>
			<td width="10%">
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_tbrnum }"></sql:query>		
			${q3.rows[0].c_name }	
			</td>
			<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>		
			<td width="10%">${q4.rows[0].c_jobnumber }</td> 
			<td width="10%">${q4.rows[0].c_name }</td> 
			<td width="10%">
			<sql:query var="q10" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_orgid_sq }"></sql:query>
			<sql:query var="q11" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q10.rows[0].c_parent }"></sql:query>		
			${q10.rows[0].c_name }[${q11.rows[0].c_name }]			
			<nested:hidden property="c_orgid_temp" styleId="c_orgid" value="${row.c_orgid_sq }"></nested:hidden>	
			</td>
			<td width="20%" >	 
			<nested:checkbox property="c_id"  value="${x.index }"></nested:checkbox>
			</td>	
			</tr>
			</c:forEach>			
			<tr> 
			<td colspan="6" align="center"><input type="submit" value=" 确 定 "></td>
			<td></td>
			</tr>					
		</table>
		</nested:nest>
		</html:form>		 
</body>
</html:html>
