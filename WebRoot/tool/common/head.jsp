<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@include file="/tool/common/taglib.jsp"%> 
<jsp:include flush="true" page="filesigned-pt.jsp"></jsp:include>
<jsp:include flush="true" page="signed-pt.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<script type="text/javascript">			
			function get(a)
			{ 
			 	if (a=='A' )
			 	{ document.getElementById("xtid").innerText="ϵͳ����";	} 
			 	if (a=='B')
			 	{ document.getElementById("xtid").innerText='����ϵͳ';  	} 
			 	if (a=='C')
			 	{ document.getElementById("xtid").innerText='�ϣ�ϵͳ';  	} 			  
			 	if (a=='D')
			 	{ document.getElementById("xtid").innerText='����ϵͳ';   }
			 	
			 	if (a=='E')
			 	{ document.getElementById("xtid").innerText='����ϵͳ';  	} 
			 	if (a=='F')
			 	{ document.getElementById("xtid").innerText='����ϵͳ';  	} 
			 	if (a=='G')
			 	{ document.getElementById("xtid").innerText='����ϵͳ';  	}  
			 	if (a=='H')
			 	{ document.getElementById("xtid").innerText='�ƻ���ϵͳ';  	} 			 	 
			}
			function OnTimer(){	 		    
		    	document.getElementById("flag").value='none';
		    	document.getElementById("msg").value='';
		    	setfilesigned()		    	 
 			} 
 			function OnAlert()
		 	{ 
		 		if ( document.getElementById("flag").value != 'none')
		 		{
			 		var MSG1 = new CLASS_MSN_MESSAGE("msg1",255,255,"ϵͳ��ʾ",document.getElementById("msg").value); 
					    MSG1.rect(null,null,null,screen.height); 
					    MSG1.speed= 10; 
					    MSG1.step= 5; 				    
					    MSG1.show(); 
				 }   
		 	}					
		 	
			timer=setInterval("OnTimer()",50000); // 5����ˢ��    
	</script>		 
	</head>
	<body leftMargin="0" topMargin="0" onload="OnTimer();">
	<input type="hidden"  name="msg"  id="msg" value="">
	<input type="hidden"  name="flag" id="flag" value="">
		<table background="../images/111.jpg" width="100%" border="0"
			height="100%" cellSpacing="0" cellPadding="0">
			<tr>
				<td width="27%" valign="middle" rowspan="2" align="center">
					<DIV
						style="MARGIN-TOP: 5pt; FONT-WEIGHT: bold; FONT-SIZE: 19pt; FILTER: Glow(Color=#000000,Strength=2); WIDTH: 100%; COLOR: #ffffff; FONT-FAMILY: ����">
						&nbsp;&nbsp;<A id="xtid">��ӭ��¼ϵͳ</A>
					</DIV>
				</td> 
				<td valign="bottom" style="FONT: 13pt ����;" width="30%" align="center">
						<div style="margin-bottom: 2pt" align="left">	
				  		 <a onclick="get('A')" href="../../system/left.jsp" target="left" style="color: black;text-decoration: none"> ϵͳ����	</a>| 
				  		 <a onclick="get('B')" href="../../person/left.jsp" target="left" style="color: black;text-decoration: none"> ����ϵͳ	</a>|	
				  		 <a onclick="get('C')" href="../../oa/left.jsp" target="left" style="color: black;text-decoration: none"> �ϣ�ϵͳ	</a>	| 
				  		 <a onclick="get('D')" href="../../financial/left.jsp" target="left" style="color: black;text-decoration: none"> ����ϵͳ	</a>	 
				  		<br> 	
				  		 <a onclick="get('E')" href="../../life/left.jsp" target="left" style="color: black;text-decoration: none"> ����ϵͳ </a>|	
				  		 <a onclick="get('F')" href="../../wealth/left.jsp" target="left" style="color: black;text-decoration: none"> ����ϵͳ	</a>    |
				  		 <a onclick="get('G')" href="../../report/left.jsp" target="left" style="color: black;text-decoration: none"> ����ϵͳ </a>|			  		 
				  		 <a onclick="get('H')" href="../../plan/left.jsp" target="left" style="color: black;text-decoration: none"> �ƻ���ϵͳ</a>				  		 		 
	 			    	</div> 		
				</td> 
				<td align="left" valign="bottom" width="27%">
					<div style="font-size: 13pt;margin-bottom: 2pt" > 					
					${sessionScope.Staff.c_name}[${sessionScope.c_jobnumber}]
					<html:link action="/loginout" module="/" style="color: black;text-decoration: none">ע��</html:link>
				    </div>
				</td>
				<td width="5%"></td>
			</tr>
		</table>
	</body>
</html>
