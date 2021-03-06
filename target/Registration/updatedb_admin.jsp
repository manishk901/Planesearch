<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script src="./js/lib/jQuery/jquery.min.js"></script>
<script src="./js/lib/bootstrap.min.js"></script>
<script src="./js/lib/jQuery/jquery.color-2.1.2.js"></script>
<script src="./js/lib/jQuery/jquery.validate.min.js"></script>
<link rel="stylesheet" href="./css/lib/bootstrap.min.css">
<c:if test="${sessionScope.userName == null}">
	<c:redirect url="Login.jsp"></c:redirect>
</c:if>
</head>
<body>

	<fmt:bundle basename="app">
		<fmt:message key="db.username" var="username">
		</fmt:message>
		<fmt:message key="db.url" var="url">
		</fmt:message>
		<fmt:message key="db.pwd" var="pwd">
		</fmt:message>
		<fmt:message key="db.driver" var="driver">
		</fmt:message>
		<sql:setDataSource var="dbsource" driver="${driver }" url="${url }"
			user="${username }" password="${pwd }" />
		<sql:update dataSource="${dbsource}" var="count">
            UPDATE registration SET name=?, password=?,city=?,bloodgroup=?,contact=?,street=?,district=?,area=?
            WHERE email=?;
          
           <sql:param value="${param.user}" />
			<sql:param value="${param.password}" />
			<sql:param value="${param. city}" />
			<sql:param value="${param.bloodgroup }"/>
			<sql:param value="${param.contact }"/>
			<sql:param value="${param.street }"/>
			<sql:param value="${param.district }"/>
			<sql:param value="${param.area }"/>
			<sql:param value="${param.email_param}" />
			
		</sql:update>

		<c:if test="${count>=1}">
			<font size="5" color='green'> Congratulations ! Data updated
				successfully.</font>
			<a href="display_user_details.jsp">Go Home</a>
			<a href="logout?name=${name}">Logout</a>
		</c:if>
	</fmt:bundle>
</body>
</html>