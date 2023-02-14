<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="productR.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${dsProduct.PRODUCT_NAME}</title>
	<link href="${context}/css/bootstrap.css" rel="stylesheet">
<%-- 	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet"> --%>
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
	<link href="${context}/css/plugins/datatables.css" rel="stylesheet">
    <link href="${context}/css/process.css" rel="stylesheet">
        <link href="${context}/css/LIST.css" rel="stylesheet">

	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
    

<%-- 	<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script> --%>
    <script src="${context}/js/plugins/dataTables/datatables.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript">

	var existFolder = '';
	var imageFolder = '';
	var path = '';
	var stockTotal;
	var priceTotal;

    $(document).ready(function() {
    	/* 수량 관련 스크립트 */

    	var action;
		var price = '${dsProduct.PRODUCT_UNIT_PRICE}';
		var stock = '${dsProduct.PRODUCT_COUNT}';

		stockTotal = 1;
		priceTotal = price;

        $(".number-spinner button").mousedown(function () {
            btn = $(this);
            input = btn.closest('.number-spinner').find('input');
            btn.closest('.number-spinner').find('button').prop("disabled", false);

        	if (btn.attr('data-dir') == 'up') {
                action = setInterval(function(){
                    if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
                    	if(stock <= parseInt(input.val())){
                    		alert("죄송합니다.\n재고가 " + stock + "개 남았습니다");
                    		clearInterval(action);
                    	}else{
                    		input.val(parseInt(input.val())+1);
                            $("#price").text(parseInt(price) * parseInt(input.val()) + "원");
                            priceTotal = parseInt(price) * parseInt(input.val());
                            stockTotal = parseInt(input.val());
                    	}

                    }else{
                        btn.prop("disabled", true);
                        clearInterval(action);
                    }
                }, 50);
        	} else {
                action = setInterval(function(){
                    if ( input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min')) ) {
                        input.val(parseInt(input.val())-1);
                        $("#price").text(parseInt(price) * parseInt(input.val()) + "원");
                        priceTotal = parseInt(price) * parseInt(input.val());
                        stockTotal = parseInt(input.val());
                    }else{
                        btn.prop("disabled", true);
                        clearInterval(action);
                    }
                }, 50);
        	}
        }).mouseup(function(){
            clearInterval(action);
        });


    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
      <div class="row">
          <div class="panel panel-default">
           <div class="panel-heading">
             <%--  <h3 class="panel-title"><b>[&nbsp;${dsProduct.PRODUCT_CATEGORY_CD_NM}&nbsp;]&nbsp;${dsProduct.PRODUCT_NAME}</b></h3> --%>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-6" align="center">
        	<img src="/ringImg/${dsProduct.PRODUCT_IMAGE}" id="image"class="img-rounded-img-responsive"> 
<!-- 				 	<img src="/ringImg/ring01.jpg" alt="#" class="img-rounded"> -->
                	<script type="text/javascript">
					 	var productCategoryCd = '${dsProduct.PRODUCT_CATEGORY_CD}';

						if(productCategoryCd == 'N'){
							imageFolder = "neckImg";
						}else if(productCategoryCd == 'R'){
							imageFolder = "ringImg";
						}else if(productCategoryCd == 'E'){
							imageFolder = "earImg";
						}else if(productCategoryCd == 'B'){
							imageFolder = "braceletImg";
						}
						path = $("#image").attr("src");

						existFolder = path.split("/")[1];
						$("#image").attr("src", path.replace(existFolder, imageFolder));
					</script>
                 </div>
                <div class="col-md-6">
 <!--                <br><br><br> -->
                  <table class="table table-user-information">
                    <tbody>
                    <tr>
                        <td>제품명</td>
                        <td>${dsProduct.PRODUCT_NAME}</td>
                      </tr>
                      <tr>
                        <td>판매가</td>
                        <td id="price">${dsProduct.PRODUCT_UNIT_PRICE}원</td>
                      </tr>
                      <tr>
                        <td>평점</td>
                        <td><c:if test="${dsProduct.MARK_RATING == null}">없음</c:if>
                        	<c:if test="${dsProduct.MARK_RATING != null}">${dsProduct.MARK_RATING}점&nbsp;&nbsp;<font color="lightgray">5점만점</font></c:if>
                        </td>
                      </tr>
                      <tr>
                        <td>남은 수량</td>
                        <td id="stock">${dsProduct.PRODUCT_COUNT}개</td>
                      </tr>
                      <tr>
                        <td>제품 등록일</td>
                        <td>${dsProduct.PRODUCT_REG_DATE}</td>
                      </tr>
                        <tr>
                        
                      <tr>
                        <td style="vertical-align: middle;">수량</td>
                        <td>
							<div class="input-group number-spinner" style="width: 200px;">
								<span class="input-group-btn data-dwn">
									<button class="btn btn-default btn-info" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
								</span>
								<input type="text" class="form-control text-center" value="1" min="1" max="100" width="100%" disabled="disabled">
								<span class="input-group-btn data-up">
									<button class="btn btn-default btn-info" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
								</span>
								
								
							</div>
						</td>
                      </tr>
                    </tbody>
                  </table>
                  <br><br>
                  <div>
                	  <button id ="buyBtn" type="button" class="btn btn-primary btn-lg" onclick="fn_buy()"><i class="fa fa-credit-card fa-2x">&nbsp;Add to Cart</i></button>
                      <button id ="cartBtn" type="button" class="btn btn-warning btn-lg" onclick="fn_cart()"><i class="fa fa-shopping-cart fa-2x">&nbsp;Buy Now</i></button>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>

    <c:if test="${dsProduct.SELL_YN == 'Y'}">
    <div class="container">
		<div class="row" style="margin-top:40px;">
			<div class="col-md-12">
		    	<div class="well well-sm">
		            <div class="text-right">
		                <a class="btn btn-danger btn-lg" href="#reviews-anchor" id="open-review-box"><b>상품평입력</b></a>
		            </div>

		            <div class="row" id="post-review-box" style="display:none;">
		                <div class="col-md-12">
		                    <form id="createReply" accept-charset="UTF-8" action="${context}/work/reply/createReply.do" method="post">
		                        <input id="ratings-hidden" name="markRating" type="hidden">
		                        <textarea class="form-control animated" cols="50" id="userReply" name="userReply" placeholder="상품평을 입력하세요..." rows="5"></textarea>

		                        <div class="text-right">
			                        <c:if test="${dsProduct.MARK_YN == 'N'}">
			                            <div class="stars starrr" data-rating="0"></div>
			                        </c:if>
		                            <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
		                            <span class="glyphicon glyphicon-remove"></span>Cancel</a>
		                            <button class="btn btn-success btn-lg" onclick="return fn_save()">Save</button>
		                        </div>
		                        <input type="hidden" id="productCode" name="productCode" value="${dsProduct.PRODUCT_CODE}">
		                        <input type="hidden" id="markYn" name="markYn" value="${dsProduct.MARK_YN}">
		                    </form>
		                </div>
		            </div>
		        </div>
			</div>
		</div>
	</div>
</c:if>
<div class="container">
		<div class="row">
			<div class="col-md-12 toppad">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h1 class="panel-title">이 상품을 보신 고객님들이 많이 본 다른상품  ${dsReplyList[0].REPLY_COUNT}</h1>
					</div>
					<c:forEach items="${dsReplyList}" var="dsReplyList">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3" align="center">
								<img alt="User Pic" id="userImage" src="${context}/userImg/${dsReplyList.USER_IMAGE}" height="200px" width="140px" class="img-circle">
							</div>
							<div class="col-md-9">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><b>${dsReplyList.USER_ID}</b>&nbsp;&nbsp;<font size="1px;" color="gray">${dsReplyList.REPLY_DATE}</font>&nbsp;&nbsp;&nbsp;
											<span class="stars starrr replyStar" data-rating="${dsReplyList.MARK_RATING}"></span>
											</td>
										</tr>
										<tr>
											<td>${dsReplyList.USER_REPLY}</td>
										</tr>
                 				   </tbody>
                  			  </table>
               			  </div>
             		 </div>
           		 </div>
				<div class="panel-footer">
					<c:if test="${sessionScope.userCode == dsReplyList.USER_CODE}">
	                    <span class="pull-right">
	                        <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger" onclick="javascript:fn_remove('${dsReplyList.USER_REPLY_NO}')"><i class="glyphicon glyphicon-remove"></i></a>
                  	  </span>
                    </c:if>
                    <br><br>
                </div>
			</c:forEach>
          </div>
        </div>
      </div>
   <!--    <button class="btn btn-success btn-lg" style="float: right;" onclick="fn_back()">뒤로가기</button> -->
    </div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>