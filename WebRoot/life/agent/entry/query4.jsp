<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head> 
		<body>		 
		<sql:query var="q1" dataSource="${db_mssql}" sql="select * from t_staff where c_orgid=${param.c_orgid } and c_jobnumber='${param.c_jobnumber }' "></sql:query>	
		<html:form  action="/agent" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="agent_add"/>
		<nested:nest property="agent">	 
		<nested:hidden property="c_jobnm" value="update"></nested:hidden> 
		<nested:hidden property="c_no"    value="${q1.rows[0].c_no }"></nested:hidden>  
		<nested:hidden property="c_orgid" value="${q1.rows[0].c_orgid }"></nested:hidden>
		<table width="100%" border="1" cellspacing="0">
			<tr>
					<td height="33" colspan="10" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							��˾���ϲ�ѯ
						</div>
					</td>
			</tr>			 
			<tr>
				<td width="10%"><font color="red">����</font></td>
				<td width="23%"><nested:text property="c_name" value="${q1.rows[0].c_name }" title="����������д" styleId="req" /></td>			
				<td width="10%">�Ա�</td>
				<td width="23%">									
					<c:set target="${agentForm.agent }" property="c_sex" value="${q1.rows[0].c_sex }"></c:set>
					<nested:radio property="c_sex" value="1">��</nested:radio>
					<nested:radio property="c_sex" value="0">Ů</nested:radio>
				</td>
				<td width="10%">����������</td>
				<td width="23%"><nested:text property="c_birthday" value="${q1.rows[0].c_birthday }"  /></td>							
			</tr>
			 <tr>			
				<td width="5%">����</td>
				<td width="10%"><nested:text property="c_age" value="${q1.rows[0].c_age }"  size="10" /></td>				
				<td>����</td>
				<td> 
					<sql:query var="query0"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=11"></sql:query>
					<nested:select property="c_nation" value="${q1.rows[0].c_nation }">
						<c:forEach var="row2" items="${query0.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>
				<td>������ò</td>
				<td>
					<sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=10"></sql:query>
					<nested:select property="c_politics" value="${q1.rows[0].c_politics }">
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
					<nested:select property="c_education" value="${q1.rows[0].c_education }">
						<c:forEach var="row2" items="${query2.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>
				<td>����״��</td>
				<td> 
					<c:set target="${agentForm.agent }" property="c_marriage" value="${q1.rows[0].c_marriage }"></c:set>
					<nested:radio property="c_marriage" value="1">�ѻ�</nested:radio>
					<nested:radio property="c_marriage" value="0">δ��</nested:radio>
				</td>	
				<td>����״��</td>
				<td><nested:text property="c_healthy" value="${q1.rows[0].c_healthy }"  /></td>			
			</tr>	
			<tr>	
				<td>Ѫ��</td>
				<td> 
					<sql:query var="query3"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=16 "></sql:query>
					<nested:select property="c_blood" value="${q1.rows[0].c_blood }">
						<c:forEach var="row2" items="${query3.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td> 
			   <td>֤������</td>
			   <td >
				<sql:query var="query4"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query>
					<nested:select property="c_certificatetype" value="${q1.rows[0].c_certificatetype }">
						<c:forEach var="row2" items="${query4.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
			</td>
			<td width="10%"><font color="red">֤������</font></td>
			<td><nested:text property="c_certificate" value="${q1.rows[0].c_certificate }" size="30"  title="֤�����������д" styleId="req" /></td>	
			<tr>
				<td>����</td>
				<td ><nested:text property="c_native" size="30" value="${q1.rows[0].c_native }" /></td>				
				<td>�������ڵ�</td>
				<td ><nested:text property="c_registerplace" size="30" value="${q1.rows[0].c_registerplace }" /></td>		
				<td>��ס��</td>
				<td ><nested:text property="c_livein" size="30" value="${q1.rows[0].c_livein }" /></td>							
			</tr>
			<tr>			
				<td>�ʱ�</td>
				<td ><nested:text property="c_zipcode"  value="${q1.rows[0].c_zipcode }" /></td>			
				<td>�̶��绰</td>
				<td><nested:text property="c_telephone"  value="${q1.rows[0].c_telephone }"/></td>
				<td><font color="red">�ֻ�</font></td>
				<td><nested:text property="c_mobilephone" value="${q1.rows[0].c_mobilephone }" styleId="req" title="�ֻ�������д"/></td>				
			</tr>
			<tr>			
				<td>email</td>
				<td><nested:text property="c_email"  value="${q1.rows[0].c_email }" /></td>
				<td>����</td>
				<td><nested:text property="c_hobby"  value="${q1.rows[0].c_hobby }" /></td>
				<td>����ˮƽ</td>
				<td><nested:text property="c_foreign"  value="${q1.rows[0].c_foreign }" /></td>
			</tr>
			<tr>		
				<td>������ϵ������</td>
				<td><nested:text property="c_contactname"  value="${q1.rows[0].c_contactname }"/></td>
				<td>������ϵ�˵绰</td>
				<td><nested:text property="c_contactphone" value="${q1.rows[0].c_contactphone }" /></td>				
				<td>����ˮƽ</td>
				<td><nested:text property="c_computer"  value="${q1.rows[0].c_computer }" /></td>
			</tr>			
			<tr>		
				<td>�μӹ���ʱ��</td>
				<td><nested:text property="c_workdate"  value="${q1.rows[0].c_workdate }"/></td>
				<td>����</td>
				<td> 
					<sql:query var="query5"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=15"></sql:query>
					<nested:select property="c_bank" value="${q1.rows[0].c_bank }">
						<c:forEach var="row2" items="${query5.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
					</nested:select>
				</td>				
				<td><font color="red">���п���</font></td>
				<td><nested:text property="c_bankcode"  value="${q1.rows[0].c_bankcode }" size="30" styleId="req" title="���п��ű�����д"/></td>
			</tr>	
				<tr>		
				<td>�������ʸ�֤��</td>
				<td colspan="3"><nested:text property="c_qualificate"  value="${q1.rows[0].c_qualificate }" size="60" /></td> 
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
									<nested:text property="c_sqi1" value="${q1.rows[0].c_sqi1 }"   size="8" />	
									��<nested:text property="c_szhi1" value="${q1.rows[0].c_szhi1 }"  size="8" />									 
								</td> 
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_school1" value="${q1.rows[0].c_school1 }" size="50"/>
									</div>
								</td>
								<td colspan="2">
									<div align="center">
										<nested:text property="c_professional1" value="${q1.rows[0].c_professional1 }" size="50"/>
									</div>
								</td>									 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_sqi2" value="${q1.rows[0].c_sqi2 }"  size="8" />
									��<nested:text property="c_szhi2" value="${q1.rows[0].c_szhi2 }"  size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_school2" value="${q1.rows[0].c_school2 }" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_professional2" value="${q1.rows[0].c_professional2 }" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_sqi3" value="${q1.rows[0].c_sqi3 }"  size="8" />		
									��<nested:text property="c_szhi3" value="${q1.rows[0].c_szhi3 }" size="8" />							 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_school3" value="${q1.rows[0].c_school3 }" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_professional3" value="${q1.rows[0].c_professional3 }" size="50"/>
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
									<nested:text property="c_wqi1" value="${q1.rows[0].c_wqi1 }"  size="8" />	
									��<nested:text property="c_wzhi1" value="${q1.rows[0].c_wzhi1 }"  size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_worknote1" value="${q1.rows[0].c_worknote1 }" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker1" value="${q1.rows[0].c_worker1 }" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi2" value="${q1.rows[0].c_wqi2 }"  size="8" />	
									��<nested:text property="c_wzhi2" value="${q1.rows[0].c_wzhi2 }"  size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worknote2" value="${q1.rows[0].c_worknote2 }" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker2" value="${q1.rows[0].c_worker2 }" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi3" value="${q1.rows[0].c_wqi3 }" size="8" />	
									��<nested:text property="c_wzhi3" value="${q1.rows[0].c_wzhi3 }" size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_worknote3" value="${q1.rows[0].c_worknote3 }" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker3" value="${q1.rows[0].c_worker3 }" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi4" value="${q1.rows[0].c_wqi4 }"  size="8" />	
									��<nested:text property="c_wzhi4" value="${q1.rows[0].c_wzhi4 }"  size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_worknote4" value="${q1.rows[0].c_worknote4 }" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker4" value="${q1.rows[0].c_worker4 }" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi5" value="${q1.rows[0].c_wqi5 }"  size="8" />	
									��<nested:text property="c_wzhi5" value="${q1.rows[0].c_wzhi5 }"  size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worknote5" value="${q1.rows[0].c_worknote5 }" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker5" value="${q1.rows[0].c_worker5 }" size="50"/>
									</div>
								</td>							 
							</tr>
							<tr>
								<td align="center"  colspan="2">
									<nested:text property="c_wqi6" value="${q1.rows[0].c_wqi6 }" size="8" />	
									��<nested:text property="c_wzhi6" value="${q1.rows[0].c_wzhi6 }" size="8" />								 
								</td> 
								<td colspan="2">
									<div align="center"  >
										<nested:text property="c_worknote6" value="${q1.rows[0].c_worknote6 }" size="50"/>
									</div>
								</td>		
								<td colspan="2">
									<div align="center" >
										<nested:text property="c_worker6" value="${q1.rows[0].c_worker6 }" size="50"/>
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
									<nested:text property="c_name1" value="${q1.rows[0].c_name1 }"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_call1" value="${q1.rows[0].c_call1 }"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_company1" value="${q1.rows[0].c_company1 }" size="40"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_address1" value="${q1.rows[0].c_address1 }" size="40"/>
								</div>
							</td>
						</tr>
						<tr>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_name2" value="${q1.rows[0].c_name2 }"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_call2" value="${q1.rows[0].c_call2 }"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_company2" value="${q1.rows[0].c_company2 }" size="40"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_address2" value="${q1.rows[0].c_address2 }" size="40"/>
								</div>
							</td>
						</tr>
						<tr>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_name3" value="${q1.rows[0].c_name3 }"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_call3" value="${q1.rows[0].c_call3 }"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_company3" value="${q1.rows[0].c_company3 }" size="40"/>
								</div>
							</td>
							<td width="25%" >
								<div align="center" >
									<nested:text property="c_address3" value="${q1.rows[0].c_address3 }" size="40"/>
								</div>
							</td>
						</tr>					
						<tr><td align="right">��ע</td>
							<td colspan="2">								
								<div align="center">
									<nested:textarea property="c_note" value="${q1.rows[0].c_note }" cols="100" rows="5"></nested:textarea>
								</div>
							</td>
							<td> &nbsp;</td>				
					 </tr> 
		</table></nested:nest>
	</html:form>
	</body>
</html:html>
