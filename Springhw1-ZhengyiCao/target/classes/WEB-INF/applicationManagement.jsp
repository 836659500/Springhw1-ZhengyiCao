<%--
  Created by IntelliJ IDEA.
  User: Zhengyi Cao
  Date: 2023/4/26
  Time: 3:01
  To change this template use File | Settings | File Templates.
--%>
<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Application Management</title>
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
        <th>Student Id</th>
        <th>Class Id</th>
        <th>Student Name</th>
        <th>Course</th>
        <th>Course Code</th>
        <th>Semester</th>
        <th>Creation Time</th>
        <th>Request</th>
        <th>Status</th>
        <th>Feedback</th>
        <th>Approve</th>
        <th>Reject</th>
    </tr>
    <c:forEach var="appli" items="${requestScope.allApplicationsInfo}">
        <tr>
            <c:forEach var="item"  items="${appli}">
                <td>${item}</td>
            </c:forEach>
            <td>
                <form action="http://localhost:8080/applicationmanagement/approve" method="post">
                    <input type="hidden" name="studentId" value="${appli[0]}">
                    <input type="hidden" name="classId" value="${appli[1]}">
                    <button type="submit">Approve</button>
                </form>
            </td>
            <td>
                <form action="http://localhost:8080/applicationmanagement/reject" method="post">
                    <input type="hidden" name="studentId" value="${appli[0]}">
                    <input type="hidden" name="classId" value="${appli[1]}">
                    <button type="submit">Reject</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
