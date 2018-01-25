<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 		
		<sql:query var="q1" sql="select * from t_staff where c_jobnumber='${param.c_jobnumber }'" dataSource="${db_mssql }"></sql:query> 
		<body >
		<html:form  action="/staff" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="pwdreset"/>
		<nested:nest property="staff">	  
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							密码设置
						</div>
					</td>
				</tr>			
				<tr>
				<td align="right" width="50%">工号</td>
				<td> 
				 	${q1.rows[0].c_jobnumber }
				 	<nested:hidden property="c_jobnumber" value="${q1.rows[0].c_jobnumber }"></nested:hidden>
				</td>				
				</tr>	
				<tr>
				<td align="right" width="50%">姓名</td>
				<td> 
				 	${q1.rows[0].c_name }		 
				</td>				
				</tr>			
				<tr>
				<td align="right">新密码</td>
				<td>
				<nested:password property="c_pwd" value="" styleId="c_pwd"></nested:password>
				</td>				
				</tr>
				<tr>
				<td align="right">重复新密码</td>
				<td>
				<input type="password" name="c_pwd2" value="" accesskey="两次输入密码不一致" onblur="reg_same(c_pwd,document.getElementsByName('c_pwd2')[0])">
				</td>				
				</tr>
				<tr>
				<td align="right"><input type="submit" value="确 定"></td>
				<td><input type="reset" value="取 消"></td>				
				</tr>
				</table>		
			</nested:nest>
			</html:form>
			</body>  
</html:html>
