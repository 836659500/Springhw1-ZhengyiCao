<%--
  Created by IntelliJ IDEA.
  User: Zhengyi Cao
  Date: 2023/4/25
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Classes</title>
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
        <th>is Enrolled</th>
        <th>Setting</th>
        <th>Detail</th>
    </tr>
    <c:forEach var="wclass" items="${requestScope.classesInfo}">
        <tr>
        <c:forEach var="item"  items="${wclass}">
                <td>${item}</td>
        </c:forEach>
            <td>
                <c:choose>
                    <c:when test="${wclass[7] == 'Yes'}">
                        <form action="http://localhost:8080/applicationRequest" method="post">
                            <input type="hidden" name="courseCode" value="${wclass[1]}">
                            <input type="hidden" name="requestMethod" value="withdraw">
                            <button type="submit">Withdraw</button>
                        </form>
                    </c:when>
                <c:otherwise>
                    <form action="http://localhost:8080/applicationRequest" method="post">
                        <input type="hidden" name="courseCode" value="${wclass[1]}">
                        <input type="hidden" name="requestMethod" value="add">
                        <button type="submit">Add</button>
                    </form>
                </c:otherwise>
            </c:choose>
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
