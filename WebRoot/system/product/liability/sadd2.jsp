<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>保险责任结构设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
<body >
	<html:form action="/product" method="post" onsubmit="return check_form(this)">
	 <html:hidden property="jobname" value="pliabilitys"/>	   	
		<nested:nest property="product">		  
		<nested:hidden property="c_jobnm" value="add"></nested:hidden>                
		<table width="100%" border="1" cellspacing="0"  >
			<tr>
				<td height="33" colspan="4" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
					保险责任结构设置
				</td>
			</tr>	 
		 	<tr>
				<td align="right" width="50%">
					保险公司
				</td>
				<td align="left" > 
					<sql:query var="q1"	sql="select * from t_company where c_no=${param.c_companyid } "	dataSource="${db_mssql}"></sql:query>
					 ${q1.rows[0].c_name }
					 <nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>    	
				</td>
			</tr>
			<tr>
				<td align="right" >
					险种名称
				</td>
				<td align="left" >			 
					<sql:query var="q2"	sql="select * from t_product where c_companyid=${param.c_companyid } and c_no=${param.c_productid } "	dataSource="${db_mssql}"></sql:query>
					${q2.rows[0].c_fullname } 
					 <nested:hidden property="c_productid" value="${param.c_productid }"></nested:hidden>    
				</td>
			</tr> 	 
			<sql:query var="a1" dataSource="${db_mssql }" sql="select * from t_pliability where c_companyid=${param.c_companyid } and c_productid=${param.c_productid } "></sql:query>
			<c:forEach items="${a1.rows }" var="rowa">
			 <tr>
				<td  align="right">
					 保险责任名称
				</td>
				<td  align="left">    
					 ${rowa.c_pname }
				</td> 
			</tr> 
			 <tr>
				<td  align="right">
					 保险责任描述
				</td>
				<td  align="left">
					 <textarea cols="100" rows="5">${rowa.c_pdesc }</textarea>					 
				</td> 
			</tr> 
			</c:forEach>
			<sql:query var="a2" dataSource="${db_mssql }" sql="select * from t_pliabilityc 
				where c_companyid=${param.c_companyid } and c_productid=${param.c_productid } "></sql:query>		
			 <tr>
				<td  align="right">
					
				</td>
				<td  align="left">
							 
				</td> 
			</tr> 
			<tr>
			<td colspan="2">
			<table width="100%" id="tb">
			<tr>
			<td width="33%">责任选项</td>
			<td width="33%">金额</td> 
			<td width="33%"></td>
			</tr> 
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_pliabilitys where c_companyid=${param.c_companyid } and c_productid=${param.c_productid } "></sql:query>
			<c:forEach items="${q3.rows }" var="row" varStatus="x">
			<tr>
			<td width="33%">
			<font color="red">项目名称：</font><nested:text property="c_pname" value="${row.c_pname }" styleId="req" title="项目名称必须填写"></nested:text><br>				 
			<nested:select property="c_condition" value="${row.c_condition }" styleId="c_condition${x.index+1 }" onchange="jsall_load(c_cv2t${x.index+1 },c_cv2${x.index+1 },c_cv31t${x.index+1 },c_cv31${x.index+1 },c_cv32t${x.index+1 },c_cv32${x.index+1 })">
			<html:option value="1">全部</html:option>
			<html:option value="2">单个值</html:option>
			<html:option value="3">区间值</html:option>
			</nested:select>  
			<br> 
			单个值依据：<nested:select property="c_cv2t" value="${row.c_cv2t }" styleId="c_cv2t${x.index+1 }" onchange="js_load(this,c_cv2${x.index+1 })"> 
			<html:option value="-1">无</html:option>
			<html:option value="1">第*年度</html:option>
			<html:option value="2">被保人*岁</html:option>
			<c:forEach items="${a2.rows }" var="row2">
			<html:option value="${row2.c_no }">${row2.c_name }</html:option>
			</c:forEach>
			</nested:select>					
			<br> 
			单个值数值：<nested:text property="c_cv2" size="2" value="${row.c_cv2 }" styleId="c_cv2${x.index+1 }"></nested:text>
			<hr>			 
			区间开始值依据：<nested:select property="c_cv31t" value="${row.c_cv31t }" styleId="c_cv31t${x.index+1 }" onchange="js_load(this,c_cv31${x.index+1 })"> 
			<html:option value="-1">无</html:option>
			<html:option value="1">第*年度</html:option>
			<html:option value="2">被保人*岁</html:option>
			<c:forEach items="${a2.rows }" var="row2">
			<html:option value="${row2.c_no }">${row2.c_name }</html:option>
			</c:forEach>
			</nested:select>				
			<br>
			区间开始值数值：<nested:text property="c_cv31" size="2" value="${row.c_cv31 }"  styleId="c_cv31${x.index+1 }"> </nested:text>	
			<hr>  
			区间结束值依据：<nested:select property="c_cv32t" value="${row.c_cv32t }" styleId="c_cv32t${x.index+1 }" onchange="js_load(this,c_cv32${x.index+1 })">  
			<html:option value="-1">无</html:option>
			<html:option value="1">第*年度</html:option>
			<html:option value="2">被保人*岁</html:option>
			<c:forEach items="${a2.rows }" var="row2">
			<html:option value="${row2.c_no }">${row2.c_name }</html:option>
			</c:forEach>
			</nested:select>				
			<br>
			区间结束值数值：<nested:text property="c_cv32" size="2" value="${row.c_cv32 }" styleId="c_cv32${x.index+1 }"></nested:text>
			</td>
			<td width="33%">
			<nested:select property="c_result" value="${row.c_result }" onchange="js_load(this,c_rv${x.index+1 })">
			<html:option value="0">固定金额</html:option>
			<html:option value="1">基本保额的百分比</html:option>
			<html:option value="2">累计保费的百分比</html:option>
			</nested:select>
			<br>
			数值：<nested:text property="c_rv"   value="${row.c_rv }" styleId="c_rv${x.index+1 }"></nested:text>			 
			</td>			
			<td width="33%" > 
			<input type="button" onclick="deleteitem(this,'tb')" value=' 删除本行 ' id="del${x.index+1 }" >		
			</td>
			</tr> 	 
			</c:forEach>				
			</table>
			</td>
			</tr>  		 
		  <tr> 
			<td align="right">
				<input type="button" value=" 添加一行 " onclick="add()">
				<html:submit value=" 确 定 "></html:submit> 
			</td>
			<td >
				<html:reset value=" 取 消 "></html:reset>
			</td>
		</tr> 
	</table>
	</nested:nest>
	</html:form> 
	</body>
</html:html>


<script type="text/javascript">
	var str="";
	<c:forEach items="${a2.rows }" var="row">
	str+="<option value=${row.c_no }>${row.c_name }</option>";
	</c:forEach>
	var count=100;
 	function add()
	{			
		count+=1
		var row=tb.insertRow(tb.rows.length); 	
		var cell1 = row.insertCell();  
		var a="<font color=\"red\">项目名称：</font> <input type=\"text\" name=\"product.c_pname\" value=\"\" id=\"req\" title=\"项目名称必须填写\" ><br><select name=\"product.c_condition\" id=\"c_condition"+count+"\" onchange=\"jsall_load(c_cv2t"+count+",c_cv2"+count+",c_cv31t"+count+",c_cv31"+count+",c_cv32t"+count+",c_cv32"+count+")\" ><option value=\"1\">全部</option><option value=\"2\">单个值</option><option value=\"3\" >区间值</option></select>";
	 	a+="<br>单个值依据：<select name=\"product.c_cv2t\" id=\"c_cv2t"+count+"\" onchange=\"js_load(this,c_cv2"+count+")\"><option value=\"-1\" selected=\"selected\">无</option><option value=\"1\">第*年度</option><option value=\"2\">被保人*岁</option>"+str+"</select>"					
		a+="<br>单个值数值：<input type=\"text\" name=\"product.c_cv2\" size=\"2\" value=\"-1\" id=\"c_cv2"+count+"\" >";
		a+="<hr>区间开始值依据：<select name=\"product.c_cv31t\" id=\"c_cv31t"+count+"\" onchange=\"js_load(this,c_cv31"+count+")\" ><option value=\"-1\" selected=\"selected\" >无</option><option value=\"1\" >第*年度</option><option value=\"2\">被保人*岁</option>"+str+"</select>";
		a+="<br>区间开始值数值：<input type=\"text\" name=\"product.c_cv31\" size=\"2\" value=\"-1\" id=\"c_cv31"+count+"\">";
		a+="<hr>区间结束值依据：<select name=\"product.c_cv32t\" id=\"c_cv32t"+count+"\" onchange=\"js_load(this,c_cv32"+count+")\"><option value=\"-1\" selected=\"selected\">无</option><option value=\"1\">第*年度</option><option value=\"2\" >被保人*岁</option>"+str+"</select>"
		a+="<br>区间结束值数值：<input type=\"text\" name=\"product.c_cv32\" size=\"2\" value=\"-1\" id=\"c_cv32"+count+"\">";
		cell1.innerHTML="<td >"+a+"</td>";	
		var cell2 = row.insertCell();
		var b="<select name=\"product.c_result\" onchange=\"js_load(this,c_rv"+count+")\" ><option value=\"0\">固定金额</option><option value=\"1\">基本保额的百分比</option><option value=\"2\">累计保费的百分比</option></select>"; 
		b+="<br>固定金额：<input type=\"text\" name=\"product.c_rv\"  value=\"-1\" id=\"c_rv"+count+"\" >"; 
		cell2.innerHTML="<td >"+b+"</td>";			 	
		var cell3 = row.insertCell();  
		cell3.innerHTML="<td  ><input type=button onclick=deleteitem(this,'tb') value=' 删除本行 ' id=del ></td>";	
	}	
	function deleteitem(obj,id)
    {
     	var rowNum,curRow;
     	curRow = obj.parentNode.parentNode;
	 	rowNum = eval("document.all."+id).rows.length - 1;
     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
    }  
    function jsall_load(a1,a2,a3,a4,a5,a6)
    {
    	a1.value='-1'
    	a3.value='-1'
    	a5.value='-1'
    	a2.value='-1'
    	a4.value='-1'
    	a6.value='-1'
    	a2.readOnly =true
    	a4.readOnly =true
    	a6.readOnly =true
    } 
    function js_load(x,a)
    {
    	a.value='-1' 
    	if (x.value=='-1' || x.value > 100 )
    	{
    		a.readOnly =true
    	}else
    	{
    		a.readOnly =false
    	}
    }
</script>
