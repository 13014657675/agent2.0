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
							�����������
					</div>
				</td>
			</tr>	 
			<tr>
				<td width="10%"><font color="red">����</font></td>
				<td width="23%"><nested:text property="c_name" value="" title="����������д" styleId="req" /></td>			
				<td width="10%">�Ա�</td>
				<td width="23%">									
					<c:set target="${staffForm.staff }" property="c_sex" value="1"></c:set>
					<nested:radio property="c_sex" value="1">��</nested:radio>
					<nested:radio property="c_sex" value="0">Ů</nested:radio>
				</td>
				<td width="10%">����������</td>
				<td width="23%"><nested:text property="c_birthday" onchange="reg_csny(this)" alt="���������ո�ʽ����ȷ" value="19860101"  /></td>							
			</tr>
			<tr>			
				<td width="5%">����</td>
				<td width="10%"><nested:text property="c_age" value=""  size="10" /></td>				
				<td>����</td>
				<td> 
					<sql:query var="query0"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=11"></sql:query>
					<nested:select property="c_nation">
						<c:forEach var="row2" items="${query0.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>
				<td>������ò</td>
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
				<td>ѧ��</td>
				<td>
					<sql:query var="query2"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=13"></sql:query>
					<nested:select property="c_education">
						<c:forEach var="row2" items="${query2.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>
				<td>����״��</td>
				<td> 
					<c:set target="${staffForm.staff }" property="c_marriage" value="0"></c:set>
					<nested:radio property="c_marriage" value="1">�ѻ�</nested:radio>
					<nested:radio property="c_marriage" value="0">δ��</nested:radio>
				</td>	
				<td>����״��</td>
				<td><nested:text property="c_healthy" value="����"  /></td>			
			</tr>	
			<tr>	
				<td>Ѫ��</td>
				<td>
					<sql:query var="query3"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=16"></sql:query>
					<nested:select property="c_blood">
						<c:forEach var="row2" items="${query3.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td> 
			   <td>֤������</td>
			   <td >
				<sql:query var="query4"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query>
					<nested:select property="c_certificatetype">
						<c:forEach var="row2" items="${query4.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
			</td>
			<td width="10%"><font color="red">֤������</font></td>
			<td><nested:text property="c_certificate" value="" size="30"  title="֤�����������д" styleId="req" /></td>	
			<tr>
				<td>����</td>
				<td ><nested:text property="c_native" size="30" value="" /></td>				
				<td>�������ڵ�</td>
				<td ><nested:text property="c_registerplace" size="30" value="" /></td>		
				<td>��ס��</td>
				<td ><nested:text property="c_livein" size="30" value="" /></td>							
			</tr>
			<tr>			
				<td>�ʱ�</td>
				<td ><nested:text property="c_zipcode"  value="" /></td>			
				<td>�̶��绰</td>
				<td><nested:text property="c_telephone"  value=""/></td>
				<td><font color="red">�ֻ�</font></td>
				<td><nested:text property="c_mobilephone" value="" styleId="req" title="�ֻ�������д"/></td>				
			</tr>
			<tr>			
				<td>email</td>
				<td><nested:text property="c_email"  value="xm@126.com" /></td>
				<td>����</td>
				<td><nested:text property="c_hobby"  value="" /></td>
				<td>����ˮƽ</td>
				<td><nested:text property="c_foreign"  value="" /></td>
			</tr>
			<tr>		
				<td>������ϵ������</td>
				<td><nested:text property="c_contactname"  value=""/></td>
				<td>������ϵ�˵绰</td>
				<td><nested:text property="c_contactphone" value="" /></td>				
				<td>����ˮƽ</td>
				<td><nested:text property="c_computer"  value="" /></td>
			</tr>			
			<tr>		
				<td>�μӹ���ʱ��</td>
				<td><nested:text property="c_workdate"  value=""/></td>
				<td>����</td>
				<td> 
					<sql:query var="query5"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bank">
						<c:forEach var="row2" items="${query5.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>				
				<td><font color="red">���п���</font></td>
				<td><nested:text property="c_bankcode"  value="" size="30" styleId="req" title="���п��ű�����д"/></td>
			</tr>		
			<tr>		
				<td>�������ʸ�֤��</td>
				<td colspan="3"><nested:text property="c_qualificate"  value="" size="60" /></td> 
				<td><font color="red">�ظ����п���</font></td>
				<td><input type="password" name="c_bankcode2" value="" size="30" id="req" title="�ظ����п��ű�����д" accesskey="�����������п��Ų�һ��" onblur="reg_same(document.getElementsByName('staff.c_bankcode')[0],this)"></td>
			</tr>			
			<tr>
				<td colspan="6" bgcolor="#3366CC">
					<div align="center" >
						�ܽ������
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
										��ֹʱ��
									</div>
								</td> 
								<td width="33%" colspan="2">
									<div align="center">
										ѧУ
									</div>
								</td>
								<td width="33%" colspan="2">
									<div align="center">
										רҵ
									</div>
								</td>
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_sqi1" value="20060606" maxlength="8" size="8" />	
									��<nested:text property="c_szhi1" value="20060606" maxlength="8" size="8" />									 
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
									��<nested:text property="c_szhi2" value="20060606" maxlength="8" size="8" />								 
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
									��<nested:text property="c_szhi3" value="20060606" maxlength="8" size="8" />							 
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
						��������
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
										����ʱ��
									</div>
								</td> 
								<td width="33%"  colspan="2">
									<div align="center">
										��������
									</div>
								</td>
								<td width="33%"  colspan="2">
									<div align="center">
										ְλ
									</div>
								</td>
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi1" value="20060606" maxlength="8" size="8" />	
									��<nested:text property="c_wzhi1" value="20060606" maxlength="8" size="8" />								 
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
									��<nested:text property="c_wzhi2" value="20060606" maxlength="8" size="8" />								 
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
									��<nested:text property="c_wzhi3" value="20060606" maxlength="8" size="8" />								 
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
									��<nested:text property="c_wzhi4" value="20060606" maxlength="8" size="8" />								 
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
									��<nested:text property="c_wzhi5" value="20060606" maxlength="8" size="8" />								 
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
									��<nested:text property="c_wzhi6" value="20060606" maxlength="8" size="8" />								 
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
						��ͥ��Ա
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<table width="100%" border="0" class="nobordert">
						<tr>
							<td width="25%"  >
								<div align="center" >
									����
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									��ν
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									������λ
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									��ַ
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
						<tr><td align="right">��ע</td>
							<td colspan="2">								
								<div align="center">
									<nested:textarea property="c_note" value="" cols="100" rows="5"></nested:textarea>
								</div>
							</td>
							<td> &nbsp;</td>				
					 </tr>
					 <tr>				
						<td colspan="6" align="center">
							<html:submit value=" ��һ�� " />
						</td>				 			
					</tr>
		</table></td></tr></table></nested:nest>
		</html:form> 	
</html:html>
