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
    <link href="${context}/css/main.css" rel="stylesheet" >
    <script src="${context}/js/jquery-1.9.1.js"></script>

    <!-- owl.carousel -->
    <link href="${context}/css/owl.carousel.min.css" rel="stylesheet" >
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







<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="neckUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[0].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="ringUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[1].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="braceletUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[2].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="storageUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[3].PRODUCT_CATEGORY_CD}</c:set>

<c:set var="productManageUrl">${context}/work/product/retrieveProductListForManage.do</c:set>
<c:set var="statisticsForProductUrl">${context}/work/sell/retrieveStatisticsForProduct.do</c:set>
<c:set var="statisticsForStockUrl">${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=R</c:set>








<body>
<jsp:include page="../common/top.jsp"></jsp:include>

  <c:if test="${sessionScope.grade != 'A'}">
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
                <div class="banner_img"> <img src="${context}/css/images/banner_01.png" alt="#"> </div>
                <div class="banner_img"> <img src="${context}/css/images/banner_02.png" alt="#"> </div>
                <div class="banner_img"> <img src="${context}/css/images/banner_03.png" alt="#"> </div>
                <div class="banner_img"> <img src="${context}/css/images/banner_04.png" alt="#"> </div>
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
       	                 	 <c:forEach items="${dsEarList}" var="dsEarList">
			                     <div class="col-md-2">
			                        <a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${earUrl}')"><img src="${context}/earImg/${dsEarList.PRODUCT_IMAGE}" class="img-rounded" width="100%" height="100%"></a>
			                     </div>
			                  </c:forEach>
<%--                         <div class="img"><a href="#"><img src="${context}/css/images/01.jpg" alt="#"></a></div> --%>
                        <div class="item">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item2">
                        <div class="img"><a href="#"><img src="${context}/css/images/01.jpg" alt="#"></a></div>
                        <div class="item">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item3">
                        <div class="img"><a href="#"><img src="${context}/css/images/01.jpg" alt="#"></a></div>
                        <div class="item">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item4">
                        <div class="img"><a href="#"><img src="${context}/css/images/01.jpg" alt="#"></a></div>
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
                        <div class="img"><a href="#"><img src="${context}/css/images/01.jpg" alt="#"></a></div>
                        <div class="item_name">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item2">
                        <div class="img"><a href="#"><img src="${context}/css/images/01.jpg" alt="#"></a></div>
                        <div class="item_name">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item3">
                        <div class="img"><a href="#"><img src="${context}/css/images/01.jpg" alt="#"></a></div>
                        <div class="item_name">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>

                    <div class="item4">
                        <div class="img"><a href="#"><img src="${context}/css/images/01.jpg" alt="#"></a></div>
                        <div class="item_name">
                            <a href="#"><p class="item_name">제품명을 작성하세요</p></a>
                            <p class="item_ann">설명을 작성하세요</p>
                        </div>
                    </div>
                </div>               
                
            </div>
        </div>
    </div>
  </c:if>


<!--     관리자 페이지 입니다 -->
  <c:if test="${sessionScope.grade == 'A'}">
         <div class="container" style="margin-top: 10%; margin-bottom: 10%">
            <div class="row">
               <div class="col-md-4">
                   <a href="${productManageUrl}" class="btn btn-primary" style="width: 100%; height: 250px;" role="button">
                     <h1><span class="glyphicon glyphicon-list-alt" style="font-size: 80px; margin-top: 5%;"></span> <br/>재고관리</h1>
                  </a>
               </div>
               <div class="col-md-4">
                   <a href="${statisticsForProductUrl}" class="btn btn-danger" style="width: 100%; height: 250px;" role="button">
                     <h1><span class="glyphicon glyphicon-signal" style="font-size: 80px; margin-top: 5%;"></span> <br/>매출통계</h1>
                   </a>
               </div>
               <div class="col-md-4">
                   <a href="${statisticsForStockUrl}" class="btn btn-info" style="width: 100%; height: 250px;" role="button">
                     <h1><span class="glyphicon glyphicon-eye-open" style="font-size: 80px; margin-top: 5%;"></span> <br/>재고현황</h1>
                    </a>
               </div>
            </div>
         </div>
  </c:if>
    <jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>