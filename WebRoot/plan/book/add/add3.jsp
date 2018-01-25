<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Planbook.js'></script>   
	<script type="text/javascript">
	function set()
	{
		var c_companyid = $("c_companyid").value;	
		Planbook.get_product(c_companyid, get);
		return false;
	}	
	function get(datas)
	{					
		DWRUtil.removeAllOptions('c_productid');					
		DWRUtil.addOptions('c_productid', datas, 'value', 'label');
	}	
	</script>
</head>
<body >  
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_plan_book where c_no=${param.c_plan_bookid }"></sql:query>
		<table width="100%" border="1" cellspacing="0" id="tb">
				<tr>
					<td height="33" colspan="5" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							�ƻ�������
						</div>
					</td>
				</tr>		
				<tr>
				<td colspan="5" ><b style="font-size: 15">�������</b></td>
				</tr>		
				<tr>
				<td>Ͷ����������${q1.rows[0].c_tbrname } 
				</td>
				</tr>
				<tr>
				<td width="20%">��������������${q1.rows[0].c_bbrname } 
				</td>
				<td width="20%">���������Ա�
				<c:choose>
				<c:when test="${q1.rows[0].c_bbrsex eq 1 }">��</c:when>
				<c:when test="${q1.rows[0].c_bbrsex eq 2 }">Ů</c:when>
				</c:choose> 
				</td>
				<td width="20%">�������˳������ڣ�${q1.rows[0].c_bbirthy }��${q1.rows[0].c_bbirthm }��${q1.rows[0].c_bbirthd }�� 
				</td> 
				<td width="20%">�����������䣺${q1.rows[0].c_age } 
				</td>
				<td></td>
				</tr> 
				<tr>
				<td width="20%">����</td>
				<td width="20%">����/����</td>
				<td width="20%">�����ڼ�</td> 
				<td width="20%">�ɷ��ڼ�</td>
				<td></td>
				</tr> 
				<c:set var="bxq_age" value="0"></c:set>
				<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_plan_books where c_plan_bookid=${param.c_plan_bookid }"></sql:query> 
				<c:forEach items="${q2.rows }" var="row">
				<tr>
				<td width="20%">
				<sql:query var="q21" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query> 
				<sql:query var="q22" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query> 
				���չ�˾��${q21.rows[0].c_name } <br>
				���֣�${q22.rows[0].c_fullname }
				</td>
				<td width="20%">
				<c:choose>				
				<c:when test="${row.c_basetype eq 1 }">���ѣ�</c:when>
				<c:when test="${row.c_basetype eq 2 }">���</c:when>
				</c:choose>
				${row.c_base }
				</td>
				<td width="20%">
				<c:choose>
				<c:when test="${row.c_bxqtype eq 0 }">����			 
				</c:when>
				<c:when test="${row.c_bxqtype eq 1 }">
				��${row.c_bxq }��					 
				</c:when>
				<c:when test="${row.c_bxqtype eq 2 }">
				����${row.c_bxq }�� 
				</c:when>
				</c:choose>
				</td> 
				<td width="20%">
				<c:choose>
				<c:when test="${row.c_jfqtype eq 0 }">����</c:when>
				<c:when test="${row.c_jfqtype eq 1 }">��${row.c_jfq }��</c:when>
				<c:when test="${row.c_jfqtype eq 2 }">����${row.c_jfq }��</c:when>
				</c:choose>
				</td>
				<td>				
				</td>
				</tr> 
				</c:forEach> 
				<tr>
				<td colspan="5" ><b style="font-size: 15">��������</b></td>
				</tr> 
				<c:forEach items="${q2.rows }" var="row">
				<tr>
				<sql:query var="q31" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query> 
				<td>���֣�${q31.rows[0].c_fullname }</td>				
				</tr>
				<sql:query var="q32" dataSource="${db_mssql }" sql="select * from t_pliability where c_companyid=${row.c_companyid } and c_productid=${row.c_productid }"></sql:query> 
				<c:forEach items="${q32.rows }" var="row3">
				<tr> 			
				<td>${row3.c_pname }</td>
				<td colspan="4"><textarea cols="150" rows="5">${row3.c_pdesc }</textarea></td>
				</tr>
				</c:forEach>			
				</c:forEach>										
				<c:forEach items="${q2.rows }" var="row">
				<tr>
				<sql:query var="q31" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query> 
				<td colspan="5" ><b style="font-size: 15">���֣�${q31.rows[0].c_fullname }������ʾ��</b>
				<font color="red">���������ڼ�Ϊ����������Ϊ������110�ꡱ��</font>
				</td>
				</tr>
				<tr>
				<td colspan="5" >
				<table width="100%" >
				<tr>
				<td>�������</td>
				<td>������������</td>
				<td>ÿ�걣��</td>
				<td>�ۼƱ���</td>
				<sql:query var="q33" dataSource="${db_mssql }" sql="select * from t_pliabilitys a,t_plan_books b 
					where a.c_companyid=b.c_companyid and a.c_productid=b.c_productid 
						and b.c_plan_bookid=${param.c_plan_bookid } and b.c_companyid=${row.c_companyid } and b.c_productid=${row.c_productid } "></sql:query> 
				<c:forEach items="${q33.rows }" var="row3">
				<td>${row3.c_pname }</td>
				</c:forEach>
				</tr> 
				<sql:query var="q4" dataSource="${db_mssql }" sql=" exec ph_plan_books_do ${param.c_plan_bookid },${row.c_companyid },${row.c_productid },1 "></sql:query>		
				<c:set var="s_bxf" value="0"></c:set>			
				<c:set var="i" value="0"></c:set>	
				<c:set var="s_bxje" value="${q4.rows[0].c_bxje }"></c:set>			 
				<c:forEach begin="${q1.rows[0].c_age+1 }" end="${q4.rows[0].c_mage }" var="row_age">		
				<tr>
				<c:set var="i" value="${i+1 }"></c:set>	
				<td>${i }</td>
				<td>${row_age }</td>		 
				<sql:query var="q41" dataSource="${db_mssql }" sql=" exec ph_plan_books_do ${param.c_plan_bookid },${row.c_companyid },${row.c_productid },${i } "></sql:query>	 
				<td>
				<fmt:formatNumber value="${q41.rows[0].c_bxf }" pattern="#00.0#" ></fmt:formatNumber>
				</td>	
				<td> 
				<c:set var="s_bxf" value="${q41.rows[0].c_bxf + s_bxf }"></c:set>
				<fmt:formatNumber value="${s_bxf }" pattern="#00.0#" ></fmt:formatNumber>					
				</td>		 
				<c:forEach items="${q33.rows }" var="row33">
				<td>
				<c:choose>				  
				<c:when test="${row33.c_condition eq 1 }">
						<c:choose>
						<c:when test="${row33.c_result eq 0 }"><fmt:formatNumber value="${row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 1 }"><fmt:formatNumber value="${s_bxje * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 2 }"><fmt:formatNumber value="${s_bxf * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when>
						</c:choose>					
				</c:when>				 
				<c:when test="${row33.c_condition eq 2 }">
				 <c:choose>
				 	<c:when test="${row33.c_cv2t eq 1 and i eq row33.c_cv2 }">
				 		<c:choose>
						<c:when test="${row33.c_result eq 0 }"><fmt:formatNumber value="${row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 1 }"><fmt:formatNumber value="${s_bxje * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 2 }"><fmt:formatNumber value="${s_bxf * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when>
						</c:choose>
				 	</c:when>
				 	<c:when test="${row33.c_cv2t eq 2 and row_age eq row33.c_cv2 }">
				 		<c:choose>
						<c:when test="${row33.c_result eq 0 }"><fmt:formatNumber value="${row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 1 }"><fmt:formatNumber value="${s_bxje * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 2 }"><fmt:formatNumber value="${s_bxf * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when>
						</c:choose>
				 	</c:when>
				 	<c:otherwise>  
				 	<sql:query var="q42" dataSource="${db_mssql }" sql="select * from t_pliabilitycv where c_pliabilitycid=${row33.c_cv2t  }
				 			and c_companyid=${row33.c_companyid } and c_productid=${row33.c_productid } 
				 			and c_bxqtype=${row33.c_bxqtype } and c_bxq=${row33.c_bxq } 
				 			and c_jfqtype=${row33.c_jfqtype } and c_jfq=${row33.c_jfq }"></sql:query>						 	
				 		<c:choose>
						<c:when test="${q42.rows[0].c_t eq 1 and i eq q42.rows[0].c_v }">
							<c:choose>
							<c:when test="${row33.c_result eq 0 }"><fmt:formatNumber value="${row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 1 }"><fmt:formatNumber value="${s_bxje * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 2 }"><fmt:formatNumber value="${s_bxf * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when>
							</c:choose> 
						</c:when> 
						<c:when test="${q42.rows[0].c_t eq 2 and row_age eq q42.rows[0].c_v }">							
							<c:choose>
							<c:when test="${row33.c_result eq 0 }"><fmt:formatNumber value="${row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 1 }"><fmt:formatNumber value="${s_bxje * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 2 }"><fmt:formatNumber value="${s_bxf * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when>
							</c:choose>
						</c:when> 
						</c:choose>		 
				 	</c:otherwise>
				 </c:choose>				 
				</c:when>
				<c:when test="${row33.c_condition eq 3 }">	
				 <c:set var="a" value="0"></c:set>			  
				 <c:choose>
				 	<c:when test="${row33.c_cv31t eq 1 and i >= row33.c_cv31 }">
				 	  	<c:set var="a" value="${a+1 }"></c:set>	 
				 	</c:when>
				 	<c:when test="${row33.c_cv31t eq 2 and row_age >= row33.c_cv31 }">
				 		  <c:set var="a" value="${a+1 }"></c:set>	 		
				 	</c:when>
				 	<c:otherwise> 
				 	<sql:query var="q42" dataSource="${db_mssql }" sql="select * from t_pliabilitycv where c_pliabilitycid=${row33.c_cv31t  }
				 			and c_companyid=${row33.c_companyid } and c_productid=${row33.c_productid } 
				 			and c_bxqtype=${row33.c_bxqtype } and c_bxq=${row33.c_bxq } 
				 			and c_jfqtype=${row33.c_jfqtype } and c_jfq=${row33.c_jfq }"></sql:query>	 
				 		<c:choose>
						<c:when test="${q42.rows[0].c_t eq 1 and i >= q42.rows[0].c_v }"> 
						<c:set var="a" value="${a+1 }"></c:set>		
						</c:when> 
						<c:when test="${q42.rows[0].c_t eq 2 and row_age >= q42.rows[0].c_v }"> 
						<c:set var="a" value="${a+1 }"></c:set>		
						</c:when> 
						</c:choose>		 
				 	</c:otherwise>
				 </c:choose> 					
				 <c:choose>
				 	<c:when test="${row33.c_cv32t eq 1 and i <= row33.c_cv32 }">
				 	  	<c:set var="a" value="${a+1 }"></c:set>		 
				 	</c:when>
				 	<c:when test="${row33.c_cv32t eq 2 and row_age <= row33.c_cv32 }">
				 		  <c:set var="a" value="${a+1 }"></c:set>	 
				 	</c:when>
				 	<c:otherwise> 
				 	<sql:query var="q42" dataSource="${db_mssql }" sql="select * from t_pliabilitycv where c_pliabilitycid=${row33.c_cv32t  }
				 			and c_companyid=${row33.c_companyid } and c_productid=${row33.c_productid } 
				 			and c_bxqtype=${row33.c_bxqtype } and c_bxq=${row33.c_bxq } 
				 			and c_jfqtype=${row33.c_jfqtype } and c_jfq=${row33.c_jfq }"></sql:query>	 
				 		<c:choose>
						<c:when test="${q42.rows[0].c_t eq 1 and i <= q42.rows[0].c_v }"> 
						<c:set var="a" value="${a+1 }"></c:set>		
						</c:when> 
						<c:when test="${q42.rows[0].c_t eq 2 and row_age <= q42.rows[0].c_v }"> 
						<c:set var="a" value="${a+1 }"></c:set>		
						</c:when> 
						</c:choose>		 
				 	</c:otherwise>
				 </c:choose> 					
				 <c:if test="${a eq 2 }">
					<c:choose>
					<c:when test="${row33.c_result eq 0 }"><fmt:formatNumber value="${row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 1 }"><fmt:formatNumber value="${s_bxje * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when><c:when test="${row33.c_result eq 2 }"><fmt:formatNumber value="${s_bxf * row33.c_rv }" pattern="#00.0#" ></fmt:formatNumber></c:when>
					</c:choose>
				 </c:if>			 
				</c:when>
				</c:choose>				
				</td>		
				</c:forEach>							
				</tr>
				</c:forEach>		
				</table>
				</td>
				</tr>	
				</c:forEach>										
				</table>	
				<br><br> 
				<sql:update var="del1" dataSource="${db_mssql }" sql="delete t_plan_books where c_plan_bookid=${param.c_plan_bookid }"></sql:update>
				<sql:update var="del2" dataSource="${db_mssql }" sql="delete t_plan_book where c_no=${param.c_plan_bookid }"></sql:update>
</body>
</html:html>

