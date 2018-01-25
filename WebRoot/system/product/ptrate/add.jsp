<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>险种费率添加</title>
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
    <script type='text/javascript' src='../../../dwr/util.js'> </script> 
    <script type='text/javascript' src='../../../dwr/interface/Product.js'> </script>
</head>
<body  >
		<form action="../../../toModule.do?prefix=/system&page=/product/ptrate/add2.jsp" method="post" onsubmit="return js_submit() && check_form(this)">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						费率添加
				</td>
			</tr>
		</table> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
			  <td align="right" width="50%">保险公司</td>
				<td width="57%" align="left">
					 <select name="c_companyid" id="c_companyid" onchange="set();">
						<sql:query var="q1"	sql="select * from t_company where c_type =3001"	dataSource="${db_mssql}"></sql:query>
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
			}	
			function js_submit()
			{   			
				var c_type
				var obj=document.getElementsByName("c_type");
				for(i=0;i<obj.length;i++){
			            if(obj[i].checked){
			                c_type=obj[i].value;            
			            }
			        }
				if (c_type=='1'){ 
				  if ($("c_base1").value=='0'){
					   	alert("保额无效!")
					   	return false;
				    	}
				  $("c_base").value=$("c_base1").value 
				   }
				if (c_type=='2'){ 
				  if ($("c_base2").value=='0'){
						alert("保费无效!")
						return false;					
				  		}
				  $("c_base").value=$("c_base2").value
					} 					 
				return true;		
			}	
			set()
			</script> 	
			<tr>
				<td align="right">
					<input type="radio" name="c_type" id="c_type" value="1" checked="checked">
				</td>
				<td align="left" valign="middle"> 	
					按<input  name="c_base1" value="0" title="保额不能为空" size="6" onchange="reg_num(this)">元保额设定保费										 
				</td>
			</tr>		
			<tr>
				<td align="right">
					<input type="radio" name="c_type" id="c_type" value="2" >
				</td>
				<td align="left" valign="middle"> 	
					按<input  name="c_base2" value="0" title="保费不能为空" size="6" onchange="reg_num(this)">元保费设定保额										 
				</td>
			</tr>			
			<tr>
				<td align="center" colspan="2">
					<input type="hidden"  name="c_base" value="" >
					<input type="submit"  value="下一步">
				</td>				
			</tr>
		</table>
	</form>	
	</body>
</html:html>
