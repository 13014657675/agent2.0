<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<!-- 省公司 -->
<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order=3 order by c_order "></sql:query>
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 
	<script type="text/javascript">
	ii=0;
	function set(i)
	{  
		ii=i;
		var c_orgtypeid=document.getElementById("c_orgtypeid"+i).value 		 
		Organization.get_typeorg(c_orgtypeid, get);
		return false;
	}
	function get(datas)
	{					
		//alert(ii)
		DWRUtil.removeAllOptions('c_orgid'+ii);					
		DWRUtil.addOptions('c_orgid'+ii, datas, 'value', 'label'); 	
		set2(ii)		 
	} 	
	jj=0;	
	function set2(j)
	{  
		jj=j;
		var c_orgid=document.getElementById("c_orgid"+j).value;
		Organization.get_childdept(c_orgid, get2); 
		return false;
	}
	function get2(datas)
	{	
		//alert(jj)
		DWRUtil.removeAllOptions('c_deptid'+jj);					
		DWRUtil.addOptions('c_deptid'+jj, datas, 'value', 'label');  
	} 	    	
	var s=100
	function addfj()
	{ 
		s+=1;
		var row=tb1.insertRow(tb1.rows.length-1);
		var cell1 = row.insertCell();
		cell1.align="center"; 
		var str="<td ><select name=c_orgtypeid id=c_orgtypeid"+s+" onchange=set("+s+")>";
		<c:forEach items="${q1.rows }" var="row">
		str+="<option value=${row.c_no }>${row.c_name }</option>";
		</c:forEach>
		str+="</select>";
		str+="<select name=role.c_orgid id=c_orgid"+s+" onchange=set2("+s+")></select>";
		str+="<select name=role.c_deptid id=c_deptid"+s+" ></select></td>";
		//alert(str)
		cell1.innerHTML=str;  				 
		var cell2 = row.insertCell(); 
		cell2.align="center"; 
		cell2.innerHTML="<td  ><input type=button onclick=deleteitem(this,'tb1') value='删除本行' id=del ></td>";		
		set(s);	  
	}
	function deleteitem(obj,id)
    {
     	var rowNum,curRow;
     	curRow = obj.parentNode.parentNode;
	 	rowNum = eval("document.all."+id).rows.length - 1;
     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex);     	 
    }	
	</script>
</head>		
	<body>		
		<html:form  action="/signed" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="roleset"/>
		<nested:nest property="role">	
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<nested:hidden property="c_sys" value="3"></nested:hidden> 
		 
		<table width="100%" border="1" cellspacing="0" id="tb1">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						设置
					</div>
				</td>
			</tr> 	
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${param.c_jobnumber }'"></sql:query>	
			<tr>
				<td width="50%" align="center">姓名</td>
				<td width="50%" align="center">${q2.rows[0].c_name }</td>
			</tr>
			<tr>	
				<td width="50%" align="center">工号</td>
				<td width="50%" align="center">
				${q2.rows[0].c_jobnumber }
				<nested:hidden property="c_jobnumber" value="${q2.rows[0].c_jobnumber }"></nested:hidden>
				</td>
			</tr> 	
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_roleset where c_jobnumber='${param.c_jobnumber }' order by c_no"></sql:query>
			<c:forEach items="${q3.rows }" var="row3" varStatus="x">			
			<tr>	
				<sql:query var="q3x" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row3.c_orgid } "></sql:query>
				<td width="50%" align="center">
				<select name="c_orgtypeid" id="c_orgtypeid${x.index+1 }" onchange="set(${x.index+1 })">
				<c:forEach items="${q1.rows }" var="row4">
				<c:choose>				
				<c:when test="${row4.c_no eq q3x.rows[0].c_orgtypeid }">
				<option value="${row4.c_no }" selected="selected">${row4.c_name }</option>
				</c:when>
				<c:when test="${row4.c_no ne q3x.rows[0].c_orgtypeid }">
				<option value="${row4.c_no }" >${row4.c_name }</option> 
				</c:when>
				</c:choose>				
				</c:forEach>
				</select>				
				<sql:query var="q5" dataSource="${db_mssql }" sql="select a.c_no, a.c_name c_namea ,b.c_name c_nameb,c.c_name c_namec from  t_organization a ,t_organization b ,t_organization c 
					where a.c_parent=b.c_no and b.c_parent=c.c_no and a.c_flag='0' and a.c_orgtypeid=${q3x.rows[0].c_orgtypeid } order by a.c_path"></sql:query>
				<select name="role.c_orgid"  id="c_orgid${x.index+1 }" onchange="set2(${x.index+1 })">
				<c:forEach items="${q5.rows }" var="row5">
				<c:choose>				
				<c:when test="${row5.c_no eq row3.c_orgid  }">
				<option value="${row5.c_no }" selected="selected">${row5.c_namea }->${row5.c_nameb }->${row5.c_namec }</option> 
				</c:when>
				<c:when test="${row5.c_no ne row3.c_orgid }">
				<option value="${row5.c_no }" >${row5.c_namea }->${row5.c_nameb }->${row5.c_namec }</option> 
				</c:when>
				</c:choose>				
				</c:forEach>
				</select>
				<sql:query var="q6" dataSource="${db_mssql }" sql="select * from t_dept where c_orgid=${row3.c_orgid }"></sql:query>
				<select name="role.c_deptid" id="c_deptid${x.index+1 }" >
				<c:forEach items="${q6.rows }" var="row6">
				<c:choose>				
				<c:when test="${row6.c_no eq row3.c_deptid  }">
				<option value="${row6.c_no }" selected="selected">${row6.c_name }</option> 
				</c:when>
				<c:when test="${row6.c_no ne row3.c_deptid }">
				<option value="${row6.c_no }" >${row6.c_name }</option> 
				</c:when>
				</c:choose>				
				</c:forEach>
				</select>
				</td>
				<td width="50%" align="center">
				 <input type=button onclick=deleteitem(this,'tb1') value='删除本行' id=del >
				</td>
			</tr> 		
			</c:forEach>
			</nested:nest>		
			<tr>
				<td width="48%" align="right"  ><input type="button" value=" 添加一行 " onclick="addfj()"></td>
				<td width="52%" align="left"  >
					<html:submit value=" 确 定 "/>
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 
</html:html>
