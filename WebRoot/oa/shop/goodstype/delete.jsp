<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
</head>		
	<body >		
		<form action="../../../toModule.do?prefix=/oa&page=/shop/goodstype/delete2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						����ɾ��
					</div>
				</td>
			</tr> 		 
			<tr>
				<td width="48%"><div align="right">�ⷿ��</div></td>
				<td width="52%" >
				<div align="left">
					<select name="c_libraryid" id="c_libraryid">
						<option value="1">�ʲ�����</option>
						<option value="2">�칫��Ʒ</option>
						<option value="3">��ͨ��֤</option>
					</select> 
				</div>
				</td>
			</tr> 		 
			<tr>
				<td width="48%" align="right"><html:submit value=" ȷ �� "/></td>
				<td width="52%" colspan="2">
					<html:reset  value=" ȡ �� " />
				</td> 
			</tr>		
		</table>	 
		</form> 
	</body> 
</html:html>
