<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="faq.jsp">
<title>JEWELL FAQ</title>
<link href="${context}/css/bootstrap.css" rel="stylesheet">
<link href="${context}/css/faq.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/faq.js" defer type="text/javascript"></script>
<link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200&display=swap"
    rel="stylesheet"
 />
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../common/top.jsp"></jsp:include>


<!-- 페이지 헤더 -->
<div class="page_header">
	 <div class="faq_header">
	       <div class="name">
	             <p class="comeText">FAQ</p>
	        </div>
	  </div>
</div>

<!--         <h3>FAQ 자주하는 질문</h3> -->

<!-- 본문 -->
    <!-- 검색  -->
    <div class="container-md">
        <div class="faq_search_box">
            <select class="form-select" aria-label="Default select example">
                <option selected>전체검색</option>
                <option value="2">상품문의</option>
                <option value="3">목걸이 체인 문의</option>
                <option value="4">주문/결제문의</option>
                <option value="5">배송문의</option>
                <option value="6">취소/반품/환불/교환</option>
                <option value="7">쿠폰/적립금문의</option>
                <option value="8">A/S문의</option>
                <option value="9">기타</option>
              </select>
              
              <div class="container-fluid">
                <form class="d-flex" role="search">
                  <input class="form-control me-2" type="search" placeholder="궁금한 내용을 검색해 보세요" aria-label="Search">
                  <div class="search_img">
                      <a href="#"><img src="${context}/css/images/search.ico" width="25px"></a>
                  </div>
                </form>
              </div>
              
              <div class="faq_menu">
	                <a href="#">전체보기</a>
	                <a href="#">상품문의</a>
	                <a href="#">목걸이 체인 문의</a>
	                <a href="#">주문/결제문의</a>
	                <a href="#">배송문의</a>
	                <a href="#">취소/반품/환불/교환</a>
	                <a href="#">쿠폰/적립금문의</a>
	                <a href="#">A/S문의</a>
	                <a href="#">기타</a>
              </div>
              
            </div>
            
            
       <!-- faq  -->
            <div class="faq-box container-md ">
              <ul>
                <li>
                  <div class="faq-box_question">
	                    <span class="question">Q</span>
	                    <span class="question_ann">질문 내용</span>
                
                  </div>
                  <div class="faq-box_answer">
	                    <span class="answer">A</span>
	                    <span class="answer_ann">답변 내용</span>
                  </div>
                </li>
                
                <li>
                    <div class="faq-box_question">
	                    <span class="question">Q</span>
	                    <span class="question_ann">질문 내용</span>
                    </div>
                    <div class="faq-box_answer">
	                    <span class="answer">A</span>
	                    <span class="answer_ann">답변 내용</span>
                    </div>
                </li>
                
                <li>
                    <div class="faq-box_question">
	                    <span class="question">Q</span>
	                    <span class="question_ann">질문 내용</span>
                    </div>
                    <div class="faq-box_answer">
	                    <span class="answer">A</span>
	                    <span class="answer_ann">답변 내용</span>
                    </div>
                </li>
                
                <li>
                    <div class="faq-box_question">
	                    <span class="question">Q</span>
	                    <span class="question_ann">질문 내용</span>
                    </div>
                    <div class="faq-box_answer">
	                    <span class="answer">A</span>
	                    <span class="answer_ann">답변 내용</span>
                    </div>
                </li>
                
                <li>
                    <div class="faq-box_question">
	                    <span class="question">Q</span>
	                    <span class="question_ann">질문 내용</span>
                    </div>
                    <div class="faq-box_answer">
	                    <span class="answer">A</span>
	                    <span class="answer_ann">답변 내용</span>
                    </div>
                </li>
                
                <li>
                    <div class="faq-box_question">
	                    <span class="question">Q</span>
	                    <span class="question_ann">질문 내용</span>
                    </div>
                    <div class="faq-box_answer">
	                    <span class="answer">A</span>
	                    <span class="answer_ann">답변 내용</span>
                    </div>
                </li>
                
                <li>
                    <div class="faq-box_question">
	                    <span class="question">Q</span>
	                    <span class="question_ann">질문 내용</span>
                    </div>
                    <div class="faq-box_answer">
	                    <span class="answer">A</span>
	                    <span class="answer_ann">답변 내용</span>
                    </div>
                </li>
                
                <li>
                    <div class="faq-box_question">
	                    <span class="question">Q</span>
	                    <span class="question_ann">질문 내용</span>
                    </div>
                    <div class="faq-box_answer">
	                    <span class="answer">A</span>
	                    <span class="answer_ann">답변 내용</span>
                    </div>
                </li>
            </ul>
            
            <div class="page_nav">
	            <nav aria-label="Pagenavigation example">
	                <ul class="pagination justify-content-center">
	                  <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
	                  <li class="page-item"><a class="page-link" href="#">1</a></li>
	                  <li class="page-item"><a class="page-link" href="#">2</a></li>
	                  <li class="page-item"><a class="page-link" href="#">3</a></li>
	                  <li class="page-item"><a class="page-link" href="#">4</a></li>
	                  <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
	                </ul>
	            </nav>
            </div>
        </div>
    </div>
    
    
<!-- 푸터 -->
    <jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>