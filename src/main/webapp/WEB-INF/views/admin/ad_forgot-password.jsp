<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 비밀번호 찾기 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="../../../resources/ad_assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../../resources/ad_assets/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a0fcc69da7.js" crossorigin="anonymous"></script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <!-- <div class="col-lg-6 d-none d-lg-block bg-password-image"></div> -->
                            <img class="col-lg-6 d-none d-lg-block " 
                            src="../../../resources/ad_assets/img/undraw_Web_search_re_efla.svg" alt="..." style="
                            padding-right: 0px; left: 23px; height: 300px;
                            margin-top: 15px;">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">관리자 비밀번호 찾기</h1>
                                        <!-- <p class="mb-4">We get it, stuff happens. Just enter your email address below
                                            and we'll send you a link to reset your password!</p> -->
                                    </div>
                                    <form class="user" action="adLogin.do">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="이메일을 입력해주세요">
                                        </div>
                                        <input type="submit" class="btn btn-primary btn-user btn-block" value="비밀번호 초기화하기"></input>
                                        <!-- <a href="login.html" class="btn btn-primary btn-user btn-block">
                                            비밀번호 초기화하기
                                        </a> -->
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="adJoin.do">계정 생성하기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="adLogin.do">로그인하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../../../resources/ad_assets/vendor/jquery/jquery.min.js"></script>
    <script src="../../../resources/ad_assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../../resources/ad_assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../../resources/ad_assets/js/sb-admin-2.min.js"></script>

</body>

</html>