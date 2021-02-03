<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--html 주석 시작
- jsp: java Server Page
html 주석 끝 -->
<%-- 자바 주석 시작
 - <% %>: jsp에서 자바 프로그램을 사용할 때 쓰는 태그
- @: annotation, 페이지 지시자
- language: java, content type: text/html,
character set: unicode(UTF-8), page encoding: unicode(UTF-8)
자바 주석 끝 --%>

<!-- 
- HomeController.java 에서 index.jsp로 매칭시킨 결과가 나오는 페이지 입니다.<br>
- /resources/sample/index.html로 접근하지 않고 HomeController.java를 거쳐<br>
- index.jsp로 접근하는 이유는 보안 때문이다(관공서, 대학, 금융권 페이지/스프링을 배우는 목적).<br>
- 그러나 php는 html처럼 파일에 바로 접근이 가능하다(중소기업 페이지).<br>
- 자바: 프로그래밍 언어<br>
- 스프링: 개발자가 편하게 개발하도록 만들어 놓은 프레임워크<br>
- jsp: MVC에서 view단에 해당하는 기술 부분<br>
- MVC: Model(DB), View(jsp), Controller(controller java class)<br>
 -->
<%@ include file="./include/header.jsp" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<section><!-- division디비전이라는 div 영역표시 태그 대신에 사용 -->
<!-- 본문 슬라이드 영역 시작 -->
<!-- 이미지를 불러오는 태그 img -->
<!-- 경로:상대(./img/...),절대경로(/resources/sample/img/...) -->
<!-- 태그안쪽에 지정한 스타일을 인라인스타일 -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/sample/img/main_1.jpg" class="d-block w-100" alt="이미지1입니다">
    </div>
    <div class="carousel-item">
      <img src="/resources/sample/img/main_2.jpg" class="d-block w-100" alt="이미지2입니다">
    </div>
    <div class="carousel-item">
      <img src="/resources/sample/img/main_3.jpg" class="d-block w-100" alt="이미지3입니다">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<!-- 본문 슬라이드 영역 끝 -->
</section>

<%@ include file="./include/footer.jsp" %>
