<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true"> 
<head>
	<html:base /> 
	<title></title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body >  
		<html:form  action="/lifesolve" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="sxsjjs"/>
		<nested:nest property="sxdz">			 
		<table width="100%" border="1" cellspacing="0" align="center">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif"  >
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						������������
					</div>
				</td>
			</tr>			 	
		   </nested:nest>
		   	<tr>
				<td align="right" width="50%" ><html:submit value=" ��������  "></html:submit></td>
				<td>					 	
				</td>
			</tr>			 
		</table>
		<br>
		<ul>
		<li>������������ݡ���ϵͳ�������������ں����ڱ�����ͳ����Ϣ��
		<br>�����ɱ�����ͳ����Ϣ�����ݲ�ѯ�в�ѯ������Ϣ�����������ݡ�</li>
		</ul>
	</html:form>
</body>
</html:html>