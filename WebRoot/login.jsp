<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %> 
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>   
<html>
	<head>
		<title><bean:message key="system.welcome"/></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">  		
		<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon" /> 
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon" />   
		<%
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");
		response.setDateHeader("expires",0);
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
		<script type="text/javascript">					
		function init()
		{	 
			window.moveTo(0,0);	
			window.resizeTo(window.screen.width,window.screen.height);	
			if (window.name=='head'||window.name=='left'||window.name=='main')
			{
				var url='<%=basePath%>'+'login.jsp';	
				window.parent.location=url;
			}			 
			document.getElementById("c_jobnumber").focus()		
		}			 
		</script>	              
    </head>        
	<body onload="init()" bgcolor="#D6E0F9">
	<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
    	<td align="center" valign="middle">
			<html:form action="/login">
			<table  style="border-right: 3px outset; border-top: 3px outset; border-left: 3px outset; width: 0px; border-bottom: 3px outset"
			cellspacing="0" cellpadding="1" align="center" border="0" bgcolor="white" >
				<tr>
					<td valign="top">
						<table cellspacing="0" cellpadding="0" width="100%" height="100%" align="center" border="0" bgcolor="white">
							<tbody>
								<tr>
									<td><img height="17" src="tool/images/101.jpg" width="612"></td>
								</tr>
							</tbody>
						</table>						
						<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" bgcolor="white" >
							<tbody>
								<tr>
									<td width="24"><img height="300" src="tool/images/102.jpg" width="24"></td>
								    <td valign="middle" align="center" width="494" >
										<table height="100" cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="white">
											<tbody>
												<tr>
													<td>
													<table width="500" border="0" cellspacing="0" cellpadding="0" height="100" bgcolor="white">
                                                      <tr>
                                                        <td><div align="center" class="style1"><img src="tool/images/logo.jpg"></div></td>
                                                      </tr>
                                                    </table></td>
												</tr>
												<tr>
												<td>
												<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" bgcolor="white">
												<tbody>
													<tr>
														<td align="center" width="22%" rowspan="3">&nbsp;</td>
														<td width="19%" align="right"><img height="23" src="tool/images/username.gif" width="13" /><font style="font-size: 12px">用户名：</font> </td>
														<td width="59%"><html:text property="c_jobnumber" styleId="c_jobnumber" style="height: 18px" ></html:text></td>
													</tr>
													<tr>
														<td align="right"><img height="23" src="tool/images/password.gif" width="13" /><font style="font-size: 12px">密　码：</font></td>
														<td nowrap="nowrap"><html:password property="c_pwd" styleId="c_pwd" size="21" style="height: 18px" ></html:password>
														<font style="font-size: 12px" color="red">&nbsp;<html:errors property="c_pwd.error"/></font>
														</td>
													</tr>																								
													<tr>
														<td align="right"><img height="23" src="tool/images/ip.gif" width="13" /><font style="font-size: 12px">验证码：</font> </td>
														<td nowrap="nowrap"><html:text property="c_random" size="3" maxlength="4" styleId="c_random" style="height: 18px" ></html:text>
														<font style="font-size: 12px" color="red">请输入<img src="random.jsp" height="23"><html:errors property="c_random.error"   /></font> 										</td>
													</tr>
													<tr>
												    <td ></td>   
												    <td ></td>
												    <td align="left">
												    <br>
													<input type="image" height="23"  src="tool/images/login.gif" name="submit"> 						
													</td>
													</tr>											
												</tbody>
												</table>
												</td>
												</tr>
											</tbody>
										</table>											
							      </td>
									<td  valign="top" align="right"><img height="300"  src="tool/images/115.jpeg" width="24"></td>
								</tr>							
							</tbody>
						</table>
						<table cellspacing="0" cellpadding="0" width="100%" height="100%" align="center" border="0" bgcolor="white">
							<tbody>
								<tr>
									<td><img    src="tool/images/116.jpeg" width="612">	</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>		
			</table>
			</html:form>
			</td>
		</tr>
		</table>	
	</body>
</html>