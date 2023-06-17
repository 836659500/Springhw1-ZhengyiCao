<%@ page import="com.beaconfire.abpp.entity.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhengyi Cao
  Date: 2023/4/25
  Time: 0:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Class</title>
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
<table>
    <tr>
        <th>Course</th>
        <th>Course Code</th>
        <th>Department</th>
        <th>School</th>
        <th>Semester</th>
        <th>Course Description</th>
        <th>Course Capacity</th>
        <th>Current Enrollment Number</th>
        <th>is Active</th>
    </tr>

    <tr>
        <td>${requestScope.course.name}</td>
        <td>${requestScope.course.code}</td>
        <td>${requestScope.department.name}</td>
        <td>${requestScope.department.school}</td>
        <td>${requestScope.semester.name}</td>
        <td>${requestScope.course.description}</td>
        <td>${requestScope.eclass.capacity}</td>
        <td>${requestScope.eclass.enrollmentNum}</td>
        <c:choose>
            <c:when test="${requestScope.eclass.isActive == 1}">
                <td>Yes</td>
            </c:when>
            <c:otherwise>
                <td>No</td>
            </c:otherwise>
        </c:choose>
    </tr>
</table>

<br/>
<table>
    <tr>
        <th>Semester</th>
        <th>Start Date</th>
        <th>End Date</th>
    </tr>

    <tr>
        <td>${requestScope.semester.name}</td>
        <td>${requestScope.semester.startDate}</td>
        <td>${requestScope.semester.endDate}</td>
    </tr>
</table>

<br/>
<table>
    <tr>
        <th>Day of Week</th>
        <th>Start Time</th>
        <th>End Time</th>
    </tr>

    <tr>
        <td>${requestScope.lecture.dayOfTheWeek}</td>
        <td>${requestScope.lecture.startTime}</td>
        <td>${requestScope.lecture.endTime}</td>
    </tr>
</table>

<br/>
<table>
    <tr>
        <th>Professor</th>
        <th>Email</th>
        <th>Department</th>
        <th>School</th>
    </tr>

    <tr>
        <td>${requestScope.professor.firstName} ${requestScope.professor.lastName}</td>
        <td>${requestScope.professor.email}</td>
        <td>${requestScope.professorDepartment}</td>
        <td>${requestScope.professorSchool}</td>
    </tr>
</table>

<br/>
<table>
    <tr>
        <th>Classroom</th>
        <th>Building</th>
        <th>Capacity</th>
    </tr>

    <tr>
        <td>${requestScope.classroom.name}</td>
        <td>${requestScope.classroom.building}</td>
        <td>${requestScope.classroom.capacity}</td>
    </tr>
</table>

<br/>
<table>
    <tr>
        <th>Prerequisites</th>
    </tr>
    <c:forEach var="pre" items="${requestScope.pres}">
        <tr>
            <td>
                <a href="http://localhost:8080/class?classId=${pre.key}">${pre.value}</a>
            </td>
        </tr>
    </c:forEach>

    <tr>
    </tr>
</table>
</body>
</html>

