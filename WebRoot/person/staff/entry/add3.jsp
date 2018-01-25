<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head> 
		<body>
		<html:form  action="/staff" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="staff_sql"/>
		<nested:nest property="staff">	 
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<nested:hidden property="c_no" value="0"></nested:hidden> 
		 <table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
							基本资料添加
					</div>
				</td>
			</tr>	 
			<tr>
				<td width="10%"><font color="red">姓名</font></td>
				<td width="23%"><nested:text property="c_name" value="" title="姓名必需填写" styleId="req" /></td>			
				<td width="10%">性别</td>
				<td width="23%">									
					<c:set target="${staffForm.staff }" property="c_sex" value="1"></c:set>
					<nested:radio property="c_sex" value="1">男</nested:radio>
					<nested:radio property="c_sex" value="0">女</nested:radio>
				</td>
				<td width="10%">出生年月日</td>
				<td width="23%"><nested:text property="c_birthday" onchange="reg_csny(this)" alt="出生年月日格式不正确" value="19860101"  /></td>							
			</tr>
			<tr>			
				<td width="5%">年龄</td>
				<td width="10%"><nested:text property="c_age" value=""  size="10" /></td>				
				<td>民族</td>
				<td> 
					<sql:query var="query0"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=11"></sql:query>
					<nested:select property="c_nation">
						<c:forEach var="row2" items="${query0.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>
				<td>政治面貌</td>
				<td>
					<sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=10"></sql:query>
					<nested:select property="c_politics">
						<c:forEach var="row2" items="${query1.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>						
			</tr>
			<tr>			
				<td>学历</td>
				<td>
					<sql:query var="query2"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=13"></sql:query>
					<nested:select property="c_education">
						<c:forEach var="row2" items="${query2.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>
				<td>婚姻状况</td>
				<td> 
					<c:set target="${staffForm.staff }" property="c_marriage" value="0"></c:set>
					<nested:radio property="c_marriage" value="1">已婚</nested:radio>
					<nested:radio property="c_marriage" value="0">未婚</nested:radio>
				</td>	
				<td>健康状况</td>
				<td><nested:text property="c_healthy" value="良好"  /></td>			
			</tr>	
			<tr>	
				<td>血型</td>
				<td>
					<sql:query var="query3"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=16"></sql:query>
					<nested:select property="c_blood">
						<c:forEach var="row2" items="${query3.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td> 
			   <td>证件类型</td>
			   <td >
				<sql:query var="query4"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query>
					<nested:select property="c_certificatetype">
						<c:forEach var="row2" items="${query4.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
			</td>
			<td width="10%"><font color="red">证件号码</font></td>
			<td><nested:text property="c_certificate" value="" size="30"  title="证件号码必需填写" styleId="req" /></td>	
			<tr>
				<td>籍贯</td>
				<td ><nested:text property="c_native" size="30" value="" /></td>				
				<td>户口所在地</td>
				<td ><nested:text property="c_registerplace" size="30" value="" /></td>		
				<td>常住地</td>
				<td ><nested:text property="c_livein" size="30" value="" /></td>							
			</tr>
			<tr>			
				<td>邮编</td>
				<td ><nested:text property="c_zipcode"  value="" /></td>			
				<td>固定电话</td>
				<td><nested:text property="c_telephone"  value=""/></td>
				<td><font color="red">手机</font></td>
				<td><nested:text property="c_mobilephone" value="" styleId="req" title="手机必需填写"/></td>				
			</tr>
			<tr>			
				<td>email</td>
				<td><nested:text property="c_email"  value="xm@126.com" /></td>
				<td>爱好</td>
				<td><nested:text property="c_hobby"  value="" /></td>
				<td>外语水平</td>
				<td><nested:text property="c_foreign"  value="" /></td>
			</tr>
			<tr>		
				<td>紧急联系人姓名</td>
				<td><nested:text property="c_contactname"  value=""/></td>
				<td>紧急联系人电话</td>
				<td><nested:text property="c_contactphone" value="" /></td>				
				<td>电脑水平</td>
				<td><nested:text property="c_computer"  value="" /></td>
			</tr>			
			<tr>		
				<td>参加工作时间</td>
				<td><nested:text property="c_workdate"  value=""/></td>
				<td>银行</td>
				<td> 
					<sql:query var="query5"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bank">
						<c:forEach var="row2" items="${query5.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>				
				<td><font color="red">银行卡号</font></td>
				<td><nested:text property="c_bankcode"  value="" size="30" styleId="req" title="银行卡号必需填写"/></td>
			</tr>		
			<tr>		
				<td>代理人资格证号</td>
				<td colspan="3"><nested:text property="c_qualificate"  value="" size="60" /></td> 
				<td><font color="red">重复银行卡号</font></td>
				<td><input type="password" name="c_bankcode2" value="" size="30" id="req" title="重复银行卡号必需填写" accesskey="两次输入银行卡号不一致" onblur="reg_same(document.getElementsByName('staff.c_bankcode')[0],this)"></td>
			</tr>			
			<tr>
				<td colspan="6" bgcolor="#3366CC">
					<div align="center" >
						受教育情况
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="8">
					<div align="center">
						<table width="100%" border="0"class="nobordert">
							<tr>
								<td width="33%" colspan="2">
									<div align="center" >
										起止时间
									</div>
								</td> 
								<td width="33%" colspan="2">
									<div align="center">
										学校
									</div>
								</td>
								<td width="33%" colspan="2">
									<div align="center">
										专业
									</div>
								</td>
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_sqi1" value="20060606" maxlength="8" size="8" />	
									至<nested:text property="c_szhi1" value="20060606" maxlength="8" size="8" />									 
								</td> 
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_school1" value="" size="50"/>
									</div>
								</td>
								<td colspan="2">
									<div align="center">
										<nested:text property="c_professional1" value="" size="50"/>
									</div>
								</td>									 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_sqi2" value="20060606" maxlength="8" size="8" />
									至<nested:text property="c_szhi2" value="20060606" maxlength="8" size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_school2" value="" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_professional2" value="" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_sqi3" value="20060606" maxlength="8" size="8" />		
									至<nested:text property="c_szhi3" value="20060606" maxlength="8" size="8" />							 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_school3" value="" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_professional3" value="" size="50"/>
									</div>
								</td>							 
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="#3366CC">
					<div align="center" class="STYLE17">
						工作经历
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="8">
					<div align="center">
						<table width="100%" border="0" class="nobordert">
							<tr>
								<td width="33%"  colspan="2">
									<div align="center">
										起至时间
									</div>
								</td> 
								<td width="33%"  colspan="2">
									<div align="center">
										工作经历
									</div>
								</td>
								<td width="33%"  colspan="2">
									<div align="center">
										职位
									</div>
								</td>
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi1" value="20060606" maxlength="8" size="8" />	
									至<nested:text property="c_wzhi1" value="20060606" maxlength="8" size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_worknote1" value="" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker1" value="" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi2" value="20060606" maxlength="8" size="8" />	
									至<nested:text property="c_wzhi2" value="20060606" maxlength="8" size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worknote2" value="" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker2" value="" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi3" value="20060606" maxlength="8" size="8" />	
									至<nested:text property="c_wzhi3" value="20060606" maxlength="8" size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_worknote3" value="" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker3" value="" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi4" value="20060606" maxlength="8" size="8" />	
									至<nested:text property="c_wzhi4" value="20060606" maxlength="8" size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_worknote4" value="" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker4" value="" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi5" value="20060606" maxlength="8" size="8" />	
									至<nested:text property="c_wzhi5" value="20060606" maxlength="8" size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worknote5" value="" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker5" value="" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi6" value="20060606" maxlength="8" size="8" />	
									至<nested:text property="c_wzhi6" value="20060606" maxlength="8" size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_worknote6" value="" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker6" value="" size="50"/>
									</div>
								</td>							 
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="#3366CC">
					<div align="center" class="STYLE17">
						家庭成员
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<table width="100%" border="0" class="nobordert">
						<tr>
							<td width="25%"  >
								<div align="center" >
									姓名
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									称谓
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									工作单位
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									地址
								</div>
							</td>
						</tr>
						<tr>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_name1" value=""/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_call1" value=""/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_company1" value="" size="40"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_address1" value="" size="40"/>
								</div>
							</td>
						</tr>
						<tr>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_name2" value=""/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_call2" value=""/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_company2" value="" size="40"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_address2" value="" size="40"/>
								</div>
							</td>
						</tr>
						<tr>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_name3" value=""/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_call3" value=""/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_company3" value="" size="40"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_address3" value="" size="40"/>
								</div>
							</td>
						</tr>					
						<tr><td align="right">备注</td>
							<td colspan="2">								
								<div align="center">
									<nested:textarea property="c_note" value="" cols="100" rows="5"></nested:textarea>
								</div>
							</td>
							<td> &nbsp;</td>				
					 </tr>
					 <tr>				
						<td colspan="6" align="center">
							<html:submit value=" 下一步 " />
						</td>				 			
					</tr>
		</table></td></tr></table></nested:nest>
		</html:form> 	
</html:html>
