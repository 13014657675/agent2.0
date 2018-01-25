<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp" %> 
<%
String basePath="";
%>
<c:if test="${ sessionScope.c_jobnumber=='ADMIN' }">
<%
	basePath = request.getScheme() + "://"
			+ request.getServerName() +  ":"   + request.getServerPort()
			+ request.getContextPath()+  "/";
	net.sf.navigator.menu.PermissionsAdapter permissions1 = new com.publics.SimplePermissionsAdapter(false,
			null);			
	request.getSession().setAttribute("exampleAdapter", permissions1); 
%>
</c:if>
<c:if test="${ sessionScope.c_jobnumber !='ADMIN' }">
<sql:query var="query"	sql=" p_staffqxcx '${sessionScope.c_jobnumber }','${param.c_xitong }' "
								dataSource="${db_mssql}"></sql:query>
<c:set var="str" value="${query.rows[0].c_menu }"></c:set>
<%
	basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	String num[] =null;
	if (pageContext.getAttribute("str")!=null)
	{
		String s=pageContext.getAttribute("str").toString();
		StringTokenizer st;	
		st = new StringTokenizer(s, "','");
		num = new String[st.countTokens()];
		int j = 0;
		while (st.hasMoreTokens()) 
			{
			num[j] = (st.nextToken());				
			j++;
			}
	}
	net.sf.navigator.menu.PermissionsAdapter permissions2 = new com.publics.SimplePermissionsAdapter(true,
			num);			
	request.getSession().setAttribute("exampleAdapter", permissions2);	
%>
</c:if> 
<base href="<%=basePath%>">  	 