<%@ page language="java" import="java.util.*,com.publics.*" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp"%> 
<%
	String num[] = new String[20];	
	//20����˼�Ǽ�����20��һ���˵�����ô����ӵ�Ĭ�ϲ˵�		
	int j = 0;
	if (request.getParameter("c_menu")!=null)
	{
		String s=request.getParameter("c_menu").toString();
		StringTokenizer st;		
		st = new StringTokenizer(s, "','");
		num = new String[st.countTokens()+20];	
		while (st.hasMoreTokens()) 
		{
			num[j] = (st.nextToken());			
			j++;
		}			
	}
%>	
<c:choose>
		<c:when test="${param.c_xitong=='A' }">
			<!-- ϵͳ����-���Ĭ�ϵĸ��˵�ѡ���  -->
			<% 
				num[j] = ("A1");			
				j++;
				num[j] = ("A2");			
				j++;	 
				num[j] = ("A3");			
				j++;	
				num[j] = ("A0");			
				j++; 
				net.sf.navigator.menu.PermissionsAdapter permissions1 = new SimplePermissionsAdapter(true,num);
				request.getSession().setAttribute("exampleAdapter", permissions1);
			%>
				<menu:useMenuDisplayer name="${param.MenuDisplayer }"   permissions="exampleAdapter">								 			 
				<menu:displayMenu name="A1" />
				<br>
				<menu:displayMenu name="A2" />
				<br>		
				<menu:displayMenu name="A3" />
				<br>	
				<menu:displayMenu name="A0" />
				<br> 			 
				</menu:useMenuDisplayer>
		</c:when>		
		<c:when test="${param.c_xitong=='B' }">
			<!-- ����ϵͳ-���Ĭ�ϵĸ��˵�ѡ���  -->
			<% 
				num[j] = ("B1");			
				j++;
				num[j] = ("B2");			
				j++;	  
				//num[j] = ("B3");			
				//j++;				
				net.sf.navigator.menu.PermissionsAdapter permissions2 = new SimplePermissionsAdapter(true,num);
				request.getSession().setAttribute("exampleAdapter", permissions2);
			%>
				<menu:useMenuDisplayer name="${param.MenuDisplayer }"   permissions="exampleAdapter">								 			 
				<menu:displayMenu name="B1" />
				<br>				
				<menu:displayMenu name="B2" />
				<!-- 
				<br>	 	
				<menu:displayMenu name="B3" />
				<br>	 
				 -->				  
				</menu:useMenuDisplayer>
		</c:when>	
		<c:when test="${param.c_xitong=='C' }">
			<!-- �ϣ�ϵͳ-���Ĭ�ϵĸ��˵�ѡ���  -->
			<% 
				num[j] = ("C1");			
				j++;
				num[j] = ("C2");			
				j++;	
				num[j] = ("C3");			
				j++; 
				//num[j] = ("C4");			
				//j++; 
				net.sf.navigator.menu.PermissionsAdapter permissions3 = new SimplePermissionsAdapter(true,num);
				request.getSession().setAttribute("exampleAdapter", permissions3);
			%>
				<menu:useMenuDisplayer name="${param.MenuDisplayer }"   permissions="exampleAdapter">								 			 
				<menu:displayMenu name="C1" />
				<br>
				<menu:displayMenu name="C2" />
				<br>	
				<menu:displayMenu name="C3" />
				<br>	 
				<!-- 
				<menu:displayMenu name="C4" />
				<br>			 
				 -->
				</menu:useMenuDisplayer>
		</c:when>	
		
		<c:when test="${param.c_xitong=='D' }">
			<!-- ����ϵͳ-���Ĭ�ϵĸ��˵�ѡ���  -->
			<%  
				num[j] = ("D2");			
				j++; 
				num[j] = ("D3");			
				j++; 
				net.sf.navigator.menu.PermissionsAdapter permissions4 = new SimplePermissionsAdapter(true,num);
				request.getSession().setAttribute("exampleAdapter", permissions4);
			%>
				<menu:useMenuDisplayer name="${param.MenuDisplayer }"   permissions="exampleAdapter">			 
				<menu:displayMenu name="D2" />
				<br> 
				<menu:displayMenu name="D3" />
				<br> 
				</menu:useMenuDisplayer>
		</c:when>	
		
		<c:when test="${param.c_xitong=='E' }">
			<!-- ����ϵͳ-���Ĭ�ϵĸ��˵�ѡ���  -->
			<% 
				num[j] = ("E2");			
				j++; 
				num[j] = ("E3");			
				j++;  
				net.sf.navigator.menu.PermissionsAdapter permissions5 = new SimplePermissionsAdapter(true,num);
				request.getSession().setAttribute("exampleAdapter", permissions5);
			%>
				<menu:useMenuDisplayer name="${param.MenuDisplayer }"   permissions="exampleAdapter">								 			 
				<menu:displayMenu name="E2" />
				<br> 
				<menu:displayMenu name="E3" />
				<br>  
				</menu:useMenuDisplayer>
		</c:when>	
		
		<c:when test="${param.c_xitong=='G' }">
			<!-- ����ϵͳ-���Ĭ�ϵĸ��˵�ѡ���  -->
			<% 
				num[j] = ("G1");			
				j++; 
				num[j] = ("G2");			
				j++; 
				num[j] = ("G3");			
				j++; 
				num[j] = ("G5");			
				j++;
				num[j] = ("G6");			
				j++;
				net.sf.navigator.menu.PermissionsAdapter permissions6 = new SimplePermissionsAdapter(true,num);
				request.getSession().setAttribute("exampleAdapter", permissions6);
			%>
				<menu:useMenuDisplayer name="${param.MenuDisplayer }"   permissions="exampleAdapter">								 			 
				<menu:displayMenu name="G1" />
				<br> 
				<menu:displayMenu name="G2" />
				<br> 
				<menu:displayMenu name="G3" />
				<br> 
				<menu:displayMenu name="G5" />
				<br> 
				<menu:displayMenu name="G6" />
				<br>
				</menu:useMenuDisplayer>
		</c:when>	
		
		<c:when test="${param.c_xitong=='H' }">
			<!-- ����ϵͳ-���Ĭ�ϵĸ��˵�ѡ���  -->
			<% 
				//num[j] = ("H1");			
				//j++; 
				num[j] = ("H2");			
				j++; 
				//num[j] = ("H3");			
				//j++; 
				num[j] = ("H5");			
				j++;
				net.sf.navigator.menu.PermissionsAdapter permissions7 = new SimplePermissionsAdapter(true,num);
				request.getSession().setAttribute("exampleAdapter", permissions7);
			%>
				<menu:useMenuDisplayer name="${param.MenuDisplayer }"   permissions="exampleAdapter">		
				<!-- 
				<menu:displayMenu name="H1" />
				 -->						 			 
				<menu:displayMenu name="H2" />
				<!-- 
				<menu:displayMenu name="H3" />
				-->
				<br> 
				<menu:displayMenu name="H5" />
				<br> 
				</menu:useMenuDisplayer>
		</c:when>	
		 			
		<c:when test="${param.c_xitong=='L' }">
			<!-- �ƻ���ϵͳ-���Ĭ�ϵĸ��˵�ѡ���  -->
			<% 
				//num[j] = ("L1");			
				//j++; 
				net.sf.navigator.menu.PermissionsAdapter permissions8 = new SimplePermissionsAdapter(true,num);
				request.getSession().setAttribute("exampleAdapter", permissions8);
			%>
				<menu:useMenuDisplayer name="${param.MenuDisplayer }"   permissions="exampleAdapter">		
				<!-- 
				<menu:displayMenu name="L1" />
				 -->						 			 
				<br> 
				</menu:useMenuDisplayer>
		</c:when>	
					
		</c:choose>			