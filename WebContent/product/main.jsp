<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="description" content="main.jsp">

    <link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200&display=swap"
    rel="stylesheet"
 />
    <link rel="stylesheet" href="${context}/css/main.css">
    <script src="${context}/js/jquery-1.9.1.js"></script>

    <!-- owl.carousel -->
    <link rel="stylesheet" href="${context}/css/owl.carousel.min.css">
    <script src="${context}/js/owl.carousel.min.js"></script>

    <!-- popup -->
    <script src="${context}/js/jquery.cookie.js"></script>
    <script>
        $(function () {
           //쿠키("popup")의 값이 'none'이면 id 값이 인 요소를 숨김니다.
           if ($.cookie('popup') == 'none') {
              $('#modal').hide();
           }
           var $expireChk = $('#expireChk');
           $('.closeBtn').on('click', closePop);
           function closePop() {
              if ($expireChk.is(':checked')) {
                 $.cookie('popup', 'none', {expires: 3, path: '/'});
              }
              $('#modal').fadeOut('fast');
           }
        });
    </script>

    <title>JEWELL</title>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

    <!-- 팝업 -->
    <div id="modal">
        <div class="modal_up">
            <div class="uptitle">
               <span class="pop_title">
                   JEWELL 설날 연휴영업 안내
               </span>
            </div>
            <div class="upbody">
               <span class="pop_announce">
                    2023년 설 연휴 기간 영업 일정을 안내해드립니다. <br><br><br>
               </span> 

               <span class="pop_day_title">                
                    - 연휴 기간 영업 일정 - <br>
               </span>
               1월 20일 (금) - 정상 운영<br>
               1월 23일,24일 (월,화) - 휴무<br>
               1월 25일(수) - 정상 운영<br><br>
               

               <span class="pop_announce">               
                    매장 방문 및 이용에 참고 부탁드리며,<br>
                    행복하고 즐거운 설 연휴 되시길 바랍니다.<br>
                    감사합니다.
               </span>
            </div>
            <p class="closewrap">
                <input type="checkbox" name="expireChk" id="expireChk" />
                <label for="expireChk">3일동안 이 창 열지 않기</label>
                <button class="closeBtn">닫기</button>
            </p>
        </div>
    </div>


    <!-- 배너 -->
    <div class="con">
        <div class="banner">
            <div class="owl-carousel">
                <div class="banner_img"> <img src="/css/images/banner_01.png" alt="#"> </div>
                <div class="banner_img"> <img src="/css/images/banner_02.png" alt="#"> </div>
                <div class="banner_img"> <img src="/css/images/banner_03.png" alt="#"> </div>
                <div class="banner_img"> <img src="/css/images/banner_04.png" alt="#"> </div>
                <!-- 이미지 배너 사이즈 맞게 수정 예정 -->
            </div>


            <script>
                var owl = $('.owl-carousel');
                owl.owlCarousel({
                    items:1,
                    loop:true,
                    margin:0,
                    autoplay:true,
                    autoplayTimeout:3000,
                    autoplayHoverPause:true
                });
            </script>
        </div>


        <!-- 콘텐츠-BEST -->
        <div class="content">
            <div class="best_group">
                <div class="group_name">
                    <p class="con_name">BEST</p>
                </div>

                <div class="inner_group">
                    <div class="item1">
                        <div class="img"><a href="#"><img src="/css/images/01.jpg" alt="#"></a></div>
                        <div class="item">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item2">
                        <div class="img"><a href="#"><img src="/css/images/01.jpg" alt="#"></a></div>
                        <div class="item">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item3">
                        <div class="img"><a href="#"><img src="../css/images/01.jpg" alt="#"></a></div>
                        <div class="item">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item4">
                        <div class="img"><a href="#"><img src="/css/images/01.jpg" alt="#"></a></div>
                        <div class="item">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>
                </div>                
                
            </div>
            

            <!-- 콘텐츠-관심있는 제품 -->
            <div class="best_group">
                <div class="group_name">
                    <p class="con_name">관심있는 상품</p>
                </div>

                <div class="inner_group">
                    <div class="item1">
                        <div class="img"><a href="#"><img src="/css/images/01.jpg" alt="#"></a></div>
                        <div class="item_name">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item2">
                        <div class="img"><a href="#"><img src="/css/images/01.jpg" alt="#"></a></div>
                        <div class="item_name">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item3">
                        <div class="img"><a href="#"><img src="/css/images/01.jpg" alt="#"></a></div>
                        <div class="item_name">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item4">
                        <div class="img"><a href="#"><img src="/css/images/01.jpg" alt="#"></a></div>
                        <div class="item_name">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>
                </div>               
                
            </div>
        </div>
    </div>
    <jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>