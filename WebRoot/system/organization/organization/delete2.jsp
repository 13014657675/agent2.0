<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">			
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 	
</head>		
	<body>	
		<sql:query var="q" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid } "></sql:query>
		<c:if test="${q.rows[0].c_order==1 }">
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构删除
					</div>
				</td>
			</tr>
			<tr>
			<td width="33%"><div align="center">机构类型</div></td>
			<td width="33%"><div align="center">名称</div></td> 
			<td width="33%"><div align="center">删除</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization  where c_flag='0' and c_orgtypeid=${param.c_orgtypeid }  "></sql:query>
			<c:forEach items="${q1.rows }" var="row">			 
			<tr>
			<td width="20%"><div align="center">${q.rows[0].c_name }</div></td> 
			<td width="20%"><div align="center">${row.c_name }</div></td>	 
			<td width="20%" align="center">	<a href="../../../toModule.do?prefix=/system&page=/organization/organization/delete4.jsp?c_no=${row.c_no }&c_orgtypeid=${param.c_orgtypeid }">删除</a>	</td>			 
			</tr></c:forEach></table>			 			
		</c:if>
		<c:if test="${q.rows[0].c_order==2 }">
			<form action="../../../toModule.do?prefix=/system&page=/organization/organization/delete3.jsp" method="post">
			<input type="hidden" name="c_orgtypeid" value="${param.c_orgtypeid }">
			<input type="hidden" name="c_deptid" value="0">
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构删除
					</div>
				</td>
			</tr> 		
			<sql:query var="top1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 1 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top1.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left">
					<select name="c_jigou" style="width: 120">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_flag='0' and c_parent=-1 "></sql:query>
					<c:forEach items="${q2.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr>  
			<tr>
				<td width="48%" align="right"><input type="submit" value="下一步"></td>
				<td width="52%" colspan="2"> 
				</td> 
			</tr>		
			</table>				
			</form>			
		</c:if>
		<c:if test="${q.rows[0].c_order==3 }">
			<form action="../../../toModule.do?prefix=/system&page=/organization/organization/delete3.jsp" method="post">
			<input type="hidden" name="c_orgtypeid" value="${param.c_orgtypeid }">
			<input type="hidden" name="c_deptid" value="0">
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构删除
					</div>
				</td>
			</tr> 		
			<sql:query var="top1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 1 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top1.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_flag='0' and c_parent=-1 "></sql:query>
					<select name="c_jigou1" onchange="set()">
					<c:forEach var="row" items="${q2.rows }">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr> 
			<sql:query var="top2" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 2 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top2.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left">
				 	<select name="c_jigou" id="c_jigou">			 
					</select>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%" align="right"><input type="submit" value="下一步"></td>
				<td width="52%" colspan="2"> 
				</td> 
			</tr>		
			</table>				
			</form>	
			<script type="text/javascript">
			function set()
			{  
				var c_jigou1=document.getElementsByName("c_jigou1")[0].value  
				Organization.get_childorg(c_jigou1, get);
				return false;
			}
			function get(datas)
			{	
				DWRUtil.removeAllOptions('c_jigou');					
				DWRUtil.addOptions('c_jigou', datas, 'value', 'label'); 
			} 	
			set()	 
			</script>
		</c:if>
		<c:if test="${q.rows[0].c_order==4 }">
			<form action="../../../toModule.do?prefix=/system&page=/organization/organization/delete3.jsp" method="post">
			<input type="hidden" name="c_orgtypeid" value="${param.c_orgtypeid }"> 
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构删除
					</div>
				</td>
			</tr> 		
			<sql:query var="top1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 1 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top1.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_flag='0' and c_parent=-1 "></sql:query>
					<select name="c_jigou1" onchange="set()">
					<c:forEach var="row" items="${q2.rows }">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr> 
			<sql:query var="top2" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 2 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top2.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left"> 
					<select name="c_jigou2" onchange="set2()" id="c_jigou2"> 
					</select>
				</div>
				</td>
			</tr> 
			<sql:query var="top3" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 3 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top3.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left">
				 	<select name="c_jigou" id="c_jigou" onchange="set3()">			 
					</select>
					事业部
					<select name="c_deptid"  id="c_deptid">		 
					</select>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%" align="right"><input type="submit" value="下一步"></td>
				<td width="52%" colspan="2"> 
				</td> 
			</tr>		
			</table>				
			</form>	
			<script type="text/javascript">
			function set()
			{  
				var c_jigou1=document.getElementsByName("c_jigou1")[0].value  
				Organization.get_childorg(c_jigou1, get);
				return false;
			}
			function get(datas)
			{	
				DWRUtil.removeAllOptions('c_jigou2');					
				DWRUtil.addOptions('c_jigou2', datas, 'value', 'label'); 
				set2()
			} 	
			function set2()
			{  
				var c_jigou2=document.getElementsByName("c_jigou2")[0].value  
				Organization.get_childorg(c_jigou2, get2);
				return false;
			}
			function get2(datas)
			{	
				DWRUtil.removeAllOptions('c_jigou');					
				DWRUtil.addOptions('c_jigou', datas, 'value', 'label'); 
				set3()
			} 
			function set3()
			{  
				var jigou3=document.getElementsByName("c_jigou")[0].value  
				Organization.get_childdept_alltype(jigou3, get3);
				return false;
			}
			function get3(datas)
			{	
				DWRUtil.removeAllOptions('c_deptid');					
				DWRUtil.addOptions('c_deptid', datas, 'value', 'label');  			 
			} 
			set()	 
			</script>
		</c:if>
		<c:if test="${q.rows[0].c_order==5 }">
			<form action="../../../toModule.do?prefix=/system&page=/organization/organization/delete3.jsp" method="post">
			<input type="hidden" name="c_orgtypeid" value="${param.c_orgtypeid }">
			<input type="hidden" name="c_deptid" value="0">
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构删除
					</div>
				</td>
			</tr> 		
			<sql:query var="top1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 1 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top1.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left"> 
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_flag='0' and c_parent=-1 "></sql:query>
					<select name="c_jigou1" onchange="set()">
					<c:forEach var="row" items="${q2.rows }">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr> 
			<sql:query var="top2" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 2 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top2.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left"> 
					<select name="c_jigou2" onchange="set2()" id="c_jigou2"> 
					</select>
				</div>
				</td>
			</tr> 
			<sql:query var="top3" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 3 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top3.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left"> 
					<select name="c_jigou3" onchange="set3()" id="c_jigou3"> 
					</select>
					事业部
					<select name="c_deptid2"  id="c_deptid2" onchange="set4()">		 
					</select>
				</div>
				</td>
			</tr> 
			<sql:query var="top4" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 4 "></sql:query>
			<tr>
				<td width="48%"><div align="right">${fn:trim(top4.rows[0].c_name) }</div></td>
				<td width="52%" >
				<div align="left">
				 	<select name="c_jigou" id="c_jigou">			 
					</select>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%" align="right"><input type="submit" value="下一步"></td>
				<td width="52%" colspan="2"> 
				</td> 
			</tr>		
			</table>				
			</form>	
			<script type="text/javascript">
			function set()
			{  
				var c_jigou1=document.getElementsByName("c_jigou1")[0].value  
				Organization.get_childorg(c_jigou1, get);
				return false;
			}
			function get(datas)
			{	
				DWRUtil.removeAllOptions('c_jigou2');					
				DWRUtil.addOptions('c_jigou2', datas, 'value', 'label'); 
				set2()
			} 	
			function set2()
			{  
				var c_jigou2=document.getElementsByName("c_jigou2")[0].value  
				Organization.get_childorg(c_jigou2, get2);
				return false;
			}
			function get2(datas)
			{	
				DWRUtil.removeAllOptions('c_jigou3');					
				DWRUtil.addOptions('c_jigou3', datas, 'value', 'label'); 
				set3()
			} 
			function set3()
			{  
				var jigou3=document.getElementsByName("c_jigou3")[0].value  
				Organization.get_childdept_alltype(jigou3, get3);
				return false;
			}
			function get3(datas)
			{	
				DWRUtil.removeAllOptions('c_deptid2');					
				DWRUtil.addOptions('c_deptid2', datas, 'value', 'label');  
				set4()
			} 
			function set4()
			{  
				var jigou3=document.getElementsByName("c_jigou3")[0].value  
				var c_deptid=document.getElementsByName("c_deptid2")[0].value  
				Organization.get_childorg2(jigou3,c_deptid, get4);
				return false;
			}
			function get4(datas)
			{	
				DWRUtil.removeAllOptions('c_jigou');					
				DWRUtil.addOptions('c_jigou', datas, 'value', 'label'); 
			} 	
			set()	 
			</script>
		</c:if>
		
	</body> 
</html:html>
