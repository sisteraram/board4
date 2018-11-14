<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Register Page</h1>

<h3><sec:authentication property="principal"/></h3>



<hr/>
<h4><sec:csrfInput/></h4>
<div>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<button>ADMIN ONLY</button>
</sec:authorize>
</div>
<div>
<sec:authorize access="hasRole('ROLE_MEMBER')">
<button>MEMBER ONLY</button>
</sec:authorize>
</div>

</body>
</html>