<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="sellBuyListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>찾아오는 길</title>

	<link href="${context}/css/location.css" rel="stylesheet">
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
	<h3><strong>서울 구로구 경인로 557 신한은행 4층</strong></h3>
	
	<div class="container">
		<div id="map" style="width:100%;height:350px; margin-bottom: 50px"></div>
	</div>
	<div class="container text-center mg-b100">
	  <div class="row">
	    <div class="col-md-6">
	      <img id="locationimg" alt="도보이미지" src="/locationImg/walking_location.svg">
	    </div>
	    <div class="col-md-6 text-left">
			<strong>도보로 오시려면</strong> <br>
			<br><br>
			지번 : 구로동 606-4<br>
			우편번호 : 08216
	    </div>
	  </div>
	</div>
	<div class="container text-center mg-b100">
	  <div class="row">
	    <div class="col-md-6">
	      <img id="locationimg" alt="버스이미지" src="/locationImg/bus_location.svg">
	    </div>
	    <div class="col-md-6 text-left">
			<strong>버스로 오시려면</strong> <br>
			<br><br>
			지번 : 구로동 606-4<br>
			우편번호 : 08216
	    </div>
	  </div>
	</div>
	<div class="container text-center mg-b100">
	  <div class="row">
	    <div class="col-md-6">
	      <img id="locationimg" alt="지하철이미지" src="/locationImg/subway_location.svg">
	    </div>
	    <div class="col-md-6 text-left">
			<strong>지하철로 오시려면</strong> <br>
			<br><br>
			지번 : 구로동 606-4<br>
			우편번호 : 08216
	    </div>
	  </div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a3c4fcfa5a54d02d981e8713d261798"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	</script>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>