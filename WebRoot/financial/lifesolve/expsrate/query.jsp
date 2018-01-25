<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>佣金率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
    <script type='text/javascript' src='../../../dwr/util.js'> </script> 
    <script type='text/javascript' src='../../../dwr/interface/Product.js'> </script>
</head>
<body  >
		<form action="../../../toModule.do?prefix=/financial&page=/lifesolve/expsrate/query2.jsp" method="post" onsubmit="return check_form(this)">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						佣金率查询
				</td>
			</tr> 
			<tr>
			  <td align="right" width="50%">保险公司</td>
				<td width="57%" align="left">
					 <select name="c_companyid" id="c_companyid" onchange="set();">
						<sql:query var="q1"	sql="select * from t_company where c_type=3001"	dataSource="${db_mssql}"></sql:query>
						<c:forEach var="row" items="${q1.rows}">
							<option value="${row.c_no}">
								${row.c_name}
							</option>
						</c:forEach>
					 </select>	
				</td>
			</tr>
			<tr>
				<td align="right">
					险种名称
				</td>
				<td align="left"> 
					<select name="c_productid" id="c_productid">
					</select>
				</td>
			</tr>
			<script type="text/javascript">	
			function set()
			{
				var c_companyid = $("c_companyid").value;	
				Product.get_product(c_companyid, get);
				return false;
			}	
			function get(datas)
			{					
				DWRUtil.removeAllOptions('c_productid');					
				DWRUtil.addOptions('c_productid', datas, 'value', 'label');
				set2()
			}	
			function set2()
			{
				var c_system = $("c_system").value;	
				Product.get_exptype(c_system, get2);
				return false;
			}	
			function get2(datas)
			{					
				DWRUtil.removeAllOptions('c_exptypeid');					
				DWRUtil.addOptions('c_exptypeid', datas, 'value', 'label'); 
			}
			set()
			</script>			 
			<tr>
				<td align="right">
					保单年度
				</td>
				<td align="left">
					<select name="c_bdnd"  >
					<c:forEach begin="1" end="9" var="row">						
						<option value="${row}">${row}</option> 
					</c:forEach>								
					</select>
				</td>
			</tr>  
			<tr>
				<td align="right">
					业务政策
				</td>
				<td align="left">
					<sql:query var="q2"	sql="select * from t_policy where c_ptnature=3001 order by c_system"	dataSource="${db_mssql}"></sql:query>
					<select name="c_system" id="c_system"  onchange="set2();" >
					<c:forEach items="${q2.rows }" var="row">						
						<option value="${row.c_system}">${row.c_name}</option> 
					</c:forEach>								
					</select>
				</td>
			</tr>  
			<tr>
				<td align="right">
					佣金项目名称
				</td>
				<td align="left">					 
					<select name="c_exptypeid" id="c_exptypeid"> 						
					</select>
				</td>
			</tr> 
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="下一步">
				</td>				
			</tr>
		</table>
	</form>	
	</body>
</html:html>
