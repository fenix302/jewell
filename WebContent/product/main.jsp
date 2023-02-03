<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="main.jsp">
<title>JEWELL</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>

<style type="text/css">
img{
	cursor: pointer;
}
a{
	text-decoration:none !important;
}
</style>
</head>

<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="neckUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[0].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="ringUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[1].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="braceletUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[2].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="storageUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[3].PRODUCT_CATEGORY_CD}</c:set>

<c:set var="productManageUrl">${context}/work/product/retrieveProductListForManage.do</c:set>
<c:set var="statisticsForProductUrl">${context}/work/sell/retrieveStatisticsForProduct.do</c:set>
<c:set var="statisticsForStockUrl">${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=R</c:set>

<script type="text/javascript"></script>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
			<c:if test="${sessionScope.grade != 'A'}">
				<div class="row">
					<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
				    <!-- Indicators -->
					<ol class="carousel-indicators">
				    	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				        <li data-target="#myCarousel" data-slide-to="1"></li>
				        <li data-target="#myCarousel" data-slide-to="2"></li>
				        <li data-target="#myCarousel" data-slide-to="3"></li>
				    </ol>

					<div class="carousel-inner" role="listbox">
						<div class="item active">
					    	<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${neckUrl}')"><img src="${context}/neckImg/${dsProductList[0].PRODUCT_IMAGE}" style="width: 54.6%; max-height: 700px !important; margin: auto;"></a>
					    </div>
						<div class="item">
					    	<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${ringUrl}')"><img src="${context}/ringImg/${dsProductList[1].PRODUCT_IMAGE}" style="width: 54.6%; max-height: 700px !important; margin: auto;"></a>
					    </div>
					    <div class="item">
					    	<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${braceletUrl}')"><img src="${context}/braceletImg/${dsProductList[2].PRODUCT_IMAGE}" style="width: 54.6%; max-height: 700px !important; margin: auto;"></a>
					    </div>
					    <div class="item">
					    	<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${earUrl}')"><img src="${context}/earImg/${dsProductList[3].PRODUCT_IMAGE}" style="width: 54.6%; max-height: 700px !important; margin: auto;"></a>
					    </div>
					        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
					            <span class="glyphicon glyphicon-chevron-left"></span>
					        </a>
					        <a class="right carousel-control" href="#myCarousel" data-slide="next">
					            <span class="glyphicon glyphicon-chevron-right"></span>
					        </a>
						</div>
					</div>
					<hr>
				</div>
			<div class="container">
				<div class="page-header">
					<h1>팔찌</h1>
				</div>
				<div class="jumbotron">
					<div class="row">
						<c:forEach items="${dsBraceletList}" var="dsBraceletList">
							<div class="col-md-4">
								<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${braceletUrl}')"><img src="${context}/braceletImg/${dsBraceletList.PRODUCT_IMAGE}" class="img-thumbnail"></a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>목걸이</h1>
				</div>
				<div class="jumbotron">
					<div class="row">
						<c:forEach items="${dsNeckList}" var="dsNeckList" varStatus="neckIdx">
							<div class="col-md-4">
								<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${neckUrl}')"><img src="${context}/neckImg/${dsNeckList.PRODUCT_IMAGE}" class="img-thumbnail" width="100%" height="100%"></a>
								<c:if test="${neckIdx.index == 2}">
									&nbsp;
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>반지</h1>
				</div>
					<div class="row">
						<c:forEach items="${dsRingList}" var="dsRingList" varStatus="ringIdx">
							<div class="col-md-3">
								<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${ringUrl}')"><img src="${context}/ringImg/${dsRingList.PRODUCT_IMAGE}" class="img-rounded" width="100%" height="100%"></a>
								<c:if test="${ringIdx.index == 3}">
									&nbsp;
								</c:if>
							</div>
						</c:forEach>
					</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>귀걸이</h1>
				</div>
				<div class="jumbotron">
					<div class="row">
						<c:forEach items="${dsEarList}" var="dsEarList">
							<div class="col-md-2">
								<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${earUrl}')"><img src="${context}/earImg/${dsEarList.PRODUCT_IMAGE}" class="img-rounded" width="100%" height="100%"></a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			</c:if>
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