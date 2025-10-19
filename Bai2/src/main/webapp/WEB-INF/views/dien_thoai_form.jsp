<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Điện Thoại</title>
    <style>
        body {
            font-family: "Segoe UI", Roboto, Arial;
            background: linear-gradient(135deg, #e3f2fd, #bbdefb);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 14px;
            width: 420px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            animation: fadeIn 0.4s ease;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        h2 {
            text-align: center;
            color: #1565c0;
            margin-bottom: 25px;
            letter-spacing: 0.5px;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus, select:focus {
            border-color: #1976d2;
            box-shadow: 0 0 5px rgba(25, 118, 210, 0.4);
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #1976d2;
            border: none;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.25s;
        }

        button:hover {
            background: #0d47a1;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #555;
            text-decoration: none;
            font-size: 15px;
        }

        a:hover {
            color: #1565c0;
        }

        .error {
            display: block;
            color: #d32f2f;
            font-size: 13px;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <%--@elvariable id="dienThoai" type="java"--%>
    <form:form method="post" action="/add" modelAttribute="dienThoai" enctype="multipart/form-data">
        <h2>📱 Thêm Điện Thoại</h2>

        <label>Tên điện thoại:</label>
        <form:input path="tenDT" placeholder="Nhập tên điện thoại" />
        <form:errors path="tenDT" cssClass="error"/>

        <label>Năm sản xuất:</label>
        <form:input path="namSX" placeholder="Nhập năm sản xuất" type="number"  />
        <form:errors path="namSX" cssClass="error"/>

        <label>Cấu hình:</label>
        <form:input path="cauHinh" placeholder="Nhập cấu hình" maxlength="255"/>
        <form:errors path="cauHinh" cssClass="error"/>

        <label>Giá (VNĐ):</label>
        <form:input path="gia" placeholder="Nhập giá" type="number" min="0"/>
        <form:errors path="gia" cssClass="error"/>

        <label>Nhà cung cấp:</label>
        <form:select path="nhaCungCap.maNCC">
            <form:option value="" label="-- Chọn nhà cung cấp --"/>
            <form:options items="${nccs}" itemValue="maNCC" itemLabel="tenNCC"/>
        </form:select>
        <form:errors path="nhaCungCap" cssClass="error"/>

        <label>Hình ảnh:</label>
        <input type="file" name="file" accept=".png,.jpg,.jpeg"/>
        <c:if test="${not empty fileError}">
            <span class="error">${fileError}</span>
        </c:if>

        <button type="submit">Thêm điện thoại</button>
        <a href="/">← Quay lại danh sách</a>
    </form:form>
</div>

</body>
</html>
