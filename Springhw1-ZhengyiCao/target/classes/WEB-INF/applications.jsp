<%--
  Created by IntelliJ IDEA.
  User: Zhengyi Cao
  Date: 2023/4/25
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Application</title>
</head>
<body>
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
    th, td {
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: lightgray;
    }
</style>

<a href="http://localhost:8080/logout">Logout</a>
<a href="http://localhost:8080/student">Home</a>
<a href="http://localhost:8080/classes">Classes</a>
<a href="http://localhost:8080/applications">Applications</a>
<c:if test="${sessionScope.isAdmin == 1}">
    <a href="http://localhost:8080/studentprofile">Student Profile</a>
    <a href="http://localhost:8080/classmanagement">Class Management</a>
    <a href="http://localhost:8080/applicationmanagement">Application Management</a>
</c:if>
<%--course name, course code, department name, school name, current enrollment number, capacity,  isEnrolled.--%>
<table>
    <tr>
        <th>Course</th>
        <th>Course Code</th>
        <th>Semester</th>
        <th>Creation Time</th>
        <th>Request</th>
        <th>Status</th>
        <th>Feedback</th>
        <th>Operation</th>
    </tr>
    <c:forEach var="appli" items="${requestScope.applicationsInfo}">
        <tr>
            <c:forEach var="item"  items="${appli}">
                <td>${item}</td>
            </c:forEach>
            <td>
                <form action="http://localhost:8080/applicationRequest" method="post">
                    <input type="hidden" name="courseCode" value="${appli[1]}">
                    <input type="hidden" name="requestMethod" value="cancel">
                    <button type="submit">Cancel</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
