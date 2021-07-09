<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>빌려줘! 홈짐 -  자주묻는 질문</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/logo.png" />
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/resources/assets/css/animate.css" />
    <link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/main.css" />

</head>

<body>
    <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <%@ include file="/WEB-INF/views/includes/header.jsp" %>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">자주 묻는 질문</h1>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Faq Area -->
    <div class="faq section">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-general" type="button" role="tab" aria-controls="nav-general"
                                aria-selected="true">홈짐</button>
                            <button class="nav-link" id="nav-admission-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-admission" type="button" role="tab" aria-controls="nav-admission"
                                aria-selected="false">트레이너</button>
                            <button class="nav-link" id="nav-career-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-career" type="button" role="tab" aria-controls="nav-career"
                                aria-selected="false">회원정보</button>
                                <button class="nav-link" id="nav-notice-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-notice" type="button" role="tab" aria-controls="nav-service"
                                aria-selected="false">서비스이용 및 기타</button> </button>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-general" role="tabpanel">
                            <div class="accordion" id="accordionExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne1">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne1" aria-expanded="true"
                                            aria-controls="collapseOne1">
                                            <span>홈짐을 예약하고 싶은데 어떻게 해야 하나요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseOne1" class="accordion-collapse collapse show"
                                        aria-labelledby="headingOne1" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>1. 지역에서 홈짐을 선택해주세요.<br>
                                                2. 홈짐 리스트에서 원하시는 홈짐을 선택해주세요.<br>
                                                3. 홈짐 내용을 확인 후, 예약을 원하시면 예약하기 버튼을 눌러주세요.<br>
                                                4. 예약을 위해 폼 작성을 완료하고, 예약을 진행해주세요.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo2">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo2"
                                            aria-expanded="false" aria-controls="collapseTwo2">
                                            <span>홈짐 위치를 자세하게 알 수는 없나요?</span>
                                            <i class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseTwo2" class="accordion-collapse collapse"
                                        aria-labelledby="headingTwo2" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>* 원하시는 홈짐 위치를 정하신 후에 예약하기를 완료하시면 홈짐의 자세한 위치를 문자 서비스로 전송해 드리고 있습니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree3">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseThree3"
                                            aria-expanded="false" aria-controls="collapseThree3">
                                            <span>등록된 홈짐 정보를 믿을 수 있나요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseThree3" class="accordion-collapse collapse"
                                        aria-labelledby="headingThree3" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>많은 사람들이 이용해보고 남은 후기들을 이용하시여 가깝고 시설좋은 홈짐을 이용해보세요<br>
                                            아직까지는 빌려줘 홈짐! 에서 수집한 정보가 많기 때문에, 간혹 잘못된 정보가 있을 수 있어요<br>
                                            따라서 방문하시기 전에 전화상담 하시면 더욱 정확한 정보를 확인 하실 수 있습니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFour4">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseFour4"
                                            aria-expanded="false" aria-controls="collapseFour4">
                                            <span>나만의 홈짐을 자랑하고 싶은데, 어디에 올리면 될까요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseFour4" class="accordion-collapse collapse"
                                        aria-labelledby="headingFour4" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>
                                           		홈짐 게시판에 들어가시면 홈짐 등록하기가 있습니다.<br>
                                           		 자신의 취향에 맞게 꾸미신 홈짐을 많은 사람들이 구경할 수 있게 많은 이용 부탁드립니다!🙋‍♀️                                   	</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-admission" role="tabpanel"
                            aria-labelledby="nav-admission-tab">
                            <div class="accordion" id="accordionExample2">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne11">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne11" aria-expanded="true"
                                            aria-controls="collapseOne11">
                                            <span>좋은 트레이너 선생님을 고르는 방법이 있나요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseOne11" class="accordion-collapse collapse show"
                                        aria-labelledby="headingOne11" data-bs-parent="#accordionExample2">
                                        <div class="accordion-body">
                                            <p>
                                            	저희 빌려줘! 홈짐💪🏼 은 모든 트레이너 선생님들은 많은 경험과 경력들을 고루 갖추신  트레이너 선생님들이 참여하고 계세요! <br>
                                            	회원님께서 원하시는 운동 방향성에 맞춰 
                                            	좋은 트레이너 선생님을 고르세요.</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo22">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo22"
                                            aria-expanded="false" aria-controls="collapseTwo22">
                                            <span>등록된 트레이너는 모두 믿을 수 있나요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseTwo22" class="accordion-collapse collapse"
                                        aria-labelledby="headingTwo22" data-bs-parent="#accordionExample2">
                                        <div class="accordion-body">
                                            <p>등록된 트레이너 정보는 모두 트레이너 본인이 직접 올린 정보입니다.<br>
                   	                   		 빌려줘!홈짐에서는 사전에 올바른 정보인지 검토를 하고 있지만, <br>
                   	                   		 간혹 트레이너님의 착오나 실수로 인해 잘못된 정보가 올라갔을 수 있어요😥<br>
                                        	하단페이지 "잘못된 정보 신고하기"를 통해 접수해주시면 빠르게 조치하도록 할께요!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree33">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseThree33"
                                            aria-expanded="false" aria-controls="collapseThree33">
                                            <span>트레이너님과 연락이 되지 않아요.</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseThree33" class="accordion-collapse collapse"
                                        aria-labelledby="headingThree33" data-bs-parent="#accordionExample2">
                                        <div class="accordion-body">
                                            <p>코치님은 레슨 시간엔 전화 통화가 어렵기 때문에 문자를 남겨주시면 좋아요.<br>
                                            	그럼에도 계속 연락이 되지 않는다면, "잘못된 정보 신고하기" 또는 "고객센터"접수를 통해<br>
                                            	빌려줘!홈짐에 알려주세요.<br>
                                        		코치님과 직접 연락이 되시도록 안내 도와드릴께요!👏</p>
                                        </div>
                                    </div>
                                </div>
                             <!--    <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFour44">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseFour44"
                                            aria-expanded="false" aria-controls="collapseFour44">
                                            <span>1회 체험 신청을 취소(환불)할 수 있나요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseFour44" class="accordion-collapse collapse"
                                        aria-labelledby="headingFour44" data-bs-parent="#accordionExample2">
                                        <div class="accordion-body">
                                            <p>[내정보-1회 체험 신청 내역]메뉴에서 체험레슨 신청 취소/환불이 가능하며, 취소/환불 정책은 다음과 같습니다<br>
                                            -이용 일정 협의 전:100% 환불<br>
                                        -이용일정 2일전까지: 취소 수수료 10% 공제<br>
                                    -이용 일정 당일 또는 구매 14일 후: 취소불가</p>

                                        </div>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-courses" role="tabpanel" aria-labelledby="nav-courses-tab">
                            <div class="accordion" id="accordionExample3">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne111">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne111" aria-expanded="true"
                                            aria-controls="collapseOne111">
                                            <span>예약을 어떻게 하는지 알고 싶어요.</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseOne111" class="accordion-collapse collapse show"
                                        aria-labelledby="headingOne111" data-bs-parent="#accordionExample3">
                                        <div class="accordion-body">
                                            <p> 트레이너 선생님과 실시간으로   1:1 채팅을 하실 수 있어요!<br>
                                            	내가 원하는 동네의 트레이너 선생님을 검색하신 후,<br>
                                            	받고자 하시는 트레이너 선생님께 바로 문의해보세요!
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo222">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo222"
                                            aria-expanded="false" aria-controls="collapseTwo222">
                                            <span>Diversity training programs, curriculum understandable</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseTwo222" class="accordion-collapse collapse"
                                        aria-labelledby="headingTwo222" data-bs-parent="#accordionExample3">
                                        <div class="accordion-body">
                                            <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus
                                                terry richardson ad squid. 3 wolf moon officia aute, non cupidatat
                                                skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                                Brunch 3 wolf moon tempor.</p>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis
                                                repellat autem dolor expedita minima quidem vero ipsa ea tempore dolorem
                                                nobis eius, modi molestiae dignissimos assumenda aliquid molestias
                                                adipisci veritatis!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree333">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseThree333"
                                            aria-expanded="false" aria-controls="collapseThree333">
                                            <span>Learn everywhere, everytime on devices</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseThree333" class="accordion-collapse collapse"
                                        aria-labelledby="headingThree333" data-bs-parent="#accordionExample3">
                                        <div class="accordion-body">
                                            <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus
                                                terry richardson ad squid. 3 wolf moon officia aute, non cupidatat
                                                skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                                Brunch 3 wolf moon tempor.</p>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis
                                                repellat autem dolor expedita minima quidem vero ipsa ea tempore dolorem
                                                nobis eius, modi molestiae dignissimos assumenda aliquid molestias
                                                adipisci veritatis!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFour444">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseFour444"
                                            aria-expanded="false" aria-controls="collapseFour444">
                                            <span>Brightcation promotion programs for outstanding students</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseFour444" class="accordion-collapse collapse"
                                        aria-labelledby="headingFour444" data-bs-parent="#accordionExample3">
                                        <div class="accordion-body">
                                            <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus
                                                terry richardson ad squid. 3 wolf moon officia aute, non cupidatat
                                                skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                                                Brunch 3 wolf moon tempor.</p>

                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis
                                                repellat autem dolor expedita minima quidem vero ipsa ea tempore dolorem
                                                nobis eius, modi molestiae dignissimos assumenda aliquid molestias
                                                adipisci veritatis!</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-career" role="tabpanel" aria-labelledby="nav-career-tab">
                            <div class="accordion" id="accordionExample4">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne1111">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne1111" aria-expanded="true"
                                            aria-controls="collapseOne1111">
                                            <span>아아디,비밀번호가 기억나지 않아요.</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseOne1111" class="accordion-collapse collapse show"
                                        aria-labelledby="headingOne1111" data-bs-parent="#accordionExample4">
                                        <div class="accordion-body">
                                            <p>pc오른쪽 위의 [로그인]아래 [아이디찾기][비밀번호찾기]를 통해 확인이 가능하며, 
                                            <br>임시 비밀번호의 경우 회원가입시 등록하신 메일로 발송이됩니다!<br>
                                            	가입시 기재한 메일 주소가 기억나지 않으시거나 오류가 발생하는 경우, 고객센터로 문의 주시면 도움 드리겠습니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo2222">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo2222"
                                            aria-expanded="false" aria-controls="collapseTwo2222">
                                            <span>회원탈퇴를 하고 싶어요</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseTwo2222" class="accordion-collapse collapse"
                                        aria-labelledby="headingTwo2222" data-bs-parent="#accordionExample4">
                                        <div class="accordion-body">
                                            <p>혹여 빌려줘!홈짐이 불편하셨던 점이 있으시다면 문의 접수를 부탁드립니다!
                                            	 아래는 회원탈퇴 방법입니다😭<br>
                                            	로그인 후,&nbsp;상단 회원님 성함 > 개인정보 수정 > 비밀번호 최하단 [탈퇴하기] 버튼을 통해 탈퇴하실 수 있습니다!<br>
                                            *회원님의 개인정보를 위해 직접 탈퇴만 가능합니다!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree3333">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseThree3333"
                                            aria-expanded="false" aria-controls="collapseThree3333">
                                            <span>회원정보를 변경하려면 어떻게 해야하나요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseThree3333" class="accordion-collapse collapse"
                                        aria-labelledby="headingThree3333" data-bs-parent="#accordionExample4">
                                        <div class="accordion-body">
                                            <p>홈페이지 오른쪽 위의 회원님 성함 > 개인정보수정에서 변경이 가능합니다!<br>
                                                *아이디는 변경이 불가합니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFour4444">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseFour4444"
                                            aria-expanded="false" aria-controls="collapseFour4444">
                                            <span>외국인이나 해외에 거주하는 사람도 회원가입 할 수 있나요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseFour4444" class="accordion-collapse collapse"
                                        aria-labelledby="headingFour4444" data-bs-parent="#accordionExample4">
                                        <div class="accordion-body">
                                            <p>빌려줘! 홈짐은 외국인, 해외거주자 고객님들도 대한민국에서 활동하시는 기간이 있으신 경우에만 가입이 가능합니다.<br>
                                            아쉽게도 해외 홈짐관련 정보는 불가한 점 참고 부탁드릴께요!</p>

                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-notice" role="tabpanel" aria-labelledby="nav-notice-tab">
                            <div class="accordion" id="accordionExample5">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne11111">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne11111" aria-expanded="true"
                                            aria-controls="collapseOne11111">
                                            <span>내가 예약한 홈짐은 어떻게 확인하나요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseOne11111" class="accordion-collapse collapse show"
                                        aria-labelledby="headingOne11111" data-bs-parent="#accordionExample5">
                                        <div class="accordion-body">
                                            <p>로그인 후 홈페이지 상단 게시판 > 대여한 홈짐 목록에서 해당 홈짐을 상세보기를 통해 확인 가능합니다<br>
                                              	비회원이신 경우에는 고객센터에서 가능합니다.😊<p>

                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo22222">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo22222"
                                            aria-expanded="false" aria-controls="collapseTwo22222">
                                            <span>문자를 받고 싶지 않은데 수신거부는 어떻게 하나요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseTwo22222" class="accordion-collapse collapse"
                                        aria-labelledby="headingTwo22222" data-bs-parent="#accordionExample5">
                                        <div class="accordion-body">
                                            <p>홈페이지 상담 회원님 성함 > 개인정보 수정에서 SMS 수신여부를 수신안함으로 선택 후 [수정하기]<br>
                                            버튼을 누르시면 반영됩니다. 직접 변경이 어려우신 경우 고객센터에 문의 접수해주세요!</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree33333">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseThree33333"
                                            aria-expanded="false" aria-controls="collapseThree33333">
                                            <span>빌려줘! 홈짐은 어떤 회사인가요? 믿고 이용할 수 있는 곳인가요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseThree33333" class="accordion-collapse collapse"
                                        aria-labelledby="headingThree33333" data-bs-parent="#accordionExample5">
                                        <div class="accordion-body">
                                            <p>빌려줘!홈짐은 사람을 소중히 하는 마음으로💕  국내에서 운동을 좋아하시는 분들을 위해 꼼꼼한 트레이너 및 홈짐 장소를 구색하여 제공합니다.<br>
                                            홈짐을 걱정없이 이용하시기 위해 직원들이 확인에 또 확인을 하고 홈짐에 문제가 발생하는 경우를 대비해 고객만족센터를 운영하고 있습니다<br>
                                        "우리가 곧 회원이다"라는 신념으로 좋은 홈짐 장소와 트레이너분들을 선택하고 검수하며,<br> 문제 발생 시 회원님의 편에서 조치를 드리고 있으니 안심하고 이용해 주시기 바랍니다.😊</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFour44444">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseFour44444"
                                            aria-expanded="false" aria-controls="collapseFour44444">
                                            <span>회원가입은 무료인가요?</span><i
                                                class="lni lni-chevron-down"></i>
                                        </button>
                                    </h2>
                                    <div id="collapseFour44444" class="accordion-collapse collapse"
                                        aria-labelledby="headingFour44444" data-bs-parent="#accordionExample5">
                                        <div class="accordion-body">
                                            <p>빌려줘! 홈짐은 지역 상관없이 회원가입은 무료입니다!
                                            	<br>회원가입 후 다양한 혜택과 장소를 만나보세요.🐱‍🏍</p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ End Faq Area -->
    <div></div>

     <!-- Start Footer Area -->
     <footer class="footer style2">
        <!-- Start Footer Bottom -->
        <div class="footer-bottom">
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-md-6" style="text-align: start;">
                            <div class="logo">
                                <br><br>
                                <a href="/index.jsp"><img src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
                            </div>
                        </div>
                        <div class="col-md-6" style="text-align: end;">
                            <p>
                                <br>
                                <a href="faq.html"> 자주묻는 질문</a>
                                <br>
                                서울특별시 서초구 강남대로 459 (서초동, 백암빌딩) 403호<br>
                                (주) 빌려줘!홈짐 | 문의 02-123-1234 | 사업자등록번호 123-12-12345
                                <br>© 2021. All Rights Reserved.
                            </p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/ End Footer Area -->

        <!--/ End Footer Middle -->
        <!-- Start Footer Bottom -->
        <div class="footer-bottom">
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-12">
                            <div class="left">
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Footer Middle -->
    </footer>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="/resources/assets/js/bootstrap.min.js"></script>
    <script src="/resources/assets/js/count-up.min.js"></script>
    <script src="/resources/assets/js/wow.min.js"></script>
    <script src="/resources/assets/js/tiny-slider.js"></script>
    <script src="/resources/assets/js/glightbox.min.js"></script>
    <script src="/resources/assets/js/main.js"></script>
</body>