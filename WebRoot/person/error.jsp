<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp"%> 
<html>
	<head>
		<title>����ҳ��</title>
		<link rel="stylesheet" type="text/css" href="../tool/styles/main.css">
	</head>
	<body>		
		<table width="100%"  border="0">
			<tr>
				<td height="33" colspan="2" background="../tool/images/113.gif">
					<div align="left">
						<img src="../tool/images/112.gif" width="16" height="15" />					
							����ҳ��
					</div> 
				</td>
			</tr>			
		</table>
		<div style="color: red;" align="center">
		<ul>
			<html:errors />
		</ul>
		<ul>
			<li> 
				${requestScope.e1} 
			</li>
			<li>
				${requestScope.e2}
			</li>
		</ul>
		</div>	
		<div align="center">			
			<html:link  href="#" onclick="window.history.back(-1)"><font size="5">����</font></html:link>
		</div>
	</body>
</html>


