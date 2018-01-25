<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">   
	<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Sxbd.js'></script> 	 
	<script type='text/javascript' src='../../../dwr/interface/Customer.js'></script> 	
	<script type="text/javascript">
		function checktbr()
		{  
			var c_cardtype=document.getElementsByName("tbr.c_cardtype")[0].value 
			var c_cardnum=document.getElementsByName("tbr.c_cardnum")[0].value 
			Customer.get_customer(c_cardtype,c_cardnum, gettbr);
			return false;
		}
		function gettbr(datas)
		{					 
			var c_cardtype=document.getElementsByName("tbr.c_cardtype")[0].value 
			var c_cardnum=document.getElementsByName("tbr.c_cardnum")[0].value 
			c_cardtype=c_cardtype.replace(/[ ]/g,"")
			c_cardnum=c_cardnum.replace(/[ ]/g,"")
		 	if (datas.c_cardtype==c_cardtype &&  datas.c_cardnum==c_cardnum)
		 	{ 
		 		document.getElementsByName("tbr.c_no")[0].value=datas.c_no 	
		 		document.getElementsByName("tbr.c_jobnm")[0].value="update" 
		 		document.getElementsByName("tbr.c_name")[0].value=datas.c_name 
		 		document.getElementsByName("tbr.c_nation")[0].value=datas.c_nation 		 
		 		c_sex=document.getElementsByName("tbr.c_sex");	 
		 		for(var i=0;i<c_sex.length;i++) {
					if(c_sex[i].value==datas.c_sex) { 
					c_sex[i].checked=true;  
				   	break; 
				   }
				}
		 		document.getElementsByName("tbr.c_birthy")[0].value=datas.c_birthy 	
		 		document.getElementsByName("tbr.c_birthm")[0].value=datas.c_birthm 	
		 		document.getElementsByName("tbr.c_birthd")[0].value=datas.c_birthd 	
		 		c_marriage=document.getElementsByName("tbr.c_marriage");	 
		 		for(var i=0;i<c_marriage.length;i++) {
					if(c_marriage[i].value==datas.c_marriage) { 
					c_marriage[i].checked=true;  
				   	break; 
				   }
				}
				document.getElementsByName("tbr.c_cardperiod")[0].value=datas.c_cardperiod 				
				c_education=document.getElementsByName("tbr.c_education")[0];
				for(var i=0;i<c_education.options.length;i++) {
             		if(c_education.options[i].value == datas.c_education) {
                 	c_education.options[i].selected = true;     
                 	break;
             		}
         		} 
		 		document.getElementsByName("tbr.c_email")[0].value=datas.c_email
		 		document.getElementsByName("tbr.c_phone")[0].value=datas.c_phone
		 		document.getElementsByName("tbr.c_mobile")[0].value=datas.c_mobile
		 		document.getElementsByName("tbr.c_company")[0].value=datas.c_company
		 		document.getElementsByName("tbr.c_post")[0].value=datas.c_post
		 		document.getElementsByName("tbr.c_postcode")[0].value=datas.c_postcode
		 		document.getElementsByName("tbr.c_hddr")[0].value=datas.c_hddr
		 		document.getElementsByName("tbr.c_hzip")[0].value=datas.c_hzip
		 		document.getElementsByName("tbr.c_cddr")[0].value=datas.c_cddr
		 		document.getElementsByName("tbr.c_czip")[0].value=datas.c_czip
		 	}
		} 	
		function checkbbr()
		{  
			var c_cardtype=document.getElementsByName("bbr.c_cardtype")[0].value 
			var c_cardnum=document.getElementsByName("bbr.c_cardnum")[0].value 
			Customer.get_customer(c_cardtype,c_cardnum, getbbr);
			return false;
		}
		function getbbr(datas)
		{					 
			var c_cardtype=document.getElementsByName("bbr.c_cardtype")[0].value 
			var c_cardnum=document.getElementsByName("bbr.c_cardnum")[0].value 
			c_cardtype=c_cardtype.replace(/[ ]/g,"")
			c_cardnum=c_cardnum.replace(/[ ]/g,"")
		 	if (datas.c_cardtype==c_cardtype &&  datas.c_cardnum==c_cardnum)
		 	{ 
		 		document.getElementsByName("bbr.c_no")[0].value=datas.c_no 	
		 		document.getElementsByName("bbr.c_jobnm")[0].value="update" 
		 		document.getElementsByName("bbr.c_name")[0].value=datas.c_name 
		 		document.getElementsByName("bbr.c_nation")[0].value=datas.c_nation 		 
		 		c_sex=document.getElementsByName("bbr.c_sex");	 
		 		for(var i=0;i<c_sex.length;i++) {
					if(c_sex[i].value==datas.c_sex) { 
					c_sex[i].checked=true;  
				   	break; 
				   }
				}
		 		document.getElementsByName("bbr.c_birthy")[0].value=datas.c_birthy 	
		 		document.getElementsByName("bbr.c_birthm")[0].value=datas.c_birthm 	
		 		document.getElementsByName("bbr.c_birthd")[0].value=datas.c_birthd 	
		 		c_marriage=document.getElementsByName("bbr.c_marriage");	 
		 		for(var i=0;i<c_marriage.length;i++) {
					if(c_marriage[i].value==datas.c_marriage) { 
					c_marriage[i].checked=true;  
				   	break; 
				   }
				}
				document.getElementsByName("bbr.c_cardperiod")[0].value=datas.c_cardperiod 				
				c_education=document.getElementsByName("bbr.c_education")[0];
				for(var i=0;i<c_education.options.length;i++) {
             		if(c_education.options[i].value == datas.c_education) {
                 	c_education.options[i].selected = true;     
                 	break;
             		}
         		} 
		 		document.getElementsByName("bbr.c_email")[0].value=datas.c_email
		 		document.getElementsByName("bbr.c_phone")[0].value=datas.c_phone
		 		document.getElementsByName("bbr.c_mobile")[0].value=datas.c_mobile
		 		document.getElementsByName("bbr.c_company")[0].value=datas.c_company
		 		document.getElementsByName("bbr.c_post")[0].value=datas.c_post
		 		document.getElementsByName("bbr.c_postcode")[0].value=datas.c_postcode
		 		document.getElementsByName("bbr.c_hddr")[0].value=datas.c_hddr
		 		document.getElementsByName("bbr.c_hzip")[0].value=datas.c_hzip
		 		document.getElementsByName("bbr.c_cddr")[0].value=datas.c_cddr
		 		document.getElementsByName("bbr.c_czip")[0].value=datas.c_czip
		 	}
		} 	
		function setname()
		{  
			var c_jobnumber=document.getElementsByName("sxbd.c_jobnumber")[0].value 
			Sxbd.get_name(c_jobnumber, getname);
			return false;
		}
		function getname(datas)
		{					 
			var c_name=document.getElementById("c_name");
			c_name.innerText=datas;	 
			setoutlets();
		} 		
		function setoutlets()
		{  
			var c_jobnumber=document.getElementsByName("sxbd.c_jobnumber")[0].value 
			Sxbd.get_outlets(c_jobnumber, getoutlets);
			return false;
		}
		function getoutlets(datas)
		{					  
			DWRUtil.removeAllOptions('c_outletsid');					
			DWRUtil.addOptions('c_outletsid', datas, 'value', 'label'); 	
		}		
		function guidGenerator()
		{
			var s4=function (){
				return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
			};
			return (s4()+s4()+"-"+s4()+"-"+s4()+"-"+s4()+"-"+s4()+s4()+s4());		 
		} 
		function CGUI()
		{
			var c_cardnum=document.getElementsByName("bbr.c_cardnum")[0]
			c_cardnum.value=guidGenerator();
		}
		function settbrq()
		{			
			var myDate = new Date();
			var formatStr="yyyyMMdd"
			Y=myDate.getFullYear();
			formatStr=formatStr.replace("yyyy",String(Y));   
			M=myDate.getMonth()+1
			formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
			D=myDate.getDate()
			formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
			var c_tbrq=document.getElementsByName("sxbd.c_tbrq")[0];
			c_tbrq.value=formatStr;
		}
	</script>
	</head>
	<body >
		<c:choose>
		<c:when test="${param.c_type eq 1 }">
				<sql:query var="sxbd" dataSource="${db_mssql }" sql="select *,convert(char(8),c_datime,112) c_lrrq from t_sxbd 
					where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_flag='0' "></sql:query>
				<c:if test="${not empty sxbd.rows[0].c_no  }"> 					
					<sql:query var="sxtb" dataSource="${db_mssql }" sql="select * from t_sxtb 
						where c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' "></sql:query>	
					<sql:query var="sxbdzt0" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_cdrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_type=0 "></sql:query>		
					<sql:query var="sxbdzt1" dataSource="${db_mssql }" sql="select c_date c_cbrq,convert(char(8),c_datime,112) c_sxrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_type=1 "></sql:query>	
					<sql:query var="sxbdzt2" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_ffrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_type=2 "></sql:query>	
					<sql:query var="sxbdzt3" dataSource="${db_mssql }" sql="select c_date c_qzrq,convert(char(8),c_datime,112) c_hzrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_type=3 "></sql:query>		
					<sql:query var="sxbdzt4" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_tbrq1 from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_type=4 "></sql:query>	
					<sql:query var="sxbdzt5" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_tbrq2 from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_type=5 "></sql:query>		
					<sql:query var="sxbdzt9" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_zzrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_type=9 "></sql:query>	
				</c:if>					
		</c:when>
		<c:when test="${param.c_type eq 2 }">
				<sql:query var="sxbd" dataSource="${db_mssql }" sql="select *,convert(char(8),c_datime,112) c_lrrq from t_sxbd 
					where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_flag='0' "></sql:query>
				<c:if test="${not empty sxbd.rows[0].c_no  }">  
					<sql:query var="sxtb" dataSource="${db_mssql }" sql="select * from t_sxtb 
						where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' "></sql:query>	
					<sql:query var="sxbdzt0" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_cdrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_type=0 "></sql:query>		
					<sql:query var="sxbdzt1" dataSource="${db_mssql }" sql="select c_date c_cbrq,convert(char(8),c_datime,112) c_sxrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_type=1 "></sql:query>	
					<sql:query var="sxbdzt2" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_ffrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_type=2 "></sql:query>	
					<sql:query var="sxbdzt3" dataSource="${db_mssql }" sql="select c_date c_qzrq,convert(char(8),c_datime,112) c_hzrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_type=3 "></sql:query>		
					<sql:query var="sxbdzt4" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_tbrq1 from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_type=4 "></sql:query>	
					<sql:query var="sxbdzt5" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_tbrq2 from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_type=5 "></sql:query>	
					<sql:query var="sxbdzt9" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_zzrq from t_sxbdzt 
						where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_type=9 "></sql:query>	
				</c:if>							
		</c:when>
		</c:choose>		 		
		<sql:query var="tbr" dataSource="${db_mssql }" sql="select * from t_customer 
			where c_no=${sxbd.rows[0].c_tbrnum } "></sql:query>		
		<html:form action="/sxbd" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="sxbdadd" />
		<table width="100%" border="0" cellspacing="0" align="center" >
				<tr>
					<td height="33" colspan="8" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							保单数据查询 
						</div>
					</td>
				</tr>			
				<nested:nest property="tbr">
				<nested:hidden property="c_no" value="${tbr.rows[0].c_no }"></nested:hidden> 
				<nested:hidden property="c_jobnm" value="update"></nested:hidden> 			
				<tr>
				<td colspan="5" ><b style="font-size: 15">投保人资料</b></td>
				</tr>	 
			 	<tr>
			 	<td rowspan="2" width="20%">
			 	姓名：<nested:text property="c_name" value="${tbr.rows[0].c_name }" styleId="req" title="投保人姓名必须填写"></nested:text>
			 	</td>
			 	<td>证件类型：
			 	<sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
			 	<nested:select property="c_cardtype" value="${tbr.rows[0].c_cardtype }">
			 	<c:forEach var="row" items="${query1.rows}" >		
					<html:option value="${row.c_code }">${row.c_name }</html:option>
				</c:forEach>
			 	</nested:select></td>
			 	<td colspan="2">
			 	证件号码：<nested:text property="c_cardnum" value="${tbr.rows[0].c_cardnum }" size="40" styleId="req" title="投保人证件号码必须填写" ></nested:text>
			 	</td>
			 	<td>有效期至：<nested:text property="c_cardperiod" value="${tbr.rows[0].c_cardperiod }" maxlength="8"></nested:text> </td>
			 	</tr>		
			 	<tr>
			 	<td width="20%">
			 	国籍：<nested:text property="c_nation" value="${tbr.rows[0].c_nation }"></nested:text>
			 	</td>
			 	<td width="20%"><c:set property="c_sex" value="${tbr.rows[0].c_sex }" target="${sxbdForm.tbr }"></c:set>
			 	性别：<nested:radio property="c_sex" value="1"></nested:radio>男
			 		 <nested:radio property="c_sex" value="2"></nested:radio>女
			 	</td>
			 	<td width="20%">
			 	出生日期：<nested:text property="c_birthy" size="4" value="${tbr.rows[0].c_birthy }" onchange="reg_num(this)"></nested:text>年
			 	<nested:text property="c_birthm" size="2" value="${tbr.rows[0].c_birthm }" onchange="reg_num(this)"></nested:text>月
			 	<nested:text property="c_birthd" size="2" value="${tbr.rows[0].c_birthd }" onchange="reg_num(this)"></nested:text>日
			 	</td>
			 	<td width="20%"><c:set property="c_marriage" value="${tbr.rows[0].c_marriage }" target="${sxbdForm.tbr }"></c:set>
			 	婚姻状况：<nested:radio property="c_marriage" value="0"></nested:radio>单身
			 			<nested:radio property="c_marriage" value="1"></nested:radio>已婚
			 	</td>
			 	</tr>				 		
			 	<tr>
			 	<td colspan="3">现住所地址：<nested:text property="c_hddr" value="${tbr.rows[0].c_hddr }" size="60"></nested:text></td>
			 	<td >固定电话：<nested:text property="c_phone" value="${tbr.rows[0].c_phone }"></nested:text> </td>
			 	<td >住址邮编：<nested:text property="c_hzip" value="${tbr.rows[0].c_hzip }"></nested:text> </td>
			 	</tr>
			 	<tr>
			 	<td>学历：
			 	<sql:query var="query2"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=13"></sql:query> 
			 	<nested:select property="c_education" value="${tbr.rows[0].c_education }">
			 		<c:forEach var="row2" items="${query2.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
			 	</nested:select> </td>
			 	<td colspan="2">			 	
			 	电子邮件地址：<nested:text property="c_email" value="${tbr.rows[0].c_email }" size="40"></nested:text>
			 	</td>
			 	<td>移动电话：<nested:text property="c_mobile" value="${tbr.rows[0].c_mobile }"></nested:text> </td>
			 	<td></td>
			 	</tr>
			 	<tr>
			 	<td colspan="3">工作单位/学校名称：<nested:text property="c_company" value="${tbr.rows[0].c_company }" size="60"></nested:text> </td>
			 	<td>单位邮编：<nested:text property="c_czip" value="${tbr.rows[0].c_czip }"></nested:text></td>
			 	<td></td>
			 	</tr>
			 	<tr>
			 	<td colspan="3">工作单位/学校地址：<nested:text property="c_cddr" value="${tbr.rows[0].c_cddr }" size="60"></nested:text> </td>
			 	<td>职务：<nested:text property="c_post" value="${tbr.rows[0].c_post }"></nested:text></td>
			 	<td>职业代码：<nested:text property="c_postcode" value="${tbr.rows[0].c_postcode }"></nested:text></td>
			 	</tr>
				</nested:nest> 		
				<c:choose>
				<c:when test="${sxbd.rows[0].c_tbrnum eq sxbd.rows[0].c_bbrnum}">
					<nested:nest property="bbr">
					<nested:hidden property="c_no" value="1"></nested:hidden> 
					<nested:hidden property="c_jobnm" value="add"></nested:hidden> 			
					<tr>
					<td ><b style="font-size: 15">被保险人资料</b></td>
					<td colspan="4"><font color="red">若为投保人本人，可免填本栏</font></td>
					</tr>	 
				 	<tr>
				 	<td rowspan="2" width="20%">
				 	姓名：<nested:text property="c_name" value="" ></nested:text>
				 	</td>
				 	<td>证件类型：
				 	<sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
				 	<nested:select property="c_cardtype" >
				 	<c:forEach var="row" items="${query1.rows}" >		
						<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach>
				 	</nested:select></td>
				 	<td colspan="2">
				 	证件号码：<nested:text property="c_cardnum" value="" size="40" ></nested:text>
				 	<!-- 
				 	<input type="button" value="生成临时证件号码" onclick="CGUI()">
				 	 -->
				 	</td>
				 	<td>有效期至：<nested:text property="c_cardperiod" value="" maxlength="8"></nested:text> </td>
				 	</tr>		
				 	<tr>
				 	<td width="20%">
				 	国籍：<nested:text property="c_nation" value="中国"></nested:text>
				 	</td>
				 	<td width="20%"><c:set property="c_sex" value="1" target="${sxbdForm.bbr }"></c:set>
				 	性别：<nested:radio property="c_sex" value="1"></nested:radio>男
				 		 <nested:radio property="c_sex" value="2"></nested:radio>女
				 	</td>
				 	<td width="20%">
				 	出生日期：<nested:text property="c_birthy" size="4" value="" onchange="reg_num(this)"></nested:text>年
				 	<nested:text property="c_birthm" size="2" value="" onchange="reg_num(this)"></nested:text>月
				 	<nested:text property="c_birthd" size="2" value="" onchange="reg_num(this)"></nested:text>日
				 	</td>
				 	<td width="20%"><c:set property="c_marriage" value="0" target="${sxbdForm.bbr }"></c:set>
				 	婚姻状况：<nested:radio property="c_marriage" value="0"></nested:radio>单身
				 			<nested:radio property="c_marriage" value="1"></nested:radio>已婚
				 	</td>
				 	</tr>				 		
				 	<tr>
				 	<td colspan="3">现住所地址：<nested:text property="c_hddr" value="" size="60"></nested:text></td>
				 	<td >固定电话：<nested:text property="c_phone" value=""></nested:text> </td>
				 	<td >住址邮编：<nested:text property="c_hzip" value=""></nested:text> </td>
				 	</tr>
				 	<tr>
				 	<td>学历：
				 	<sql:query var="query2"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=13"></sql:query> 
				 	<nested:select property="c_education">
				 		<c:forEach var="row2" items="${query2.rows}" >		
								<html:option value="${row2.c_code }">${row2.c_name }</html:option>
							</c:forEach>
				 	</nested:select> </td>
				 	<td colspan="2">			 	
				 	电子邮件地址：<nested:text property="c_email" value="" size="40"></nested:text>
				 	</td>
				 	<td>移动电话：<nested:text property="c_mobile" value=""></nested:text> </td>
				 	<td></td>
				 	</tr>
				 	<tr>
				 	<td colspan="3">工作单位/学校名称：<nested:text property="c_company" value="" size="60"></nested:text> </td>
				 	<td>单位邮编：<nested:text property="c_czip" value=""></nested:text></td>
				 	<td></td>
				 	</tr>
				 	<tr>
				 	<td colspan="3">工作单位/学校地址：<nested:text property="c_cddr" value="" size="60"></nested:text> </td>
				 	<td>职务：<nested:text property="c_post" value=""></nested:text></td>
				 	<td>职业代码：<nested:text property="c_postcode" value=""></nested:text></td>
				 	</tr>
					</nested:nest>	
				</c:when>
				<c:when test="${sxbd.rows[0].c_tbrnum ne sxbd.rows[0].c_bbrnum}">
					<sql:query var="bbr" dataSource="${db_mssql }" sql="select * from t_customer 
						where c_no=${sxbd.rows[0].c_bbrnum } "></sql:query>
					<nested:nest property="bbr">
					<nested:hidden property="c_no" value="${bbr.rows[0].c_no }"></nested:hidden> 
					<nested:hidden property="c_jobnm" value="update"></nested:hidden> 			
					<tr>
					<td ><b style="font-size: 15">被保险人资料</b></td>
					<td colspan="4"><font color="red">若为投保人本人，可免填本栏</font></td>
					</tr>	 
				 	<tr>
				 	<td rowspan="2" width="20%">
				 	姓名：<nested:text property="c_name" value="${bbr.rows[0].c_name }" ></nested:text>
				 	</td>
				 	<td>证件类型：
				 	<sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
				 	<nested:select property="c_cardtype" value="${bbr.rows[0].c_cardtype }">
				 	<c:forEach var="row" items="${query1.rows}" >		
						<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach>
				 	</nested:select></td>
				 	<td colspan="2">
				 	证件号码：<nested:text property="c_cardnum" value="${bbr.rows[0].c_cardnum }" size="40" ></nested:text>
				 	<input type="button" value="生成临时证件号码" onclick="CGUI()">
				 	</td>
				 	<td>有效期至：<nested:text property="c_cardperiod" value="${bbr.rows[0].c_cardperiod }" maxlength="8"></nested:text> </td>
				 	</tr>		
				 	<tr>
				 	<td width="20%">
				 	国籍：<nested:text property="c_nation" value="${bbr.rows[0].c_nation }"></nested:text>
				 	</td>
				 	<td width="20%"><c:set property="c_sex" value="${bbr.rows[0].c_sex }" target="${sxbdForm.bbr }"></c:set>
				 	性别：<nested:radio property="c_sex" value="1"></nested:radio>男
				 		 <nested:radio property="c_sex" value="2"></nested:radio>女
				 	</td>
				 	<td width="20%">
				 	出生日期：<nested:text property="c_birthy" size="4" value="${bbr.rows[0].c_birthy }" onchange="reg_num(this)"></nested:text>年
				 	<nested:text property="c_birthm" size="2" value="${bbr.rows[0].c_birthm }" onchange="reg_num(this)"></nested:text>月
				 	<nested:text property="c_birthd" size="2" value="${bbr.rows[0].c_birthd }" onchange="reg_num(this)"></nested:text>日
				 	</td>
				 	<td width="20%"><c:set property="c_marriage" value="${bbr.rows[0].c_marriage }" target="${sxbdForm.bbr }"></c:set>
				 	婚姻状况：<nested:radio property="c_marriage" value="0"></nested:radio>单身
				 			<nested:radio property="c_marriage" value="1"></nested:radio>已婚
				 	</td>
				 	</tr>				 		
				 	<tr>
				 	<td colspan="3">现住所地址：<nested:text property="c_hddr" value="${bbr.rows[0].c_hddr }" size="60"></nested:text></td>
				 	<td >固定电话：<nested:text property="c_phone" value="${bbr.rows[0].c_phone }"></nested:text> </td>
				 	<td >住址邮编：<nested:text property="c_hzip" value="${bbr.rows[0].c_hzip }"></nested:text> </td>
				 	</tr>
				 	<tr>
				 	<td>学历：
				 	<sql:query var="query2"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=13"></sql:query> 
				 	<nested:select property="c_education" value="${bbr.rows[0].c_education }">
				 		<c:forEach var="row2" items="${query2.rows}" >		
								<html:option value="${row2.c_code }">${row2.c_name }</html:option>
							</c:forEach>
				 	</nested:select> </td>
				 	<td colspan="2">			 	
				 	电子邮件地址：<nested:text property="c_email" value="${bbr.rows[0].c_email }" size="40"></nested:text>
				 	</td>
				 	<td>移动电话：<nested:text property="c_mobile" value="${bbr.rows[0].c_mobile }"></nested:text> </td>
				 	<td></td>
				 	</tr>
				 	<tr>
				 	<td colspan="3">工作单位/学校名称：<nested:text property="c_company" value="${bbr.rows[0].c_company }" size="60"></nested:text> </td>
				 	<td>单位邮编：<nested:text property="c_czip" value="${bbr.rows[0].c_czip }"></nested:text></td>
				 	<td></td>
				 	</tr>
				 	<tr>
				 	<td colspan="3">工作单位/学校地址：<nested:text property="c_cddr" value="${bbr.rows[0].c_cddr }" size="60"></nested:text> </td>
				 	<td>职务：<nested:text property="c_post" value="${bbr.rows[0].c_post }"></nested:text></td>
				 	<td>职业代码：<nested:text property="c_postcode" value="${bbr.rows[0].c_postcode }"></nested:text></td>
				 	</tr>
					</nested:nest>		
				</c:when>
				</c:choose> 				
				<nested:nest property="sxbd">
				<nested:hidden property="c_jobnm" value="check"></nested:hidden> 			
				<tr>
				<c:set property="c_tbrrel" value="${fn:trim(sxbd.rows[0].c_tbrrel) }" target="${sxbdForm.sxbd }"></c:set>
				<td colspan="5"><font color="red"> 投保人是被保险人的：
				<nested:radio property="c_tbrrel" value="本人" ></nested:radio>本人
				<nested:radio property="c_tbrrel" value="配偶" ></nested:radio>配偶
				<nested:radio property="c_tbrrel" value="父母" ></nested:radio>父母
				<nested:radio property="c_tbrrel" value="子女" ></nested:radio>子女
				<nested:radio property="c_tbrrel" value="其他" ></nested:radio>其他
				</font>
				</td>
				</tr>
				<tr>
				<td colspan="5" ><b style="font-size: 15">通讯方式</b></td>
				</tr>	
				<tr>
				<td colspan="3">通讯地址：<nested:text property="c_address" value="${sxbd.rows[0].c_address }" size="60" styleId="req" title="通讯地址必须填写"></nested:text> </td>
				<td>邮编：<nested:text property="c_zip" value="${sxbd.rows[0].c_zip }"></nested:text></td>
				<td></td>
				</tr>
				<tr>
				<td colspan="5" ><b style="font-size: 15">身故受益人资料</b></td>
				</tr>	
				<tr>
				<td colspan="5">
				<table width="100%" cellpadding="0" cellspacing="0">
				<tr >
				<td width="10%">姓名</td>
				<td width="10%">性别</td>
				<td width="10%">与被保险人关系</td>
				<td width="10%">受益顺序</td>
				<td width="10%">受益比例</td>
				<td width="10%">证件类型</td>
				<td width="40%">证件号码</td>
				</tr>
				<tr >
				<td width="10%"><nested:text property="c_name1" value="${sxbd.rows[0].c_name1 }"></nested:text> </td>
				<c:set property="c_sex1" value="${sxbd.rows[0].c_sex1 }" target="${sxbdForm.sxbd }"></c:set>
				<td width="10%"><nested:radio property="c_sex1" value="1"></nested:radio>男
			 		 			<nested:radio property="c_sex1" value="2"></nested:radio>女</td>
				<td width="10%"><nested:select property="c_bbrrel1" value="${sxbd.rows[0].c_bbrrel1 }">
								<html:option value="本人">本人</html:option>
								<html:option value="配偶">配偶</html:option>
								<html:option value="父母">父母</html:option>
								<html:option value="子女">子女</html:option>
								<html:option value="其他">其他</html:option>
								</nested:select> </td>
				<td width="10%"><nested:text property="c_sysx1" value="${sxbd.rows[0].c_sysx1 }" size="10" onchange="reg_num(this)"></nested:text></td>
				<td width="10%"><nested:text property="c_sybl1" value="${sxbd.rows[0].c_sybl1 }" size="10" onchange="reg_num(this)"></nested:text>%</td>
				<td width="10%"><sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
							 	<nested:select property="c_cardtype1" value="${sxbd.rows[0].c_cardtype1 }">
							 	<c:forEach var="row" items="${query1.rows}" >		
									<html:option value="${row.c_code }">${row.c_name }</html:option>
								</c:forEach>
							 	</nested:select></td>
				<td width="40%"><nested:text property="c_cardnum1" value="${sxbd.rows[0].c_cardnum1 }" size="40"></nested:text></td>
				</tr>
				<tr >
				<td width="10%"><nested:text property="c_name2" value="${sxbd.rows[0].c_name2 }"></nested:text> </td>
				<c:set property="c_sex2" value="${sxbd.rows[0].c_sex2 }" target="${sxbdForm.sxbd }"></c:set>
				<td width="10%"><nested:radio property="c_sex2" value="1"></nested:radio>男
			 		 			<nested:radio property="c_sex2" value="2"></nested:radio>女</td>
				<td width="10%"><nested:select property="c_bbrrel2" value="${sxbd.rows[0].c_bbrrel2 }">
								<html:option value="本人">本人</html:option>
								<html:option value="配偶">配偶</html:option>
								<html:option value="父母">父母</html:option>
								<html:option value="子女">子女</html:option>
								<html:option value="其他">其他</html:option>
								</nested:select> </td>
				<td width="10%"><nested:text property="c_sysx2" value="${sxbd.rows[0].c_sysx2 }" size="10" onchange="reg_num(this)"></nested:text></td>
				<td width="10%"><nested:text property="c_sybl2" value="${sxbd.rows[0].c_sybl2 }" size="10" onchange="reg_num(this)"></nested:text>%</td>
				<td width="10%"><sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
							 	<nested:select property="c_cardtype2" value="${sxbd.rows[0].c_cardtype2 }">
							 	<c:forEach var="row" items="${query1.rows}" >		
									<html:option value="${row.c_code }">${row.c_name }</html:option>
								</c:forEach>
							 	</nested:select></td>
				<td width="40%"><nested:text property="c_cardnum2" value="${sxbd.rows[0].c_cardnum2 }" size="40"></nested:text></td>
				</tr>
				<tr >
				<td width="10%"><nested:text property="c_name3" value="${sxbd.rows[0].c_name3 }"></nested:text> </td>
				<c:set property="c_sex3" value="${sxbd.rows[0].c_sex3 }" target="${sxbdForm.sxbd }"></c:set>
				<td width="10%"><nested:radio property="c_sex3" value="1"></nested:radio>男
			 		 			<nested:radio property="c_sex3" value="2"></nested:radio>女</td>
				<td width="10%"><nested:select property="c_bbrrel3" value="${sxbd.rows[0].c_bbrrel3 }">
								<html:option value="本人">本人</html:option>
								<html:option value="配偶">配偶</html:option>
								<html:option value="父母">父母</html:option>
								<html:option value="子女">子女</html:option>
								<html:option value="其他">其他</html:option>
								</nested:select> </td>
				<td width="10%"><nested:text property="c_sysx3" value="${sxbd.rows[0].c_sysx3 }" size="10" onchange="reg_num(this)"></nested:text></td>
				<td width="10%"><nested:text property="c_sybl3" value="${sxbd.rows[0].c_sybl3 }" size="10" onchange="reg_num(this)"></nested:text>%</td>
				<td width="10%"><sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
							 	<nested:select property="c_cardtype3" value="${sxbd.rows[0].c_cardtype3 }">
							 	<c:forEach var="row" items="${query1.rows}" >		
									<html:option value="${row.c_code }">${row.c_name }</html:option>
								</c:forEach>
							 	</nested:select></td>
				<td width="40%"><nested:text property="c_cardnum3" value="${sxbd.rows[0].c_cardnum3 }" size="40"></nested:text></td>
				</tr>
				</table>
				</td>				
				</tr>
				<tr>
				<td colspan="5" ><b style="font-size: 15">投保单信息</b></td>
				</tr>	
				<tr>
				<nested:hidden property="c_orgid" value="${sxbd.rows[0].c_orgid }"></nested:hidden>
				<nested:hidden property="c_companyid" value="${sxbd.rows[0].c_companyid }"></nested:hidden>
				<td colspan="2">投保单号：<nested:text property="c_tbd" value="${sxbd.rows[0].c_tbd }" size="60" styleId="req" title="投保单号必须填写"></nested:text> </td>
				<td>投保日期：<nested:text property="c_tbrq" maxlength="8" value="${sxbd.rows[0].c_tbrq }" styleId="req" title="投保日期必须填写"></nested:text> </td>		
				<td colspan="2"><font color="red">保单号：</font>
				<nested:text property="c_bd" value="${sxbd.rows[0].c_bd }" size="60" styleId="req" title="保单号必须填写" ></nested:text> </td>			
				</tr>
				<tr>
				<td>代理人工号：<nested:text property="c_jobnumber" value="${sxbd.rows[0].c_jobnumber }" onchange="setname()" styleId="req" title="代理人工号必须填写"></nested:text> </td>
				<sql:query var="span" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${sxbd.rows[0].c_jobnumber }' "></sql:query>
				<td>代理人姓名：<span id="c_name">${span.rows[0].c_name }</span></td>
				<td colspan="3">银行网点：<nested:select property="c_outletsid" styleId="c_outletsid" value="${sxbd.rows[0].c_outletsid }">
				<html:option value="-1">直销</html:option>
				<sql:query var="sql_outletsid" dataSource="${db_mssql }" sql="select * from t_bankoutlets where c_no in (
				select c_outletsid from t_bankrelate where c_jobnumber = '${sxbd.rows[0].c_jobnumber }' and c_flag='0' )"></sql:query>
				<c:forEach items="${sql_outletsid.rows}" var="row_outletsid">
				<html:option value="${row_outletsid.c_no }">${row_outletsid.c_name }[${row_outletsid.c_code }]</html:option>
				</c:forEach>
				</nested:select> </td>			
				</tr> 	
				<tr>
				<td>银行名称：
					<sql:query var="query5"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bank" value="${sxbd.rows[0].c_bank }">
						<c:forEach var="row5" items="${query5.rows}" >		
							<html:option value="${row5.c_code }">${row5.c_name }</html:option>
						</c:forEach>
					</nested:select></td>
				<td colspan="4">银行账号/卡号：<nested:text property="c_bankcode" value="${sxbd.rows[0].c_bankcode }" size="60" styleId="req" title="银行账号/卡号必须填写"></nested:text> </td>
				</tr>
				<tr>
				<c:set property="c_pay" value="${sxbd.rows[0].c_pay }" target="${sxbdForm.sxbd }"></c:set>
				<td>交费方式：<nested:select property="c_pay">
							<html:option value="12">年交</html:option>
							<html:option value="6">半年交</html:option>
							<html:option value="3">季交</html:option>
							<html:option value="1">月交</html:option>								
							<html:option value="0">趸交</html:option>						
							</nested:select> </td>
				<c:set property="c_pad" value="${sxbd.rows[0].c_pad }" target="${sxbdForm.sxbd }"></c:set>			
				<td>自动垫交：<nested:select property="c_pad">
							<html:option value="0">是</html:option>								
							<html:option value="1">否</html:option>
							</nested:select></td>	
				<c:set property="c_controversy" value="${sxbd.rows[0].c_controversy }" target="${sxbdForm.sxbd }"></c:set>			
				<td>争议处理方式：<nested:select property="c_controversy">
							<html:option value="1">诉讼</html:option>								
							<html:option value="2">仲裁</html:option>
							</nested:select></td>	
				</tr>
				<tr>
				<td ><b style="font-size: 15">投保事项信息</b></td>
				<td colspan="4"><font color="red">若交费期间为趸交，则交费期限为1</font></td>
				</tr>	 
				<script type="text/javascript">
				function js_bxq2(c_bxqtype,c_bxq)
				{   
					if (c_bxqtype=='1')
					{
						c_bxq.innerHTML="保<input name=\"sxbd.c_bxq\" size=\"2\" value=\"0\">年";
					}
					if (c_bxqtype=='2')
					{
						c_bxq.innerHTML="保至<input name=\"sxbd.c_bxq\" size=\"2\" value=\"0\">岁";
					}
					if (c_bxqtype=='0')
					{
						c_bxq.innerHTML="<input type=\"hidden\" name=\"sxbd.c_bxq\" value=\"0\">";
					}
				}	
				function js_jfq2(c_jfqtype,c_jfq)
				{  
					if (c_jfqtype=='1')
					{
						c_jfq.innerHTML="交<input name=\"sxbd.c_jfq\" size=\"2\" value=\"0\">年";
					}
					if (c_jfqtype=='2')
					{
						c_jfq.innerHTML="交至<input name=\"sxbd.c_jfq\" size=\"2\" value=\"0\">岁";
					}
					if (c_jfqtype=='0')
					{
						c_jfq.innerHTML="<input type=\"hidden\" name=\"sxbd.c_jfq\" value=\"0\">";
					}
				}	
				</script>
				<tr>
				<td colspan="5">
				<table width="100%" cellpadding="0" cellspacing="0" id="tb">
				<tr>
				<td width="40%">险种</td>
				<td width="15%">保险期间</td>
				<td width="15%">交费期间</td>
				<td width="15%">交费期限</td>
				<td width="15%">保险金额</td>
				<td width="15%">保险费</td>				
				</tr> 
				<c:forEach items="${sxtb.rows }" var="rowp" varStatus="x">
				<tr >				
				<td>
				<sql:query var="query6" dataSource="${db_mssql }" sql="select * from t_product where c_companyid=${param.c_companyid } and c_flag='0' "></sql:query>
				<nested:select property="c_productid" value="${rowp.c_productid }">
				<c:forEach items="${query6.rows }" var="row6">
				<html:option value="${row6.c_no }">${row6.c_fullname }${row6.c_code }</html:option>
				</c:forEach>
				</nested:select>
				</td>
				<td>
				<nested:select property="c_bxqtype" styleId="c_bxqtype${x.index+1 }" onchange="js_bxq2(this.value,document.getElementById('c_bxq${x.index+1}'))" value="${rowp.c_bxqtype }">				
				<html:option value="1">保*年</html:option>
				<html:option value="2">保至*岁</html:option>
				<html:option value="0">终身</html:option>
				</nested:select><a id="c_bxq${x.index+1 }"></a>		 
				</td>
				<td>
				<nested:select property="c_jfqtype" styleId="c_jfqtype${x.index+1 }" onchange="js_jfq2(this.value,document.getElementById('c_jfq${x.index+1}'))" value="${rowp.c_jfqtype }">				
				<html:option value="1">交*年</html:option>
				<html:option value="2">交至*岁</html:option>
				<html:option value="0">趸交</html:option>
				</nested:select><a id="c_jfq${x.index+1 }"></a>									
				</td>
				<td><nested:text property="c_jfqx" value="${rowp.c_jfqx }" size="2"></nested:text></td>
				<td><nested:text property="c_bxje" value="${rowp.c_bxje }" size="15" onchange="reg_num(this)"></nested:text></td>
				<td><nested:text property="c_bxf" value="${rowp.c_bxf }" size="10" onchange="reg_num(this)"></nested:text>        
				<c:if test="${x.index ne 0 }">
				　<input type=button onclick=deleteitem(this,'tb') value='删除本行' id=del >
				</c:if>
				</td>
				</tr>			
				<script type="text/javascript"> 
				js_bxq2(document.getElementById("c_bxqtype${x.index+1}").value,document.getElementById("c_bxq${x.index+1}"));
				var bxqid=document.getElementById("c_bxq${x.index+1}");
				var bxq=bxqid.getElementsByTagName("input")[0]
				bxq.value='${rowp.c_bxq }'				 
				js_jfq2(document.getElementById("c_jfqtype${x.index+1}").value,document.getElementById("c_jfq${x.index+1}"));
				var jfqid=document.getElementById("c_jfq${x.index+1}");
				var jfq=jfqid.getElementsByTagName("input")[0]
				jfq.value='${rowp.c_jfq }'	
				</script>	
				</c:forEach>					
				</table>						
				</td>
				</tr>		
				<tr>
				<td colspan="5" ><b style="font-size: 15">其他信息</b></td>
				</tr>					
				<tr>	
				<td><font color="red">保单状态：
					<c:choose> 
					<c:when test="${fn:trim(sxbd.rows[0].c_jobnm) eq '0' }">正常状态</c:when>
					<c:when test="${fn:trim(sxbd.rows[0].c_jobnm) eq '4' }">犹豫期退保（撤单）</c:when>
					<c:when test="${fn:trim(sxbd.rows[0].c_jobnm) eq '5' }">正常退保</c:when> 					
					<c:when test="${fn:trim(sxbd.rows[0].c_jobnm) eq 'zz' }">保单终止</c:when>
					</c:choose>
					</font>
				</td>		 			
				<td>录入日期：${sxbd.rows[0].c_lrrq }</td>		
				<td>投保日期：${sxbd.rows[0].c_tbrq }</td>
				<td>撤单日期：${sxbdzt0.rows[0].c_cdrq }</td>				
				<td></td>
				</tr>				
				<tr>								
				<td>生效日期：${sxbdzt1.rows[0].c_sxrq }</td>				
				<td>承保日期：${sxbdzt1.rows[0].c_cbrq }</td>
				<td>发放日期：${sxbdzt2.rows[0].c_ffrq }</td>
				<td>客户签字日期：${sxbdzt3.rows[0].c_qzrq }</td>	
				<td>回执日期：${sxbdzt3.rows[0].c_hzrq }</td>	
				</tr>
				<tr>			
				<td>犹豫期退保日期：${sxbdzt4.rows[0].c_tbrq1 }</td>
				<td>退保日期：${sxbdzt5.rows[0].c_tbrq2 }</td> 	
				<td>保单终止日期：${sxbdzt9.rows[0].c_zzrq }</td> 			
				<td></td>
				<td></td>
				</tr>
				</nested:nest>				 
			</table>
			<br><br>
		</html:form>
	</body>
</html:html>
<script type="text/javascript">	 
 	var count=10;	
 	function addxz()
	{	
		count+=1;
		var row=tb.insertRow(tb.rows.length);
		var xz=""; 
		<c:forEach items="${query6.rows }" var="row6">
		xz+="<option value=${row6.c_no }>${row6.c_fullname }${row6.c_code }</option>";
		</c:forEach>		
		var cell1 = row.insertCell();
		cell1.innerHTML="<td ><select name=sxbd.c_productid>" +xz+ "</select></td>";	
		var cell2 = row.insertCell(); 
		var a="<select name=\"sxbd.c_bxqtype\" id=\"c_bxqtype"+count+"\" onchange=\"js_bxq2(this.value,document.getElementById('c_bxq"+count+"'))\"><option value=\"1\">保*年</option><option value=\"2\">保至*岁</option><option value=\"0\">终身</option></select><a id=\"c_bxq"+count+"\"></a>";
	 	cell2.innerHTML="<td  >"+a+"</td>";	
		js_bxq2(document.getElementById("c_bxqtype"+count).value,document.getElementById("c_bxq"+count));
		var cell3 = row.insertCell(); 
		var b="<select name=\"sxbd.c_jfqtype\" id=\"c_jfqtype"+count+"\" onchange=\"js_jfq2(this.value,document.getElementById('c_jfq"+count+"'))\"><option value=\"1\">交*年</option><option value=\"2\">交至*岁</option><option value=\"0\">趸交</option></select><a id=\"c_jfq"+count+"\"></a>";
		cell3.innerHTML="<td  >"+b+"</td>";	
		js_jfq2(document.getElementById("c_jfqtype"+count).value,document.getElementById("c_jfq"+count));
		var cell4 = row.insertCell(); 
		cell4.innerHTML="<td  ><input type=hidden name=sxbd.c_jfqx value=\"-1\"><input name=sxbd.c_bxje value=\"\" onchange=\"reg_num(this)\" size=15></</td>";	
		var cell5 = row.insertCell(); 
		cell5.innerHTML="<td  ><input name=sxbd.c_bxf value=\"\" onchange=\"reg_num(this)\" size=10> 　<input type=button onclick=deleteitem(this,'tb') value='删除本行' id=del ></</td>";	 
	}	
	function deleteitem(obj,id)
    {
     	var rowNum,curRow;
     	curRow = obj.parentNode.parentNode;
	 	rowNum = eval("document.all."+id).rows.length - 1;
     	eval("document.all["+'"'+id+'"'+"]").deleteRow(curRow.rowIndex); 
    }  
</script>
