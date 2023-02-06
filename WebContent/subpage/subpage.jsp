<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="ear.jsp">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${context}/css/subpage.css" rel="stylesheet">

<link href="${context}/css/bootstrap.css" rel="stylesheet">
<%-- 	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet"> --%>
<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
<link href="${context}/css/plugins/datatables.css" rel="stylesheet">
<link href="${context}/css/process.css" rel="stylesheet">

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
	
</script>

</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<main>
    <h3 style="font-size: 26px; font-weight: 900; text-align: center;">EARING</h3>
 
    <div class="group">
	    <div class="li_1">
		<h3 style="font-size: 23px; font-weight: 900;">HOT</h3>
<!--         <h4 style="font-size: 14px; font-weight: 100; text-align: right;">see more</h4> -->
		<div class="box-wrap">
			<c:forEach items="${dsProductList}" var="dsProductList" varStatus="dsProductIdx">
			<div class="col-md-6">
					<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}"><img name="image" src="${context}/binderImg/${dsProductList.PRODUCT_IMAGE}" class="img-thumbnail"></a>
					<script type="text/javascript">
					 	var productCategoryCd = '${dsProductList.PRODUCT_CATEGORY_CD}';
	
						if(productCategoryCd == 'N'){
							imageFolder = "neckImg";
						}else if(productCategoryCd == 'R'){
							imageFolder = "ringImg";
						}else if(productCategoryCd == 'E'){
							imageFolder = "earImg";
						}else if(productCategoryCd == 'B'){
							imageFolder = "braceletImg";
						}
						path = $("img[name='image']").eq('${dsProductIdx.index}').attr("src");
	
						existFolder = path.split("/")[1];
						$("img[name='image']").eq('${dsProductIdx.index}').attr("src", path.replace(existFolder, imageFolder));
					</script>
				</div>
			</c:forEach>
<!-- 			<div class="box"> -->
<%-- 				<img src="${content}/css/images/345.jpg" alt="샘플이미지"> --%>
<!-- 				<h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1> -->
<!-- 				<h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2> -->
<!-- 				<button type="submit">"Add to Cart ------ 14,000원"</button> -->
<!-- 			</div> -->
<!-- 			<div class="box"> -->
<%-- 				<img src="${content}/css/images/345.jpg" alt="샘플이미지"> --%>
<!-- 				<h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1> -->
<!-- 				<h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2> -->
<!-- 				<button type="submit">"Add to Cart ------ 14,000원"</button> -->
<!-- 			</div> -->
<!-- 			<div class="box"> -->
<%-- 				<img src="${content}/css/images/345.jpg" alt="샘플이미지"> --%>
<!-- 				<h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1> -->
<!-- 				<h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2> -->
<!-- 				<button type="submit">"Add to Cart ------ 14,000원"</button> -->
<!-- 			</div> -->
<!-- 			<div class="box"> -->
<%-- 				<img src="${content}/css/images/345.jpg" alt="샘플이미지"> --%>
<!-- 				<h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1> -->
<!-- 				<h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2> -->
<!-- 				<button type="submit">"Add to Cart ------ 14,000원"</button> -->
<!-- 			</div> -->
		</div>
	</div>
    
    </div>
      <div class="group">
	    <div class="li_1">
		<h3 style="font-size: 23px; font-weight: 900;">HOT</h3>
        <h4 style="font-size: 14px; font-weight: 100; text-align: right;">see more</h4>
		<div class="box-wrap">
			<div class="box">
				<img src="${content}/css/images/345.jpg" alt="샘플이미지">
				<h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1>
				<h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2>
				<button type="submit">"Add to Cart ------ 14,000원"</button>
			</div>
			<div class="box">
				<img src="${content}/css/images/345.jpg" alt="샘플이미지">
				<h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1>
				<h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2>
				<button type="submit">"Add to Cart ------ 14,000원"</button>
			</div>
			<div class="box">
			<img src="${content}/css/images/345.jpg" alt="샘플이미지">
				<h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1>
				<h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2>
				<button type="submit">"Add to Cart ------ 14,000원"</button>
			</div>
			<div class="box">
				<img src="${content}/css/images/345.jpg" alt="샘플이미지">
				<h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1>
				<h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2>
				<button type="submit">"Add to Cart ------ 14,000원"</button>
			</div>
		</div>
	</div> 
</div>
<div class="group">
    <div class="li_1">
    <div class="box-wrap">
        <div class="box">
          <img src="${content}/css/images/345.jpg" alt="샘플이미지">
            <h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1>
            <h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2>
            <button type="submit">"Add to Cart ------ 14,000원"</button>
        </div>
        <div class="box">
            <img src="${content}/css/images/345.jpg" alt="샘플이미지">
            <h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1>
            <h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2>
            <button type="submit">"Add to Cart ------ 14,000원"</button>
        </div>
        <div class="box">
            <img src="${content}/css/images/345.jpg" alt="샘플이미지">
            <h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1>
            <h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2>
            <button type="submit">"Add to Cart ------ 14,000원"</button>
        </div>
        <div class="box">
          <img src="${content}/css/images/345.jpg" alt="샘플이미지">
            <h1 style="font-size: 18px; font-weight: 900;">제품명을 입력해주세요</h1>
            <h2 style="font-size: 14px; font-weight: 400;">제품 설명</h2>
            <button type="submit">"Add to Cart ------ 14,000원"</button>
        </div>
    </div>
</div>
</div>
    

    </main>

<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>