<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html><!-- 현재문서의 형태선언 -->
<html><!-- html문서는 태그열고 ~ 태그닫고 하는 영역확인 중요 -->
<head><!-- 문서내용과는 관계없는 문서정보=메타데이터(데이터의데이터)가 존재 -->
<meta charset="UTF-8"><!-- 문서의 언어 인코딩설정  지금은 유니코드로 됨 -->
<!-- 반응형 작동하기 위해 사용하는 메타 태그(아래) -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>아름다울 휘</title><!-- 문서의 제목을 브라우저상단왼쪽에 표시 -->
<!-- 외부 자바스크립트 불러오는 태그(아래) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <!-- j쿼리 코어 -->
<script src="/resources/sample/js/user.js"></script>
<!-- 외부 css파일 불러오는 태그(아래) -->
<!-- 부트스트랩 코어(위 2개) -->
<link rel="stylesheet" href="/resources/sample/css/reset.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/mobile.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/tablet.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/pc.css" type="text/css">
<!-- span태그 자리를 차지하지 않는 영역 = 한뼘 , px 픽셀 화면에 표시되는 크기의 단위 -->
<!-- :콜론(속성:값, Key:Value), ;세미콜론(문장의 끝) -->
</head>
<style>

</style>
<script>
/* 자바스크립트 시작 */
 $(document).ready(function($) {
    	$('.carousel').carousel({
    		  interval: 3000, /*이미지가 움직이는 텀 정함*/
    		  pause: false
    	})
    });

/* 자바스크립트 끝 */
</script>
<body><!-- 문서내용이 들어가는 영역 -->
<div id="wrap"><!-- 랩핑시킨 영역 -->
<header class="header">
<!-- 상단 로고와 햄버거 메뉴영역 시작 -->
<h1 class="logo">
<a href="/">LOGO</a><!-- a태그는 페이지이동역할, href헤르프 속성값에 URL을 입력해서 이동 -->
</h1><!-- 헤드라인 글자를 표시 h1~h6 -->
<div class="menu-toggle-btn">
<span></span>
<span></span>
<span></span>
</div>

<!-- html5 시만텍 웹 = 의미가 있는 태그를 사용하게 해서 AI가 인식하게 됩니다. nav태그 -->
<nav class="gnb"><!-- gnb:글로벌네이게이션:전체영역메뉴  Global Navigation -->
<!-- 리스트를 보여주는 태그 ul(UnOrdered List *.~, *.~ ) , ol(Ordered List 1.~, 2.~ ) -->
<ul>
<li><a href="/sample">Sample HOME</a></li>
<li><a href="/sample/weare">WE ARE</a></li>
<li><a href="/sample/work">PRODUCTS</a></li>
<li><a href="/sample/blog">SNS</a></li>
<li><a href="/sample/contact">CONTACT US</a></li>
<li><a href="/">HOME</a></li>
</ul>
</nav>
<!-- 상단 로고와 햄버거 메뉴영역 끝 -->
</header>
</div>