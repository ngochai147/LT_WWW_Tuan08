<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .top-bar {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 10px;
            gap: 10px;
        }

        .top-bar input[type="text"] {
            padding: 5px;
            width: 200px;
        }

        .top-bar button, .top-bar a {
            padding: 6px 12px;
            background-color: #007bff;
            color: #fff;
            border: none;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .top-bar button:hover, .top-bar a:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .action-link a {
            margin-right: 10px;
            color: #007bff;
            text-decoration: none;
        }

        .action-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>EMPLOYEE LIST</h2>

<div class="top-bar">
    <form action="/search" method="get">
        <input type="text" name="keyword" placeholder="Search..."/>
        <button style="background:gray;padding:10px" type="submit">Search</button>
    </form>
    <a href="${pageContext.request.contextPath}/show-form">Add Employee</a>
</div>

<table>
    <thead>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Gender</th>
        <th>Date of birth</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="emp" items="${employees}">
        <tr>
            <td>${emp.firstName}</td>
            <td>${emp.lastName}</td>
            <td>${emp.gender}</td>
            <td>${emp.dateOfBirth}</td>
            <td>${emp.email}</td>
            <td>${emp.phone}</td>
            <td class="action-link">
                <a href="/update/${emp.id}">Update</a>
                <a href="/delete/${emp.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
