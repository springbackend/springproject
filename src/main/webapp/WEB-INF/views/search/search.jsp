<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .input-group .dropdown-menu {
        width: 100%; /* 드롭다운의 넓이를 input-group의 넓이와 동일하게 설정 */
    }
</style>
<body>
<div class="container mt-3">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="input-group">
                <input type="text" class="form-control dropdown-toggle" data-toggle="dropdown" placeholder="Search">
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">검색어</a>
                </div>
                <div class="input-group-append">
                    <button class="btn btn-outline-primary" type="button" id="button-search">Search</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>