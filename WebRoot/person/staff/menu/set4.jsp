<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base/> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
<form action="../../../toModule.do?prefix=/person&page=/staff/menu/set5.jsp" method="post"> 
<input type="hidden" name="c_jobnumber" value="${param.c_jobnumber }">
<table  width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						Ȩ�޵���
					</div>
				</td>
			</tr>			
			<tr>				
				<td align="right" width="50%">ϵͳ </td>
				<td> <select name="c_xitong" style="width: 120">
				<option value="A" selected="selected">ϵͳ����</option>		 
				<option value="B">����ϵͳ</option>
				<option value="C">OAϵͳ</option>  
				<option value="D">����ϵͳ</option>  
				<option value="E">����ϵͳ</option>  
				<option value="G">����ϵͳ</option>	
				<option value="H">����ϵͳ</option>		 
				</select>			
				</td>				
			</tr>						
			<tr>
			<td></td>
			<td>
			<input type="submit" value="��һ��">
			</td>
			<td></td>
			</tr>			
		</table>
</form>

</body>	
</html:html>
