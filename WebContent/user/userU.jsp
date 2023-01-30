<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="userU.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
		<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/process.css" rel="stylesheet">
    <link href="${context}/css/user.css" rel="stylesheet">
    

	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

	<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
   	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		fn_init();

		$( "#birth" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2015"
	    });

		//U페이지 해당
		fn_setDetailInfo();
	});

    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postNum1').value = data.zonecode;
                document.getElementById("postNum2").value = roadAddr;
                document.getElementById("postNum3").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("address1").value = extraRoadAddr;
                } else {
                    document.getElementById("address1").value = '';
                }
            }
    	}).open();

    }	
	
	function fn_setDetailInfo(){
		$("#id").val('${dsUser.id}');
		$("#pw").val('${dsUser.pw}');
		$("#email").val('${dsUser.email}');

		$("#name").val('${dsUser.name}');
		$("#birth").val('${dsUser.birth}');

		var phoneArr = '${dsUser.phoneNum}'.split("-");
		var postNumArr = '${dsUser.postNum}';
		var addressArr = '${dsUser.address}'.split("/");

		var userImage = '${dsUser.userImage}';
		userImage = userImage.replace(/"/gi, "");

		$("#phone1").val(phoneArr[0]);
		$("#phone2").val(phoneArr[1]);

		$("#phoneCd").val('${dsUser.phoneCd}');

		$("#postNum1").val(postNumArr);
		
		$("#postNum2").val(addressArr[0]);
		$("#postNum3").val(addressArr[1]);
		$("#address1").val(addressArr[2]);
		
		$("#pic").attr("src", '${context}/userImg/' + userImage);
		$("#userImage").val(userImage);

	}

	function fn_save(){
		if(!fn_validation()) return;

		if(confirm("수정하시겠습니까?")){
			$("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val());
	 		$("#postNum").val($("#postNum1").val());
	 		$("#address").val($("#postNum2").val() + "/" + $("#postNum3").val() + "/" + $("#address1").val());

	 		$("#joinFrm").submit();
		}
	}

	function fn_upload(){
		$("#ajaxform").ajaxSubmit({
	        type: "POST",
	        dataType: 'text',
	        url: $("#ajaxform").attr("action"),
	        data: $("#ajaxform").serialize(),
	        success: function (data) {
	        	data2 = data.replace(/"/gi, "");
	        	var imageUrl = "${context}/userImg/" + data2;
	        	$("#pic").attr("src", imageUrl);
	        	$("#userImage").val(data2);
	        },
	        error: function (xhr, status, error) {
	            alert(error);
	        }
	    });
	}

</script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="jumbotron" class="container">
		<div class="user-main">
			<h1><font color="black"><strong>정보 수정</strong></font></h1>
		</div>
	</div>
	<div class="container">
	<form id="joinFrm" method="post" action="${context}/work/user/updateUser.do" role="form">
		<div class="form-horizontal">
			<hr/>
			<div class="form-group" style="margin-top: 5%;">
				<label for="id" class="control-label col-md-2"><b>아이디</b></label>
				<div class="col-md-4">
					<input class="form-control" type="text" name="id" id="id" disabled="disabled" required="required" autofocus="autofocus" onkeyup="idCheck();"/>
				</div>
				<p id="message"></p>
			</div>

			<div class="form-group">
				<label for="pw" class="control-label col-md-2"><b>비밀번호</b></label>
				<div class="col-md-4">
					<input class="form-control" type="password" name="pw" id="pw" disabled="disabled" required="required"/>
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="control-label col-md-2"><b>이메일</b></label>
				<div class="col-md-4">
					<input class="form-control" type="email" name="email" id="email" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="control-label col-md-2"><b>성명</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="name" name="name" autofocus="autofocus" required="required"/>
				</div>
			</div>

			<div class="form-group">
				<label for="birth" class="control-label col-md-2"><b>생년월일</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="birth" name="birth" required="required" maxlength="10"/>
				</div>
			</div>

			<div class="form-group">
				<label for="phoneCd" class="control-label col-md-2"><b>연락처</b></label>
				<div class="col-md-2">
		        	<select class="form-control" id="phoneCd" name="phoneCd" required="required">
						<c:forEach items="${dsCode1}" var="code1">
							<option value="${code1.commCd}">${code1.commCdNm}</option>
						</c:forEach>
		     		</select>
	     		</div>
				<div class="col-md-2">
					<input class="form-control" type="text" id="phone1" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
				<div class="col-md-2">
					<input class="form-control" type="text" id="phone2" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
				<input type="hidden" id="phoneNum" name="phoneNum">
			</div>

			<div class="form-group">
				<label for="postnum1" class="control-label col-md-2"><b>주소</b></label>
				<div class="col-md-3">
					<input class="form-control" type="text" id="postNum1" placeholder="우편번호" disabled="disabled">
				</div>
				<span class="col-md-1">
					<input type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				</span>
				<input type="hidden" id="postNum" name="postNum">
			</div>

			<div class="form-group">
				<label for="postnum2" class="control-label col-md-2"></label>
				<div class="col-md-3">
					<input class="form-control" type="text" id="postNum2" placeholder="도로명주소" disabled="disabled"/>
	     		</div>
				<div class="col-md-3">
					<input class="form-control" type="text" id="postNum3" placeholder="지번주소" disabled="disabled"/>
				</div>
			</div>
			<div class="form-group">
				<label for="postnum3" class="control-label col-md-2"><b>상세주소</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="address1" placeholder="상세주소"/>
				</div>
				<input type="hidden" id="address" name="address">
			</div>
			
			<div class="form-group">
				<label class="control-label col-md-2"><b>사진</b></label>
				<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="${context}/backgroundImage/defaultpic.png"><br/>
				<div class="col-md-6">
					<input type="hidden" id="userImage" name="userImage" required="required">
				</div>
			</div>
			<input type="hidden" id="flag" name="flag" value="false">
		</div>
	</form>
		<form id="ajaxform" action="${context}/work/product/saveFile.do" method="post" enctype="multipart/form-data" role="form">
		<div class="form-group">
		<label class="control-label col-md-2"></label>
			<div class="col-md-6">
				<input class="form-control" type="file" id="imageFile" name="imageFile" onchange="fn_upload()"/>
				<input type="hidden" id="imageFolder" name="imageFolder" value="userImg">
			</div>
		</div>
		<br><br><br>
		<div class="form-group">
			<div class="col-md-offset-6 col-md-1">
				<button type="button" class="btn btn-success" onclick="fn_back()">뒤로가기</button>
			</div>
			<div class="col-md-1">
				<button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">등록하기</button>
			</div>
		</div>
	</form>
	</div>

	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>