<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type="text/javascript">
	function js_all()
	{
	   		var select_all = document.getElementsByName("select_all")[0]; 
		 	var count =document.getElementsByName("file.c_postid").length; 		
		    for (var i=0;i<count;i++)
		    {
		    	    document.getElementsByName("file.c_postid")[i].checked=select_all.checked  
		    } 
	}
	function js_receive(s)
	{  
		var tr_receive=document.getElementById("tr_receive"); 
		if (s==1 )
		{
			tr_receive.style.display=""		
		}
		if (s==2 )
		{
			tr_receive.style.display="none"		
		}
	}
	</script>
</head>		
	<body> 
		<html:form  action="/file" onsubmit="return check_form(this)" enctype="multipart/form-data" >
		<html:hidden property="jobname" value="filesigned_return"/>
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_filesigned  where c_no =${param.c_no } "></sql:query>	
		<table width="100%" border="1" cellspacing="0"  >
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						文件签批
					</div>
				</td>
			</tr> 			
			<tr>
				<td width="25%"><div align="center">签批号：</div></td>
				<td width="75%" colspan="3" > 
					${param.c_no }
				</td>	 
			</tr>		 
			<tr>
				<td width="25%"><div align="center">发文部门</div></td>
				<td width="25%" >
				<div align="center">
					 ${q1.rows[0].c_dname }
				</div>
				</td>	
				<td width="25%"><div align="center">发文字号</div></td>
				<td width="25%" >
				<div align="center">
					 ${q1.rows[0].c_dcode }
				</div>
				</td>
			</tr> 
			<tr>
				<td width="25%"><div align="center">拟稿人</div></td>
				<td width="25%" >
				<div align="center"> ${q1.rows[0].c_write }
				</div>
				</td>	
				<td width="25%"><div align="center">校对人</div></td>
				<td width="25%" >
				<div align="center"> ${q1.rows[0].c_check }
				</div>
				</td>
			</tr> 			
			<nested:nest property="file">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden>  	
			<nested:hidden property="c_fileid" value="${param.c_fileid }"></nested:hidden>  			
			<sql:query var="q2" dataSource="${db_mssql }" sql="select a.c_no,a.c_name,b.c_name dept ,c.c_name org ,c.c_no orgid from t_post a ,t_dept b ,t_organization c 
			where a.c_deptid=b.c_no and a.c_orgid=c.c_no order by c.c_name,b.c_name"></sql:query>
			<tr>
				<td width="25%"><div align="center">阅读权限设置 </div></td>
				<td width="25%" >
				<div align="center">
					 <input type="checkbox" name="select_all" onclick="js_all()" >全选					 
				</div>
				</td>	
				<td width="25%"> </td>
				<td width="25%" >
				<div align="center">					 
				</div>
				</td>
			</tr> 
			<tr>
			<c:forEach items="${q2.rows }" var="row" varStatus="x" >			
				<td width="50%" colspan="2"><div align="center"> 
					<sql:query var="q3" dataSource="${db_mssql }" 
						 	sql="select * from t_fileJT where  c_fileid =${param.c_fileid } and c_postid=${row.c_no } "></sql:query>	
					<c:if test="${not empty q3.rows[0].c_no }">
						<input type="checkbox" name="file.c_postid" checked="checked" value="${row.c_no }" >  
					</c:if>
					<c:if test="${empty q3.rows[0].c_no }">					 
						<input type="checkbox" name="file.c_postid"  value="${row.c_no }" >  
					</c:if>						
					<sql:query var="temp1" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.orgid }"></sql:query> 
					<sql:query var="temp2" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${temp1.rows[0].c_orgtypeid } "></sql:query>
					[
					<c:choose>
					<c:when test="${temp2.rows[0].c_order eq 3 }">
					${row.org }
					</c:when>
					<c:when test="${temp2.rows[0].c_order eq 4 }">
					<sql:query var="temp31" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${temp1.rows[0].c_parent }"></sql:query>
					<sql:query var="temp32" dataSource="${db_mssql }" sql="select * from t_dept where c_no=${temp1.rows[0].c_deptid }"></sql:query>
					${temp31.rows[0].c_name } 
					${temp32.rows[0].c_name } 
					
					${row.org }					
					</c:when>
					<c:when test="${temp2.rows[0].c_order eq 5 }">					
					<sql:query var="temp41" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${temp1.rows[0].c_parent }"></sql:query> 
					
					<sql:query var="temp42" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${temp41.rows[0].c_parent }"></sql:query>
					<sql:query var="temp43" dataSource="${db_mssql }" sql="select * from t_dept where c_no=${temp41.rows[0].c_deptid }"></sql:query>
					${temp42.rows[0].c_name }  
					${temp43.rows[0].c_name } 
					
					${temp41.rows[0].c_name } 
					${row.org }						
					</c:when>
					</c:choose>
					]->${row.dept }->${row.c_name } 
				</div></td>
				<c:if test="${ (x.index+1) mod 2 ==0 }"> 
				  </tr><tr>
				</c:if>
			</c:forEach>
			</tr>						
			</nested:nest>	
			<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_file where c_no=${param.c_fileid } "></sql:query>
			<tr>
				<td width="25%"><div align="center">上挂目录</div></td>
				<td width="25%" >
				<div align="center">
					<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_catalog where c_no= ${q4.rows[0].c_catalogid } "></sql:query>
					 ${q5.rows[0].c_name }
				</div>
				</td>	
				<td width="25%"><div align="center">上挂文件</div></td>
				<td width="25%" >
				<div align="center">
					 <A href="../../../upload/file/${q4.rows[0].c_save }">${q4.rows[0].c_name }</A>
				</div>
				</td>
			</tr> 		
			<tr>
				<td width="25%"><div align="center">备注</div></td>
				<td width="25%" colspan="3" >
				<div align="center">
					<textarea cols="150" rows="4" >${q1.rows[0].c_note }</textarea>
				</div>
				</td>					 
			</tr> 	
			<tr>
				<td align="center"> <b>姓名</b></td> 	 
				<td align="center" colspan="2"><b>签批内容 </b></td>
				<td align="center" ><b>操作时间</td> 
			</tr>
			<sql:query var="q6" dataSource="${db_mssql }" sql="select a.*,b.c_name from t_sprocess a,t_staff b 
				where a.c_sys=1 and a.c_sid=${param.c_no } and a.c_send=b.c_jobnumber order by a.c_no  "></sql:query>
			<c:forEach items="${q6.rows }" var="row" > 
			<tr>
				<td align="center"> ${row.c_name } </td> 	 
				<td align="left" colspan="2" >		 
					<textarea rows="4" cols="100" readonly="readonly">${fn:trim(row.c_note) } </textarea>												 			 		
				 </td>
				<td align="center" >${row.c_datime }</td> 
			</tr>		 			
			</c:forEach>					
			<nested:nest property="sprocess">	
			<nested:hidden property="c_jobnm" value="return"></nested:hidden>
			<nested:hidden property="c_sys" value="1"></nested:hidden>
			<nested:hidden property="c_sid" value="${param.c_no }"></nested:hidden>
			<tr >
				<td rowspan="2" align="center">意见</td>
				<td colspan="3" align="left"> <nested:textarea property="c_note" rows="4" cols="100"></nested:textarea> </td>			
			</tr>
			<tr > 
				<td colspan="3" align="left"> 
					<c:set target="${fileForm.sprocess }" property="c_return" value="1"></c:set>
					<nested:radio property="c_return"  value="1" onclick="js_receive(this.value)">同意</nested:radio> 
					<nested:radio property="c_return" value="2" onclick="js_receive(this.value)">不同意</nested:radio> 							
					<nested:hidden property="c_send" value="${sessionScope.c_jobnumber }" ></nested:hidden>			
				</td>		
			</tr>
			<sql:query var="q7" dataSource="${db_mssql }" sql="select * from t_role where c_sys=1 and c_role=101 and c_jobnumber ='${sessionScope.c_jobnumber }' "></sql:query>
			<c:if test="${not empty q7.rows[0] }">
				 <nested:hidden property="c_receive" value=""></nested:hidden>
			</c:if>
			<c:if test="${ empty q7.rows[0] }">
				<tr id="tr_receive">
				<td align="right" style="color: red" >上级签字人姓名  </td>
				<td colspan="3" align="left" > 
					<nested:text property="c_receive" value=""></nested:text>
				</td>
				</tr>
			</c:if>			
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
