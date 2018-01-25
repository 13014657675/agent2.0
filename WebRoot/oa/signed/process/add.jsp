<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<sql:query var="q0" dataSource="${db_mssql }" 
	sql="select * from t_orgtype  where c_no in (select c_orgtypeid from t_organization where c_no=${sessionScope.Staff.c_orgid })"></sql:query>
<c:if test="${not empty q0.rows[0] }">
<!-- 直接上级机构类型 -->
<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_order = 3 order by c_order "></sql:query>
<sql:query var="q1a" dataSource="${db_mssql }" sql="select left( c_path,3*2 )+'%' c_path from t_organization where c_no = ${sessionScope.Staff.c_orgid } "></sql:query>
<sql:query var="q1b" dataSource="${db_mssql }" sql="select * from t_organization 
	where c_orgtypeid=${q1.rows[0].c_no } and c_path like '${q1a.rows[0].c_path }'"></sql:query>
</c:if>	
<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${sessionScope.Staff.c_orgid }"></sql:query>
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 
	<script type='text/javascript' src='../../../dwr/interface/Staff.js'></script> 
	<script type="text/javascript">
	var c_sheng=${q1b.rows[0].c_no}
	var c_orgtype_order=${q0.rows[0].c_order}
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
	function addfj()
	{ 
		var row=tb1.insertRow(tb1.rows.length-1);
		var cell1 = row.insertCell();
		cell1.align="center";
		cell1.innerHTML="<td >附件 </td>";	
		var cell2 = row.insertCell(); 
		cell2.innerHTML="<td  ><input type=file name=file.file ></td>";	
		var cell3 = row.insertCell(); 
		cell3.innerHTML="<td  ><input type=button onclick=deleteitem(this,'tb1') value='删除本附件' id=del ></td>";	
		document.getElementById("add").disabled="disabled"
	}	
	function deleteitem(obj,id)
    {
     	var rowNum,curRow;
     	curRow = obj.parentNode.parentNode;
	 	rowNum = eval("document.all."+id).rows.length - 1;
     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex);
     	document.getElementById("add").disabled=""
    }  
    function addcost()
	{ 
		 var c_type=document.getElementsByName("signed.c_type")[0];
		 var cost=document.getElementById("cost");
		 var c_cost=document.getElementsByName("signed.c_cost")[0];
		 var c_to=document.getElementById("c_to");
		 DWRUtil.removeAllOptions('c_to');	
		 if (c_type.value==31)
		 {
		 	 c_cost.value="0"
		 	 c_cost.readOnly=true;
		 	 cost.style.color='#828282' //灰色
			 //cost.disabled=true;			
			 var opp1 = new Option("本机构结束",1); 
		 	 var opp2 = new Option("本机构结束后发送给审批人",2); 			
			 c_to.add(opp1);
			 c_to.add(opp2);
			 if (c_orgtype_order>3)
			 {
			 	var opp3 = new Option("其他上级机构",3); 
			   	c_to.add(opp3);
			 }			  
		 }
		 if (c_type.value==32)
		 {
		 	 c_cost.readOnly=false;
		 	 cost.style.color='#000000' //黑色
		 	 //cost.disabled=false;  
		 	 var opp2 = new Option("本机构结束后发送给审批人",2); 			
			 c_to.add(opp2);
			 if (c_orgtype_order>3)
			 {
			  	var opp3 = new Option("其他上级机构",3);  
			 	c_to.add(opp3);	
			 }			 		
		 } 	 
		 addto()
	}	
	function addto()
	{ 
		 var c_to=document.getElementsByName("sprocess.c_to")[0];
		 var addto=document.getElementById("addto");
		 if (c_orgtype_order==4 || c_orgtype_order==5) //县级内勤，或市级内勤 向上级打签报，指定省公司内勤接收。
		 {
		 	 var str="<select name=c_orgtypeid id=c_orgtypeid onchange=set()>";
			 <c:forEach items="${q1.rows }" var="row">
			 str+="<option value=${row.c_no }>${row.c_name }</option>";
			 </c:forEach>
			 str+="</select>";
			 str+="<select name=sprocess.c_orgid2 id=c_orgid2 onchange=set2()></select>";
			 str+="<select name=sprocess.c_deptid2 id=c_deptid2 onchange=set3()></select>";
			 str+="<select name=sprocess.c_jobnumber2 id=c_jobnumber2></select>";
		 }		 
		 if (c_to.value==3)
		 {
		  addto.innerHTML=str;
		  set();
		 } 	  	 
		 else
		 {
		  addto.innerHTML="";
		 }
	}	
	</script>
</head>		
	<body onload="addcost();"> 
		<html:form  action="/signed" onsubmit="return check_form(this)" enctype="multipart/form-data" >
		<html:hidden property="jobname" value="signed_add"/>
		<table width="100%" border="1" cellspacing="0" id="tb1">
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						签报添加
					</div>
				</td>
			</tr> 					
			<nested:nest property="signed">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden> 	
			<tr>
				<td width="25%"><div align="center">类型</div></td>
				<td width="75%" colspan="3" >
				<div align="left">
					<nested:select property="c_type" onchange="addcost()">
					<html:option value="31">项目签报</html:option>
					<html:option value="32">费用签报</html:option>
					</nested:select>
				</div>
				</td>					 
			</tr> 	  
			<tr>
				<td width="25%"><div align="center">内容</div></td>
				<td width="75%" colspan="3" >
				<div align="left">
					<nested:textarea property="c_note" value=""  cols="150" rows="10" styleId="req" title="内容必须填写"></nested:textarea>
				</div>
				</td>					 
			</tr> 
			<tr id="cost">
				<td width="25%"><div align="center">金额</div></td>
				<td width="75%"  colspan="3" > 
					<nested:text property="c_cost" value="0" styleId="req" title="金额必须填写"  onchange="reg_num(this)" ></nested:text>						
					</nested:nest>				 
		
			<tr>
				<td width="25%"><div align="center">去向</div></td>
				<td width="25%" align="left"> 
					<nested:nest property="sprocess">
				 	<nested:select property="c_to" styleId="c_to"  onchange="addto()">
				 	</nested:select>				
				</td>
				<td colspan="2" id="addto" >					 
				 
				</td>					 
			</tr> 	  
			<tr>
				<td width="25%" align="center" style="color: red">上级签字人姓名</td>		
				<td width="25%" align="left"> 						
					<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
					<nested:hidden property="c_sys" value="3"></nested:hidden>   
					<nested:hidden property="c_orgid" value="${sessionScope.Staff.c_orgid }" ></nested:hidden>
					<nested:hidden property="c_send" value="${sessionScope.c_jobnumber }" ></nested:hidden>
					<nested:text property="c_receive" value="" styleId="req" title="上级签批人姓名必须填写"></nested:text>  		 	
					</nested:nest>			 
					<nested:nest property="file">	
					<nested:hidden property="c_jobnm" value="add"></nested:hidden>  
					<nested:hidden property="c_flag" value="0"></nested:hidden>   
				</td>	
				<td colspan="2">
					<input type="button" value=" 添加附件 " onclick="addfj()" id="add" > </td> 
			</tr> 		
			<tr>				
				</nested:nest>	
				<td width="50%" colspan="2" align="right"><html:submit value="确 定"/></td>
				<td width="50%"  ><html:reset value="取 消"/> </td> 
			</tr>		
		</table>	
	</html:form> 
	
	<ul>
	<li>如果申请牵涉到金钱的签报，请选择费用签报，输入金额数额。否则选择项目签报。</li>
	<li>“去向”为本签报流转的目标去向</li>
	<li>“上级签字人姓名”为下一个签报回复的人员姓名。</li>
	</ul>
	
	</body> 
</html:html>



