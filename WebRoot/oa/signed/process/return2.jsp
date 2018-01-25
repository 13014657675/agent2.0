<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<sql:query var="a0" dataSource="${db_mssql }" 
	sql="select * from t_orgtype  where c_no in (select c_orgtypeid from t_organization where c_no=${sessionScope.Staff.c_orgid })"></sql:query>
<c:if test="${not empty a0.rows[0] }">
<sql:query var="a1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order = 3 order by c_order "></sql:query>
<sql:query var="q1a" dataSource="${db_mssql }" sql="select left( c_path,3*2 )+'%' c_path from t_organization where c_no = ${sessionScope.Staff.c_orgid } "></sql:query>
<sql:query var="q1b" dataSource="${db_mssql }" sql="select * from t_organization 
	where c_orgtypeid=${a1.rows[0].c_no } and c_path like '${q1a.rows[0].c_path }'"></sql:query>
</c:if>
<sql:query var="a2" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${sessionScope.Staff.c_orgid }"></sql:query>
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 
	<script type='text/javascript' src='../../../dwr/interface/Staff.js'></script>
	<script type="text/javascript"> 
	var c_sheng=${q1b.rows[0].c_no}
	function set()
	{  
		var c_orgtypeid=document.getElementsByName("c_orgtypeid")[0].value 
		Organization.get_typeorg(c_orgtypeid, get);
		return false;
	}
	function get(datas)
	{					
		DWRUtil.removeAllOptions('c_orgid2');	
		for (var i=0;i<datas.length;i++)
		{
			if (datas[i].value == c_sheng )
			{ 
				v=datas[i].value
				l=datas[i].label	
			}
		}
		var opp = new Option(l,v); 		
		var c_orgid2=document.getElementById("c_orgid2")
		c_orgid2.add(opp);				
		//DWRUtil.addOptions('c_orgid2', datas, 'value', 'label'); 		
		set2()	 
	} 		
	function set2()
	{  
		var c_orgid2=document.getElementsByName("sprocess.c_orgid2")[0].value;
		Organization.get_childdept(c_orgid2, get2); 
		return false;
	}
	function get2(datas)
	{	
		DWRUtil.removeAllOptions('c_deptid2');					
		DWRUtil.addOptions('c_deptid2', datas, 'value', 'label'); 
		set3()
	} 	  
	function set3()
	{  
		var c_deptid2=document.getElementsByName("sprocess.c_deptid2")[0].value;
		Staff.get_childstaff(c_deptid2, get3); 
		return false;
	}
	function get3(datas)
	{	
		DWRUtil.removeAllOptions('c_jobnumber2');					
		DWRUtil.addOptions('c_jobnumber2', datas, 'value', 'label'); 
	} 	  
	function addto()
	{ 
		 var c_to=document.getElementsByName("sprocess.c_to")[0];
		 var addto=document.getElementById("addto");
		 var str="<select name=c_orgtypeid id=c_orgtypeid onchange=set()>";
		 <c:forEach items="${a1.rows }" var="row">
		 str+="<option value=${row.c_no }>${row.c_name }</option>";
		 </c:forEach>
		 str+="</select>";
		 str+="<select name=sprocess.c_orgid2 id=c_orgid2 onchange=set2()></select>";
		 str+="<select name=sprocess.c_deptid2 id=c_deptid2 onchange=set3()></select>";
		 str+="<select name=sprocess.c_jobnumber2 id=c_jobnumber2></select>";
		 if (c_to.value==3)
		 {
		  addto.innerHTML="";
		  addto.innerHTML=str;
		  set();
		 } 	  	 
		 else
		 {
		  addto.innerHTML="";
		 }
	}	
	function js_receive(s)
	{  
		var tr_receive=document.getElementById("tr_receive"); 
		if (tr_receive)
		{
			if (s==1 )
			{
				tr_receive.style.display=""		
			}
			if (s==2 )
			{
				tr_receive.style.display="none"		
			}
		}		
	} 
	</script>
</head>		
	<body> 
		<html:form  action="/signed" onsubmit="return check_form(this)"  >
		<html:hidden property="jobname" value="signed_return"/>
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_signed  where c_no =${param.c_no } "></sql:query>	
		<table width="100%" border="1" cellspacing="0"  >
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						签报签批
					</div>
				</td>
			</tr> 			
			<tr>
				<td width="25%"><div align="center">签批号</div></td>
				<td width="25%"><div align="center">${param.c_no }</div></td>
				<td width="25%"><div align="center">类型</div></td>
				<td width="25%"><div align="center">
				<c:choose>
				<c:when test="${q1.rows[0].c_type eq 31 }">项目签报</c:when>
				<c:when test="${q1.rows[0].c_type eq 32 }">费用签报</c:when>
				</c:choose>
				</div></td> 
			</tr>			 
			<tr>
				<td width="25%"><div align="center">内容</div></td>
				<td width="75%" colspan="3" >
				<div align="left"><textarea rows="10" cols="150" readonly="readonly">${fn:trim(q1.rows[0].c_note) }</textarea>
				</div>
				</td>					 
			</tr> 
			<c:choose>
				<c:when test="${q1.rows[0].c_type eq 31 }">
				<tr style="color: #828282">
					<td width="25%" ><div align="center">金额</div></td>
					<td width="75%" colspan="3" >				 
					<div >
						 0
					</div>
					</td>
				</tr> 	
				</c:when>
				<c:when test="${q1.rows[0].c_type eq 32 }">
				<tr style="color: #000000">
					<td width="25%" ><div align="center">金额</div></td>
					<td width="75%" colspan="3" >				 
					<div >
						 ${q1.rows[0].c_cost }
					</div>
					</td>
				</tr> 	
				</c:when>
			</c:choose>			
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_file where c_no=${q1.rows[0].c_fileid } "></sql:query>
			<c:if test="${not empty q3.rows[0] }">
				<tr>
					<td width="25%" ><div align="center">附件</div></td>
					<td width="75%" colspan="3" >				 
					<div >
						 <A href="../../../upload/signed/${q3.rows[0].c_save }">${q3.rows[0].c_name }</A>
					</div>
					</td>
				</tr> 	
			</c:if>					
			<tr>
				<td align="center" width="25%"> <b>姓名</b></td> 	 
				<td align="center" colspan="2" width="50%"><b>内容 </b></td>
				<td align="center" width="25%"><b>操作时间</td> 
			</tr>
			<sql:query var="q4" dataSource="${db_mssql }" sql="select distinct a.c_note,a.c_return,a.c_datime,b.c_name from t_sprocess a,t_staff b 
				where a.c_sys=3 and a.c_sid=${param.c_no } and a.c_send=b.c_jobnumber order by a.c_datime  "></sql:query>
			<c:forEach items="${q4.rows }" var="row">
			<tr>
				<td align="center"> ${row.c_name }</td> 	 
				<td align="left" colspan="2" >		
					<font color="red"> 
					<c:choose>
					<c:when test="${row.c_return eq 1 }">同意<br> </c:when>				
					<c:when test="${row.c_return eq 2 }">不同意<br> </c:when>	
					</c:choose>	
					</font>
					<textarea rows="4" cols="100" readonly="readonly">${fn:trim(row.c_note) } </textarea>												 			 		
				 </td>
				<td align="center" >${row.c_datime }</td> 
			</tr>			
			</c:forEach>					
			<nested:nest property="sprocess">	
			<nested:hidden property="c_jobnm" value="return"></nested:hidden>
			<nested:hidden property="c_sys" value="3"></nested:hidden>
			<nested:hidden property="c_sid" value="${param.c_no }"></nested:hidden>
			<nested:hidden property="c_orgid" value="${sessionScope.Staff.c_orgid }" ></nested:hidden>
			<tr >
				<td rowspan="2" align="center">${fn:trim(sessionScope.Staff.c_name)}意见：</td>
				<td colspan="3" align="left"> <nested:textarea property="c_note" rows="4" cols="100" value=""></nested:textarea> </td>			
			</tr>
			<tr > 
				<td colspan="3" align="left"> 
					<c:set target="${signedForm.sprocess }" property="c_return" value="1"></c:set>
					<nested:radio property="c_return"  value="1" onclick="js_receive(this.value)">同意</nested:radio> 
					<nested:radio property="c_return" value="2" onclick="js_receive(this.value)">不同意</nested:radio>					
					<nested:hidden property="c_send" value="${sessionScope.c_jobnumber }" ></nested:hidden>			
				</td>		
			</tr>
			<sql:query var="q4x" dataSource="${db_mssql }" sql="select * from t_orgsigned where c_sys=3 and c_sid=${param.c_no } and c_orgid=${sessionScope.Staff.c_orgid } order by c_no desc"></sql:query>
			<sql:query var="q51" dataSource="${db_mssql }" 
				sql="select c_jobnumber from t_role where c_sys=3 and c_role=301 and c_jobnumber ='${sessionScope.c_jobnumber }'"></sql:query>
			<c:if test="${empty q51.rows[0] }">		
			<tr >
				<td align="center">去向</td>
				<td align="left">
				<c:choose>
				<c:when test="${q1.rows[0].c_type eq 31 }">
				<nested:select property="c_to" styleId="c_to" value="${q4x.rows[0].c_to }"  onchange="addto()">
					<html:option value="1">本机构结束</html:option>
					<html:option value="2">本机构结束后发送给审批人</html:option>
					<c:if test="${a0.rows[0].c_order>3}">
					<html:option value="3">其他上级机构</html:option>
					</c:if>				 	
				 	</nested:select>
				</c:when>
				<c:when test="${q1.rows[0].c_type eq 32 }">
				<nested:select property="c_to" styleId="c_to" value="${q4x.rows[0].c_to }"  onchange="addto()">
					<html:option value="2">本机构结束后发送给审批人</html:option>
					<c:if test="${a0.rows[0].c_order>3}">
					<html:option value="3">其他上级机构</html:option>
					</c:if>		
				 	</nested:select>
				</c:when>
				</c:choose>				
				</td>		
				<td align="left" colspan="2" id="addto">	
				<c:if test="${not empty q4x.rows[0] }">
				<sql:query var="q4y" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q4x.rows[0].c_orgid2 }"></sql:query>
				<c:choose>
				<c:when test="${q4x.rows[0].c_to eq 3 }">
					 <select name=c_orgtypeid id=c_orgtypeid onchange=set()>
					 <c:forEach items="${a1.rows }" var="row">
					 <c:choose>
					 <c:when test="${q4y.rows[0].c_orgtypeid eq row.c_no }">
					 <option value=${row.c_no } selected="selected">${row.c_name }</option>
					 </c:when>								 
			 		 </c:choose>
			 		 </c:forEach>
					</select>					 					
					<sql:query var="q4z1" dataSource="${db_mssql }" sql="select a.c_no, a.c_name c_namea ,b.c_name c_nameb,c.c_name c_namec from  t_organization a ,t_organization b ,t_organization c 
					where a.c_parent=b.c_no and b.c_parent=c.c_no and a.c_flag='0' and a.c_orgtypeid=${q4y.rows[0].c_orgtypeid } order by a.c_path"></sql:query>
					<select name=sprocess.c_orgid2 id=c_orgid2 onchange=set2()>
					 <c:forEach items="${q4z1.rows }" var="row">
					 <c:choose>
					 <c:when test="${q4x.rows[0].c_orgid2 eq row.c_no }">
					 <option value=${row.c_no } selected="selected">${row.c_namea }->${row.c_nameb }->${row.c_namec }</option>
					 </c:when> 					  	 
			 		 </c:choose>
					 </c:forEach>
					</select>					
					<sql:query var="q4z2" dataSource="${db_mssql }" sql="select * from t_dept where c_orgid=${q4x.rows[0].c_orgid2 }"></sql:query>
					<select name=sprocess.c_deptid2 id=c_deptid2 onchange=set3()>
					<c:forEach items="${q4z2.rows }" var="row">
					 <c:choose>
					 <c:when test="${q4x.rows[0].c_deptid2 eq row.c_no }">
					 <option value=${row.c_no } selected="selected">${row.c_name }</option>
					 </c:when>
					 <c:when test="${q4x.rows[0].c_deptid2 ne row.c_no }">
					 <option value=${row.c_no }>${row.c_name }</option>
					 </c:when>				 
			 		 </c:choose>
			 		 </c:forEach>
					</select>					
					<sql:query var="q4z3" dataSource="${db_mssql }" sql="select * from t_staff 
					where c_jobnumber in ( select c_jobnumber from t_postset where c_postid in (select c_no from t_post where c_deptid=${q4x.rows[0].c_deptid2 }) )"></sql:query>
					<select name=sprocess.c_jobnumber2 id=c_jobnumber2>
					<c:forEach items="${q4z3.rows }" var="row">
					 <c:choose>
					 <c:when test="${q4x.rows[0].c_jobnumber2 eq row.c_jobnumber }">
					 <option value=${row.c_jobnumber } selected="selected">${row.c_name }</option>
					 </c:when>
					 <c:when test="${q4x.rows[0].c_jobnumber2 ne row.c_jobnumber }">
					 <option value=${row.c_jobnumber }>${row.c_name }</option>
					 </c:when>				 
			 		 </c:choose>
			 		 </c:forEach>
					</select>
				</c:when> 
				</c:choose>		
				</c:if>		
				</td>
			</tr>	
			</c:if>								
			<sql:query var="q12" dataSource="${db_mssql }" sql="select * from t_organization where c_jobnumber='${sessionScope.c_jobnumber }' "></sql:query> 
			<c:choose>
			<c:when test="${not empty q51.rows[0] }">
				 <!-- 审批人 --> 
				 <nested:hidden property="c_receive" value=""></nested:hidden>
			</c:when>
			<c:when test="${not empty q12.rows[0] }">				 
				 <!-- 机构负责人 -->
				 <nested:hidden property="c_receive" value=""></nested:hidden> 
			</c:when>			
			<c:otherwise>				
				<tr id="tr_receive">
				<td align="right" style="color: red"> 上级签字人姓名 </td>
				<td colspan="3" align="left"> 
					<nested:text property="c_receive" value=""></nested:text>
				</td>
				</tr>
			</c:otherwise>			
			</c:choose>	 						  
			</nested:nest>
			<tr>
				<td width="50%" colspan="2" align="right"><html:submit value="确 定"/></td>
				<td width="50%" colspan="2">
					<html:reset  value="取 消" />
				</td> 
			</tr>			
			</table></html:form>
	</body> 
</html:html>
