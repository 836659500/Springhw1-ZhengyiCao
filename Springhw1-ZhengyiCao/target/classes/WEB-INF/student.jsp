<%@ page import="com.beaconfire.abpp.entity.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhengyi Cao
  Date: 2023/4/24
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student</title>
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
<br/>
<c:set var="firstname" value="${sessionScope.user.firstName}" />
<c:set var="lastname" value="${sessionScope.user.lastName}" />
<h1> Welcome <c:if test="${sessionScope.isAdmin == 1}">Admin </c:if><c:out value="${firstname} ${lastname}" /></h1>
<h1 style="color: red; font-size: 30px">
    <c:if test="${requestScope.error == 1}">
        Adding class unsuccessfully!
    </c:if>
</h1>

<table>
    <tr>
        <th>Course</th>
        <th>Course Code</th>
        <th>Department</th>
        <th>School</th>
        <th>Semester</th>
        <th>Status</th>
        <th>Detail</th>
    </tr>


    <c:forEach var="aclass" items="${sessionScope.classes}">
        <tr>
            <td>${sessionScope.courses[aclass].name}</td>
            <td>${sessionScope.courses[aclass].code}</td>
            <td>${sessionScope.departments[aclass].name}</td>
            <td>${sessionScope.departments[aclass].school}</td>
            <td>${sessionScope.semesters[aclass].name}</td>
            <td>${sessionScope.student_classes[aclass].status}</td>
            <td>
                <form action="http://localhost:8080/class" method="get">
                    <input type="hidden" name="classId" value="${aclass.id}">
                    <button type="submit">Detail</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

