<%@ page language="java" import="java.util.*,com.publics.*" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp"%> 
<sql:query var="q1" dataSource="${db_mssql }" sql="select c_menu from t_postqx 
	where c_postid=${param.c_postid } and c_xitong='${param.c_xitong }' "></sql:query>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<%	
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
	<base href="<%=basePath%>"> 		
	<link rel="stylesheet" type="text/css" href="tool/styles/main.css">	
</head>
<body>
<table width="100%" cellspacing="0" >
			<tr>
				<td height="33"  background="tool/images/113.gif">
					<img src="tool/images/112.gif" width="16" height="15" />
						权限设置
				</td>
			</tr>
</table>
	<html:form  action="/organization" onsubmit="return check_form(this)">
	<html:hidden property="jobname" value="postqx"/> 
	<nested:nest property="organization">  
	<nested:hidden property="c_postid" value="${param.c_postid }"></nested:hidden>
	<nested:hidden property="c_xitong" value="${param.c_xitong }"></nested:hidden>
	 <jsp:include flush="true" page="/tool/common/set-menu.jsp">
	 <jsp:param value="${q1.rows[0].c_menu }" name="c_menu"/> 
	 <jsp:param value="postqxMenuForm" name="MenuDisplayer"/>
	 </jsp:include>
		<div align="center">
			<html:submit value=" 确 定 " />				
		<div>
		</div></div>
	</nested:nest>
	</html:form>
	<br>
</body>	
	<script type="text/javascript">
	var t=	document.getElementsByTagName("table");
	var i=0	;
	for(;i<t.length;i++)
	t[i].width="100%";
	</script>	
</html:html>
