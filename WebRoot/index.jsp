<%@ page language="java"  pageEncoding="gbk"%>
<%@include file="tool/common/taglib.jsp"%> 
<html>
	<head>
		<title>业务管理系统</title> 		
	</head>	
	<frameset rows="70,*"  border="0"  >
		<frame src="tool/common/head.jsp" frameborder="0" name="head"  noresize="noresize" scrolling="no">
		<frameset id="f3"  cols="230,*"   framespacing="0" >
			<frame src="left.jsp" scrolling="yes" frameborder="0"  name="left"  noresize="noresize"  marginwidth="0" >	
			<frame src="welcome.jsp" scrolling="yes" name="main" frameborder="0" noresize="noresize" scrolling="auto" marginwidth="0">
		</frameset>
	</frameset>	
</html>