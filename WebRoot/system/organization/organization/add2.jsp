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
	<script type='text/javascript' src='../../../dwr/interface/Staff.js'></script>
</head>		
	<body>	
		<sql:query var="q" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid } "></sql:query>
		<c:if test="${q.rows[0].c_order==1 }">
			<html:form  action="/organization" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="add_update_delete"/>
			<nested:nest property="organization">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden>
			<nested:hidden property="c_orgtypeid" value="${param.c_orgtypeid }"></nested:hidden> 
			<nested:hidden property="c_parent" value="-1"></nested:hidden> 
			<nested:hidden property="c_deptid" value="0"></nested:hidden> 
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构添加
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="40%"><div align="right">${fn:trim(q.rows[0].c_name) }名称</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="机构名称不能为空 " size="30"></nested:text>
					<c:choose>
					<c:when test="${q.rows[0].c_mark eq 0 }">
					前缀<nested:text property="c_prefix" value="" styleId="req" title="机构前缀不能为空 " size="2"></nested:text>
					</c:when>
					<c:when test="${q.rows[0].c_mark eq 1 }">
					<nested:hidden property="c_prefix" value="**"></nested:hidden>
					</c:when>
					</c:choose>			 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">工商营业执照编号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_license" value=""  ></nested:text>
					有效开始日<nested:text property="c_lbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_lend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">企业经营许可证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_permit" value=""  ></nested:text>
					有效开始日<nested:text property="c_pbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_pend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">税务登记证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_tax" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">组织机构代码</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_organization" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">负责人工号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_jobnumber" styleId="c_jobnumber" value=""  onchange="findjobnumber()" ></nested:text>
					姓名<input name="head_name" size="6"> 
					联系电话<input name="head_phone">
				</div>
				</td>
			</tr> 
			<script type="text/javascript"> 
				function getjobnumber(datas)
				{	 					
					document.getElementsByName("head_name")[0].value= datas.c_name;
					document.getElementsByName("head_phone")[0].value= datas.c_mobilephone;
				} 	
				function findjobnumber()
				{
					var c_jobnumber=document.getElementById("c_jobnumber");					
					Staff.getstaff(c_jobnumber.value,getjobnumber); 
					return false;
				}				
			</script>
			<tr>
				<td width="40%"><div align="right">是否已篆刻公章</div></td>
				<td width="60%" >
				<div align="left">
					<nested:select property="c_seal" value=""  >
					<html:option value="0">已篆刻</html:option>
					<html:option value="1">未篆刻</html:option>
					</nested:select>
					公章存放地址<nested:text property="c_slocation" value="" ></nested:text>					 
				</div>
				</td>
			</tr> 
			
			<tr>
				<td width="40%"><div align="right">基本户</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="bank" dataSource="${db_mssql }" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bbank" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_bcard" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank1" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard1" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank2" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard2" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">电话</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_phone" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">地址</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_address" value=""  size="60"></nested:text>
				</div>
				</td>
			</tr> 			
			</nested:nest>		
			<tr>
				<td width="40%" align="right"><html:submit value=" 确 定 "/></td>
				<td width="60%" colspan="2">
					<html:reset  value=" 取 消 " />
				</td> 
			</tr>		
			</table>	
			</html:form> 			
		</c:if>
		<c:if test="${q.rows[0].c_order==2 }">
			<html:form  action="/organization" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="add_update_delete"/>
			<nested:nest property="organization">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden>
			<nested:hidden property="c_orgtypeid" value="${param.c_orgtypeid }"></nested:hidden>  
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构添加
					</div>
				</td>
			</tr> 	
			<sql:query var="top1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 1 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top1.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_flag='0' and c_parent=-1  "></sql:query>
					<nested:select property="c_parent">
					<c:forEach var="row" items="${q2.rows }">
					<html:option value="${row.c_no }">${row.c_name }</html:option>
					</c:forEach>
					</nested:select>
					<nested:hidden property="c_deptid" value="0"></nested:hidden> 
				</div>
				</td>
			</tr> 	
			<tr>
				<td width="40%"><div align="right">${fn:trim(q.rows[0].c_name) }名称</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="机构名称不能为空 " size="30"></nested:text>
					<c:choose>
					<c:when test="${q.rows[0].c_mark eq 0 }">
					前缀<nested:text property="c_prefix" value="" styleId="req" title="机构前缀不能为空 " size="2"></nested:text>
					</c:when>
					<c:when test="${q.rows[0].c_mark eq 1 }">
					<nested:hidden property="c_prefix" value="**"></nested:hidden>
					</c:when>
					</c:choose>	
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">工商营业执照编号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_license" value=""  ></nested:text>
					有效开始日<nested:text property="c_lbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_lend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">企业经营许可证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_permit" value=""  ></nested:text>
					有效开始日<nested:text property="c_pbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_pend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">税务登记证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_tax" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">组织机构代码</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_organization" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">负责人工号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_jobnumber" styleId="c_jobnumber" value=""  onchange="findjobnumber()" ></nested:text>
					姓名<input name="head_name" size="6"> 
					联系电话<input name="head_phone">
				</div>
				</td>
			</tr> 
			<script type="text/javascript"> 
				function getjobnumber(datas)
				{	 					
					document.getElementsByName("head_name")[0].value= datas.c_name;
					document.getElementsByName("head_phone")[0].value= datas.c_mobilephone;
				} 	
				function findjobnumber()
				{
					var c_jobnumber=document.getElementById("c_jobnumber");					
					Staff.getstaff(c_jobnumber.value,getjobnumber); 
					return false;
				}				
			</script>
			<tr>
				<td width="40%"><div align="right">是否已篆刻公章</div></td>
				<td width="60%" >
				<div align="left">
					<nested:select property="c_seal" value=""  >
					<html:option value="0">已篆刻</html:option>
					<html:option value="1">未篆刻</html:option>
					</nested:select>
					公章存放地址<nested:text property="c_slocation" value="" ></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">基本户</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="bank" dataSource="${db_mssql }" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bbank" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_bcard" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank1" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard1" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank2" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard2" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">电话</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_phone" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">地址</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_address" value=""  size="60"></nested:text>
				</div>
				</td>
			</tr> 		
			</nested:nest>		
			<tr>
				<td width="40%" align="right"><html:submit value=" 确 定 "/></td>
				<td width="60%" colspan="2">
					<html:reset  value=" 取 消 " />
				</td> 
			</tr>		
			</table>	
			</html:form> 			
		</c:if>
		<c:if test="${q.rows[0].c_order==3 }">
			<html:form  action="/organization" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="add_update_delete"/>
			<nested:nest property="organization">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden>
			<nested:hidden property="c_orgtypeid" value="${param.c_orgtypeid }"></nested:hidden>  
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构添加
					</div>
				</td>
			</tr> 	
			<sql:query var="top1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 1 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top1.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_flag='0' and  c_parent=-1 "></sql:query>
					<select name="jigou1" onchange="set()">
					<c:forEach var="row" items="${q2.rows }">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr> 
			<sql:query var="top2" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 2 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top2.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
				 	<nested:select property="c_parent" styleId="c_parent2">			 
					</nested:select>
					<nested:hidden property="c_deptid" value="0" styleId="req" title="机构名称不能为空 " ></nested:hidden> 
				</div>
				</td>
			</tr>	
			<tr>
				<td width="40%"><div align="right">${fn:trim(q.rows[0].c_name) }名称</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="机构名称不能为空 " size="30"></nested:text>
					<c:choose>
					<c:when test="${q.rows[0].c_mark eq 0 }">
					前缀<nested:text property="c_prefix" value="" styleId="req" title="机构前缀不能为空 " size="2"></nested:text>
					</c:when>
					<c:when test="${q.rows[0].c_mark eq 1 }">
					<nested:hidden property="c_prefix" value="**"></nested:hidden>
					</c:when>
					</c:choose>	
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">工商营业执照编号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_license" value=""  ></nested:text>
					有效开始日<nested:text property="c_lbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_lend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">企业经营许可证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_permit" value=""  ></nested:text>
					有效开始日<nested:text property="c_pbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_pend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">税务登记证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_tax" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">组织机构代码</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_organization" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">负责人工号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_jobnumber" styleId="c_jobnumber" value=""  onchange="findjobnumber()" ></nested:text>
					姓名<input name="head_name" size="6"> 
					联系电话<input name="head_phone">
				</div>
				</td>
			</tr> 
			<script type="text/javascript"> 
				function getjobnumber(datas)
				{	 					
					document.getElementsByName("head_name")[0].value= datas.c_name;
					document.getElementsByName("head_phone")[0].value= datas.c_mobilephone;
				} 	
				function findjobnumber()
				{
					var c_jobnumber=document.getElementById("c_jobnumber");					
					Staff.getstaff(c_jobnumber.value,getjobnumber); 
					return false;
				}				
			</script>
			<tr>
				<td width="40%"><div align="right">是否已篆刻公章</div></td>
				<td width="60%" >
				<div align="left">
					<nested:select property="c_seal" value=""  >
					<html:option value="0">已篆刻</html:option>
					<html:option value="1">未篆刻</html:option>
					</nested:select>
					公章存放地址<nested:text property="c_slocation" value="" ></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">基本户</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="bank" dataSource="${db_mssql }" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bbank" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_bcard" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank1" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard1" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank2" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard2" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">电话</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_phone" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">地址</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_address" value=""  size="60"></nested:text>
				</div>
				</td>
			</tr> 		
			</nested:nest>		
			<tr>
				<td width="40%" align="right"><html:submit value=" 确 定 "/></td>
				<td width="60%" colspan="2">
					<html:reset  value=" 取 消 " />
				</td> 
			</tr>		
			</table>	
			</html:form> 			
			<script type="text/javascript">
			function set()
			{  
				var jigou1=document.getElementsByName("jigou1")[0].value  
				Organization.get_childorg(jigou1, get);
				return false;
			}
			function get(datas)
			{	
				DWRUtil.removeAllOptions('c_parent2');					
				DWRUtil.addOptions('c_parent2', datas, 'value', 'label'); 
			} 	
			set()	 
			</script>
		</c:if>
		<c:if test="${q.rows[0].c_order==4 }">
			<html:form  action="/organization" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="add_update_delete"/>
			<nested:nest property="organization">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden>
			<nested:hidden property="c_orgtypeid" value="${param.c_orgtypeid }"></nested:hidden>  
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构添加
					</div>
				</td>
			</tr> 	
			<sql:query var="top1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 1 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top1.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_flag='0' and c_parent=-1 "></sql:query>
					<select name="jigou1" onchange="set()">
					<c:forEach var="row" items="${q2.rows }">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr> 
			<sql:query var="top2" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 2 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top2.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
					<select name="jigou2" onchange="set2()" id="jigou2">		 
					</select>
				</div>
				</td>
			</tr>	
			<sql:query var="top3" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 3 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top3.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
				 	<nested:select property="c_parent" styleId="c_parent3" onchange="setdept()">			 
					</nested:select>
					事业部
					<nested:select property="c_deptid" styleId="c_deptid">			 
					 </nested:select>
				</div>
				</td>
			</tr> 
			<script type="text/javascript">
			function set()
			{  
				var jigou1=document.getElementsByName("jigou1")[0].value  
				Organization.get_childorg(jigou1, get);
				return false;
			}
			function get(datas)
			{	
				DWRUtil.removeAllOptions('jigou2');					
				DWRUtil.addOptions('jigou2', datas, 'value', 'label'); 
				set2()
			} 	
			function set2()
			{  
				var jigou2=document.getElementsByName("jigou2")[0].value  
				Organization.get_childorg(jigou2, get2);
				return false;
			}
			function get2(datas)
			{	
				DWRUtil.removeAllOptions('c_parent3');					
				DWRUtil.addOptions('c_parent3', datas, 'value', 'label'); 
				setdept()
			} 	
			function setdept()
			{  
				var jigou3=document.getElementsByName("organization.c_parent")[0].value  
				Organization.get_childdept_alltype(jigou3, getdept);
				return false;
			}
			function getdept(datas)
			{	
				DWRUtil.removeAllOptions('c_deptid');					
				DWRUtil.addOptions('c_deptid', datas, 'value', 'label'); 
			} 	
			set()	 
			</script> 				
			<tr>
				<td width="40%"><div align="right">${fn:trim(q.rows[0].c_name) }名称</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="机构名称不能为空 " size="30"></nested:text>
					<c:choose>
					<c:when test="${q.rows[0].c_mark eq 0 }">
					前缀<nested:text property="c_prefix" value="" styleId="req" title="机构前缀不能为空 " size="2"></nested:text>
					</c:when>
					<c:when test="${q.rows[0].c_mark eq 1 }">
					<nested:hidden property="c_prefix" value="**"></nested:hidden>
					</c:when>
					</c:choose>	
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">工商营业执照编号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_license" value=""  ></nested:text>
					有效开始日<nested:text property="c_lbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_lend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">企业经营许可证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_permit" value=""  ></nested:text>
					有效开始日<nested:text property="c_pbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_pend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">税务登记证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_tax" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">组织机构代码</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_organization" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">负责人工号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_jobnumber" styleId="c_jobnumber" value=""  onchange="findjobnumber()" ></nested:text>
					姓名<input name="head_name" size="6"> 
					联系电话<input name="head_phone">
				</div>
				</td>
			</tr> 
			<script type="text/javascript"> 
				function getjobnumber(datas)
				{	 					
					document.getElementsByName("head_name")[0].value= datas.c_name;
					document.getElementsByName("head_phone")[0].value= datas.c_mobilephone;
				} 	
				function findjobnumber()
				{
					var c_jobnumber=document.getElementById("c_jobnumber");					
					Staff.getstaff(c_jobnumber.value,getjobnumber); 
					return false;
				}				
			</script>
			<tr>
				<td width="40%"><div align="right">是否已篆刻公章</div></td>
				<td width="60%" >
				<div align="left">
					<nested:select property="c_seal" value=""  >
					<html:option value="0">已篆刻</html:option>
					<html:option value="1">未篆刻</html:option>
					</nested:select>
					公章存放地址<nested:text property="c_slocation" value="" ></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">基本户</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="bank" dataSource="${db_mssql }" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bbank" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_bcard" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank1" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard1" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank2" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard2" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">电话</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_phone" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">地址</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_address" value=""  size="60"></nested:text>
				</div>
				</td>
			</tr> 		
			</nested:nest>		
			<tr>
				<td width="40%" align="right"><html:submit value=" 确 定 "/></td>
				<td width="60%" colspan="2">
					<html:reset  value=" 取 消 " />
				</td> 
			</tr>		
			</table>	
			</html:form> 				
		</c:if>
		<c:if test="${q.rows[0].c_order==5 }">
			<html:form  action="/organization" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="add_update_delete"/>
			<nested:nest property="organization">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden>
			<nested:hidden property="c_orgtypeid" value="${param.c_orgtypeid }"></nested:hidden>  
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构添加
					</div>
				</td>
			</tr> 	
			<sql:query var="top1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 1 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top1.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_flag='0' and c_parent=-1 "></sql:query>
					<select name="jigou1" onchange="set()">
					<c:forEach var="row" items="${q2.rows }">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr> 
			<sql:query var="top2" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 2 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top2.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
					<select name="jigou2" onchange="set2()" id="jigou2">		 
					</select>
				</div>
				</td>
			</tr>	
			<sql:query var="top3" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 3 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top3.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
					<select name="jigou3" onchange="set3()" id="jigou3" >		 
					</select>
					事业部
					<select name="c_deptid"  id="c_deptid" onchange="set4()">		 
					</select> 
				</div>
				</td>
			</tr>				 	
			<sql:query var="top4" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order= 4 "></sql:query>
			<tr>
				<td width="40%"><div align="right">${fn:trim(top4.rows[0].c_name) }</div></td>
				<td width="60%" >
				<div align="left">
				 	<nested:select property="c_parent" styleId="c_parent4" >			 
					</nested:select>
					<nested:hidden property="c_deptid" value="0"></nested:hidden> 
				</div>
				</td>
			</tr>				
			<tr>
				<td width="40%"><div align="right">${fn:trim(q.rows[0].c_name) }名称</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="机构名称不能为空 " size="30"></nested:text>
					<c:choose>
					<c:when test="${q.rows[0].c_mark eq 0 }">
					前缀<nested:text property="c_prefix" value="" styleId="req" title="机构前缀不能为空 " size="2"></nested:text>
					</c:when>
					<c:when test="${q.rows[0].c_mark eq 1 }">
					<nested:hidden property="c_prefix" value="**"></nested:hidden>
					</c:when>
					</c:choose>	
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">工商营业执照编号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_license" value=""  ></nested:text>
					有效开始日<nested:text property="c_lbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_lend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">企业经营许可证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_permit" value=""  ></nested:text>
					有效开始日<nested:text property="c_pbeg" value=""  maxlength="8" size="8"></nested:text>
					有效结束日<nested:text property="c_pend" value=""  maxlength="8" size="8"></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">税务登记证号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_tax" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">组织机构代码</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_organization" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">负责人工号</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_jobnumber" styleId="c_jobnumber" value=""  onchange="findjobnumber()" ></nested:text>
					姓名<input name="head_name" size="6"> 
					联系电话<input name="head_phone">
				</div>
				</td>
			</tr> 
			<script type="text/javascript"> 
				function getjobnumber(datas)
				{	 					
					document.getElementsByName("head_name")[0].value= datas.c_name;
					document.getElementsByName("head_phone")[0].value= datas.c_mobilephone;
				} 	
				function findjobnumber()
				{
					var c_jobnumber=document.getElementById("c_jobnumber");					
					Staff.getstaff(c_jobnumber.value,getjobnumber); 
					return false;
				}				
			</script>
			<tr>
				<td width="40%"><div align="right">是否已篆刻公章</div></td>
				<td width="60%" >
				<div align="left">
					<nested:select property="c_seal" value=""  >
					<html:option value="0">已篆刻</html:option>
					<html:option value="1">未篆刻</html:option>
					</nested:select>
					公章存放地址<nested:text property="c_slocation" value="" ></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">基本户</div></td>
				<td width="60%" >
				<div align="left">
					<sql:query var="bank" dataSource="${db_mssql }" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bbank" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_bcard" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank1" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard1" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">一般户</div></td>
				<td width="60%" >
				<div align="left"> 
					<nested:select property="c_gbank2" value=""  >
					<c:forEach items="${bank.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
					账号<nested:text property="c_gcard2" value="" size="40"></nested:text>					 
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">电话</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_phone" value=""  ></nested:text>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="40%"><div align="right">地址</div></td>
				<td width="60%" >
				<div align="left">
					<nested:text property="c_address" value=""  size="60"></nested:text>
				</div>
				</td>
			</tr> 		
			</nested:nest>		
			<tr>
				<td width="40%" align="right"><html:submit value=" 确 定 "/></td>
				<td width="60%" colspan="2">
					<html:reset  value=" 取 消 " />
				</td> 
			</tr>		
			</table>	
			</html:form> 			
			<script type="text/javascript">
			function set()
			{  
				var jigou1=document.getElementsByName("jigou1")[0].value  
				Organization.get_childorg(jigou1, get);
				return false;
			}
			function get(datas)
			{	
				DWRUtil.removeAllOptions('jigou2');					
				DWRUtil.addOptions('jigou2', datas, 'value', 'label'); 
				set2()
			} 	
			function set2()
			{  
				var jigou2=document.getElementsByName("jigou2")[0].value  
				Organization.get_childorg(jigou2, get2);
				return false;
			}
			function get2(datas)
			{	
				DWRUtil.removeAllOptions('jigou3');					
				DWRUtil.addOptions('jigou3', datas, 'value', 'label'); 
				set3()
			} 	
			function set3()
			{  
				var jigou3=document.getElementsByName("jigou3")[0].value  
				Organization.get_childdept_alltype(jigou3, get3);
				return false;
			}
			function get3(datas)
			{	
				DWRUtil.removeAllOptions('c_deptid');					
				DWRUtil.addOptions('c_deptid', datas, 'value', 'label');  
				set4()
			} 
			function set4()
			{  
				var jigou3=document.getElementsByName("jigou3")[0].value  
				var c_deptid=document.getElementsByName("c_deptid")[0].value  
				Organization.get_childorg2(jigou3,c_deptid, get4);
				return false;
			}
			function get4(datas)
			{	
				DWRUtil.removeAllOptions('c_parent4');					
				DWRUtil.addOptions('c_parent4', datas, 'value', 'label'); 
			} 	
			set()	 
			</script>
		</c:if>
		
	</body> 
</html:html>
