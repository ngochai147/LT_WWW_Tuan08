<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách điện thoại</title>
    <style>
        body {
            margin: 40px;
            background: #f9f9f9;
        }

        h2 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            vertical-align: middle;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        td img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid #ddd;
        }

        a.btn {
            padding: 8px 12px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a.btn:hover {
            background: #0056b3;
        }

        form {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        select, button {
            padding: 8px;
        }
    </style>
</head>
<body>
<h2>Danh sách điện thoại</h2>
<form method="get" action="/">
    <select name="ncc" onchange="this.form.submit()">
        <option value="" ${nccId == null ? "selected" : ""}>-- Tất cả nhà cung cấp --</option>
        <c:forEach var="ncc" items="${nccs}">
            <option value="${ncc.maNCC}" ${ncc.maNCC == nccId ? "selected" : ""}>
                    ${ncc.tenNCC}
            </option>
        </c:forEach>
    </select>
    <a href="/add" class="btn">+ Thêm điện thoại</a>
</form>


<table>
    <thead>
    <tr>
        <th>Ảnh</th>
        <th>Tên điện thoại</th>
        <th>Năm SX</th>
        <th>Cấu hình</th>
        <th>Giá</th>
        <th>Nhà cung cấp</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="dt" items="${list}">
        <tr>
            <td>
                <img src="/images/${dt.hinhAnh}"
                     alt="${dt.tenDT}"
                     width="100"
                     height="100"
                     style="object-fit: cover;"
                     onerror="this.src='/images/no-image.jpg';">

            </td>
            <td>${dt.tenDT}</td>
            <td>${dt.namSX}</td>
            <td>${dt.cauHinh}</td>
            <td>${dt.gia}</td>
            <td>${dt.nhaCungCap.tenNCC}</td>
            <td style=""><a href="/delete/${dt.maDT}" class="btn" style="background:red;">Xóa</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
