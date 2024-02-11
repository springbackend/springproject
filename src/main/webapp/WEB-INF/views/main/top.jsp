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
	.navbar {
	    margin: 0 auto; 
	    max-width: 960px; 
	}
        .navbar-container {
            margin: 0 auto; 
            max-width: 960px; 
        }
    .navbar-nav .nav-link {
        margin-right: 15px; 
    }

    .dropdown-menu .dropdown-item {
        margin-bottom: 3px;
    }

    .container {
        padding-left: 15px;
        padding-right: 15px;
    }
	td {
    text-align: center; 
    vertical-align: middle; 
	}
</style>
<body>
<nav class="navbar navbar-expand-lg bg-dark navbar-darkbg-dark navbar-dark">
    <div class="navbar-nav">
        <a class="nav-item nav-link" href="#">홈</a>
        <a class="nav-item nav-link" href="#">베스트</a>
        <a class="nav-item nav-link" href="#">세일</a>
        <a class="nav-item nav-link" href="#">추천</a>
        <!-- 드롭다운 메뉴 -->
        <div class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                카테고리
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
               <table>
            <tr>
               <td><a class="dropdown-item" href="#" style="font-weight: bold;">woman</a></td>
				<td><a class="dropdown-item" href="#" style="font-weight: bold;">man</a></td>
			</tr>
			<tr>
				<td><a class="dropdown-item" href="#">여성향수</a></td>
				<td><a class="dropdown-item" href="#">남성향수</a></td>
			</tr>
			</table>
            </div>
        </div>
    </div>
</nav>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>