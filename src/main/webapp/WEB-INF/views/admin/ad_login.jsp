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

    <title>관리자 로그인 페이지</title>

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
                            <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
                            <img class="col-lg-6 d-none d-lg-block " 
                            src="../../../resources/ad_assets/img/undraw_secure_files_re_6vdh.svg" alt="..." style="
                            padding-right: 0px; left: 23px;">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">관리자 로그인</h1>
                                    </div>
                                    <form class="user" action="/message/msgMain.do" method="post">
                                        <!-- <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="exampleInputEmail1" aria-describedby="emailHelp"
                                                placeholder="이메일을 입력해주세요">
                                        </div> -->
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                name="memberId" aria-describedby="emailHelp"
                                                placeholder="아이디를 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                name="password" placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">아이디 저장하기</label>
                                            </div>
                                        </div>
                                        <input type="submit" class="btn btn-primary btn-user btn-block" value="로그인하기"></input>
                                        <!-- <a href="ad_index.do" class="btn btn-primary btn-user btn-block">
                                            로그인하기
                                        </a> -->
                                        <!-- <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a> -->
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="adForgotPassword.do">비밀번호 찾기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="adJoin.do">계정 생성하기</a>
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