<%@ page language="java"  pageEncoding="gbk" import="com.test.*"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>
<body>	 <% TestProcessor cp = new TestProcessor(); %>	  
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="30" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							佣金计算
						</div>
					</td>
				</tr>	
				 <tr>
			 	 <td >年</td>
			  	 <td >${param.c_year }</td>
			   	 <td >月</td>
			     <td >${param.c_month }</td>
				 </tr>
				 <tr style="color: red">
				 <td width="10%">上级机构</td>
				 <td width="10%">机构名称</td>
				 <td width="10%">工号</td>
				 <td width="10%">姓名</td>
				 <td width="10%">业务政策</td>
				 <td width="50%">佣金明细</td>			
				 <td width="10%">应发佣金</td>	 
				 </tr> 
				 <sql:query var="p1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid }"></sql:query> 
	  			 <sql:query var="p2" dataSource="${db_mssql }" sql="select left(c_path,${p1.rows[0].c_order } * 2)+'%' c_path from t_organization where c_no=${param.c_orgid } and c_flag='0' "></sql:query> 
	   			 <html:form  action="/agent" onsubmit="return check_form(this)">
				 <html:hidden property="jobname" value="commission"/>
				 <nested:nest property="commission">	 
				 <nested:hidden property="c_year" value="${param.c_year }"></nested:hidden>
				 <nested:hidden property="c_month" value="${param.c_month }"></nested:hidden>							
				 <sql:query var="q1" dataSource="${db_mssql}" 
				 	sql="select a.* from v_sxagent a,t_organization b where a.c_orgid=b.c_no and a.c_system=1 and b.c_path like '${p2.rows[0].c_path }' and b.c_flag='0'  
				 		order by b.c_path"></sql:query>
				 <c:forEach items="${q1.rows}" var="row">
				  <nested:hidden property="c_orgid" value="${row.c_orgid }"></nested:hidden>		
				 <tr>
				 <sql:query var="q10" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_orgid }"></sql:query>
				 <sql:query var="q11" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q10.rows[0].c_parent }"></sql:query>		
				 <td>${q11.rows[0].c_name }</td>
				 <td>${q10.rows[0].c_name }</td>			
				 <td>
				 ${row.c_jobnumber }
				 <c:set var="c_orgid" value="${row.c_orgid }" scope="request"></c:set>
				 <c:set var="c_jobnumber" value="${row.c_jobnumber }" scope="request"></c:set>
				 <nested:hidden property="c_jobnumber" value="${row.c_jobnumber }"></nested:hidden>		
				 </td>
				 <td>${row.c_name }</td>
				 <td>
				 <sql:query var="q3" dataSource="${db_mssql}" sql=" select * from t_policy where c_system=${row.c_system}"></sql:query>
				 ${q3.rows[0].c_name }
				 </td>
				 <td>
				 <%
				 int y=Integer.parseInt(request.getParameter("c_year"));
				 int m=Integer.parseInt(request.getParameter("c_month"));
				 int c_orgid=Integer.parseInt(request.getAttribute("c_orgid").toString());
				 String c_jobnumber=request.getAttribute("c_jobnumber").toString();
				 //out.println(y);
				 //out.println(m);
				 //out.println(c_orgid);
				 //out.println(c_jobnumber);			
				 org.apache.struts.util.LabelValueBean lv=cp.doProcessor(y,m,c_orgid,c_jobnumber);
				 out.println(lv.getLabel());			 
				 %>
				 <nested:hidden property="c_str" value="<%=lv.getLabel() %>"></nested:hidden>		
				 </td>			
				 <td><%out.println(lv.getValue()); %>		
				 <nested:hidden property="c_strv" value="<%=lv.getValue() %>"></nested:hidden> 
				 </td>	 
				 </tr>
				 </c:forEach>
				 <tr>
				 <td colspan="20">
				 <input type="submit" value=" 确定发佣金  "/>
				 </td>
				 </tr>			 
				 </nested:nest>
				 </html:form>	 
			</table> 
			</body>			
</html:html>			