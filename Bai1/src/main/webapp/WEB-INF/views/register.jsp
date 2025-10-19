<%@ page language="java" contentType="text/html; UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f9f9f9;
        }

        .form-container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .gender-group {
            display: flex;
            gap: 15px;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn-back {
            background-color: #6c757d;
            color: white;
        }

        .btn-register {
            background-color: #007bff;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>REGISTRATION EMPLOYEE</h2>

    <%--@elvariable id="employee" type="java"--%>
    <form:form method="post"  action="${pageContext.request.contextPath}/save" modelAttribute="employee">
        <form:hidden path="id"/>

        <div class="form-group">
            <label>First Name</label>
            <form:input path="firstName" placeholder="First Name"/>
        </div>

        <div class="form-group">
            <label>Last Name</label>
            <form:input path="lastName" placeholder="Last Name"/>
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email" type="email" placeholder="Email"/>
        </div>

        <div class="form-group">
            <label>Date of Birth</label>
            <form:input path="dateOfBirth" type="date"/>
        </div>

        <div class="form-group">
            <label>Phone number</label>
            <form:input path="phone" placeholder="Phone number"/>
        </div>

        <div class="form-group">
            <label>Gender</label>
            <div class="gender-group">
                <form:radiobutton path="gender" value="MALE"/> Male
                <form:radiobutton path="gender" value="FEMALE"/> Female
            </div>
        </div>

        <div class="button-group">
            <a href="${pageContext.request.contextPath}/" class="btn btn-back">Back</a>
            <button type="submit" class="btn btn-register">Register</button>
        </div>
    </form:form>
</div>
</body>
</html>