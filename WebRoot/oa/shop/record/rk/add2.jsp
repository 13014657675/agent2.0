<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../../tool/styles/main.css">		
	<script type='text/javascript' src='../../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../../dwr/interface/Library.js'></script> 		
</head>		
	<body>			
		<html:form  action="/shop" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="goodsbatch"/>
		<nested:nest property="goodsrecord">	
		<nested:hidden property="c_jobnm" value="rk"></nested:hidden> 	
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>	
		<nested:hidden property="c_libraryid" value="${param.c_libraryid }"></nested:hidden>	
		  <table width="100%" border="1" cellspacing="0" id="tb1">
			<tr>
				<td height="33" colspan="10" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						入库添加
					</div>
				</td>
			</tr> 
			<tr>
				<td width="25%" align="center">入库单号</td> 
				<td width="75%" align="left" colspan="3">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select max(c_recordid) c_recordid  from t_goodsrecord 
						where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid }"></sql:query>
					<c:choose>
						<c:when test="${empty q1.rows[0].c_recordid }"> 
						 ${param.c_orgid }${param.c_libraryid }0000001
						 <nested:hidden property="c_recordid" value="${param.c_orgid }${param.c_libraryid }0000001"></nested:hidden>							 	
						</c:when>
						<c:when test="${not empty q1.rows[0].c_recordid }"> 
						 ${q1.rows[0].c_recordid+1 }
						 <nested:hidden property="c_recordid" value="${q1.rows[0].c_recordid+1 }"></nested:hidden>		
						</c:when>
					</c:choose>											
				</td>
			</tr> 		
			<tr>
				<td width="25%" align="center"><b>分类</b></td>
				<td width="25%" align="center"><b>物品</b></td> 
				<td width="25%" align="center"><b>数量</b></td>
				<td width="25%" align="center">					 				
				</td>
			</tr> 				 
			<tr>
				<td width="25%" align="center">
				<sql:query var="q2" dataSource="${db_mssql }" sql="select a.* from t_goodstype a 
					where a.c_libraryid=${param.c_libraryid }"></sql:query>
				<select name="c_goodstypeid" id="c_goodstypeid1" onchange="set(1)">
				<c:forEach items="${q2.rows }" var="row">
				<option value="${row.c_no }">${row.c_name }</option>
				</c:forEach>
				</select>
				</td>
				<td width="25%" align="center">
				<nested:select property="c_goodsid" styleId="c_goodsid1">				
				</nested:select>	
				</td> 
				<td width="25%" align="center"> 
				<nested:text property="c_number" size="8" onchange="reg_num(this)" value="0"></nested:text>
				</td>
				<td width="25%" align="center"></td>
			</tr> 
			<tr>
				<td width="25%" align="center">入库人：</td>
				<td width="25%" align="center"><nested:text property="c_p" styleId="req" title="入库人必须填写" value=""></nested:text>  </td>
				<td width="25%" align="center"> </td> 
				<td width="25%" align="center"><input type="button" value=" 添加一行 " onclick="addfj()"></td>
			</tr>  
			</nested:nest>
			<tr>
				<td width="100%" align="center" colspan="4" > 
				<input type="submit" value="   确 定   "></td> 
				
			</tr>		
		</table>	 
		</html:form>
	</body> 
</html:html>
<script type="text/javascript">
			s=-1;num=1
			function set(x)
			{ 
				s=x;  
				var c_goodstypeid=document.getElementById("c_goodstypeid"+x).value 		
				var c_orgid=document.getElementsByName("goodsrecord.c_orgid")[0].value
				Library.get_goods_in(c_orgid,c_goodstypeid, get);
				return false;
			}
			function get(datas)
			{	 
				DWRUtil.removeAllOptions('c_goodsid'+s);					
				DWRUtil.addOptions('c_goodsid'+s, datas, 'value', 'label'); 
			} 	
			set(1)	 
			function addfj()
			{ 				
				var c_goodstypeid=document.getElementById("c_goodstypeid1").innerHTML
				num=num+1		 
				var row=tb1.insertRow(tb1.rows.length-2);
				var cell1 = row.insertCell();
				cell1.align="center";
				cell1.innerHTML="<td width=\"20%\" align=\"center\"><select name=\"c_goodstypeid\" id=\"c_goodstypeid"+num+"\" onchange=\"set("+num+")\">"+c_goodstypeid+"</select></td>";	
				var cell2 = row.insertCell(); 
				cell2.align="center";
				cell2.innerHTML="<td width=\"20%\" align=\"center\"><select name=\"goodsrecord.c_goodsid\" id=\"c_goodsid"+num+"\"></select></td>";	
				var cell4 = row.insertCell(); 
				cell4.align="center";				
				cell4.innerHTML="<td width=\"20%\" align=\"center\"><input type=\"text\" name=\"goodsrecord.c_number\" size=\"8\" value=\"0\" onchange=\"reg_num(this)\"></td>";	
				var cell5 = row.insertCell(); 
				cell5.align="center";				
				cell5.innerHTML="<td  ><input type=button onclick=deleteitem(this,'tb1') value='删除本行' id=del ></td>";	
				set(num)	  			 
			}		 
			function deleteitem(obj,id)
		    {
		     	var rowNum,curRow;
		     	curRow = obj.parentNode.parentNode;
			 	rowNum = eval("document.all."+id).rows.length - 1;
		     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
		    }  			 
</script>
