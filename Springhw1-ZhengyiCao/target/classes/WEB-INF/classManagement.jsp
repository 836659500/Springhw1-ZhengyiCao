<%--
  Created by IntelliJ IDEA.
  User: Zhengyi Cao
  Date: 2023/4/26
  Time: 2:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Class Management</title>
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
        <th>Department</th>
        <th>School</th>
        <th>Current Enrollment Number</th>
        <th>Course Capacity</th>
        <th>Semester</th>
        <th>isActive</th>
        <th>Operation</th>
        <th>Detail</th>
    </tr>
    <c:forEach var="wclass" items="${requestScope.classesManagementInfo}">
        <tr>
            <c:forEach var="item"  items="${wclass}">
                <td>${item}</td>
            </c:forEach>
            <td>
                <form action="http://localhost:8080/classManagement/classstatus" method="post">
                    <input type="hidden" name="courseCode" value="${wclass[1]}">
                    <button type="submit">Status Reverse</button>
                </form>
            </td>
            <td>
                <form action="http://localhost:8080/class1" method="get">
                    <input type="hidden" name="courseCode" value="${wclass[1]}">
                    <button type="submit">Detail</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
