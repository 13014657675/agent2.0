<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ include file="/tool/common/taglib.jsp"%>
<sql:query var="q1" dataSource="${db_mssql }" sql=" exec p_fileRead ${param.c_no },'${sessionScope.c_jobnumber }' " >
</sql:query>
<center>
<iframe name="resource" src="../../../upload/file/${fn:trim(q1.rows[0].c_save) }" width="100%" height="100%" scrolling="auto" frameborder="0">
</iframe>
</center>

