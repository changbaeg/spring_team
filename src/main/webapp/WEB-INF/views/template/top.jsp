<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>MVC-Test</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  </head>
  <body>
    <!--상단메뉴-->
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6">
          <img
            src="/images/img_chania.jpg"
            class="img-thumbnail"
            alt="Cinque Terre"
            width="400px" height="200px"
          />
        </div>
                <div class="col-sm-6"><h1 style='margin:4rem'>Homepage</h1></div> 
    </div>
      <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link active" href="/">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            data-bs-toggle="dropdown"
            href="#">팀원</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/team/list">팀원 목록</a></li>
            <li><a class="dropdown-item" href="/team/create">팀원 생성</a></li>
          </ul>
        </li>

        <li class="nav-item"><a class="nav-link" href="#">Menu</a></li>
      </ul>
    </div>