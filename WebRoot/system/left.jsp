<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<jsp:include flush="true" page="/tool/common/view-menu.jsp" >
	<jsp:param value="A" name="c_xitong"/>
</jsp:include>
<html>
	<head>						
	</head>
	<body> 
		<TABLE width=100% height="100%"   border="0" align="left" style="background-color:#D6E0F9;"   cellpadding=0 cellspacing=0 > 	
			<TR >
				<TD width="100%"   id=menuTitle1				 
					height=33 background="tool/images/113.gif" style="FONT: 9pt ����;" align="center" >
					���˵�
				</TD>
			</TR>				
			<tr>
			<td style="background-color: #D6E0F9;border-style:groove;border-width=0px;border-color;black"  align="left" VALIGN="top"> 
			<menu:useMenuDisplayer name="DropDown" config="com.config.menu"
						permissions="exampleAdapter"> 
						<menu:displayMenu name="A1" />  
						<menu:displayMenu name="A2" />  
						<menu:displayMenu name="A3" />   
						<menu:displayMenu name="A0" />   
					</menu:useMenuDisplayer>				 
					<br>
			</td>				
			</tr>			
		</TABLE>
	</body>
</html>