<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>

<section class="contact-section">
<h1>CONTACT US</h1>
<div class="container">
<form name="message_form" action="/contact" method="post">
<!-- fieldset은 폼이 DB테이블의 필드와 1:1 매칭되는 관계 -->
<!-- placeholder: 공간 차지를 하지 않으면서 입력 힌트를 보여주는 역할 -->
<fieldset>
<legend>현재 폼의 타이틀 영역입니다.</legend>
<div class="input-class">
<label for="name">이름</label>
<input name="name" id="name" type="text" placeholder="Name">
<label for="phone">연락처</label>
<input name="phone" id="phone" type="text" placeholder="Phone">
<label for="email">이메일</label>
<input name="email" id="email" type="email" placeholder="E-mail">
</div>
<div class="textarea-class">
<label for="message">메세지</label>
<textarea name="message" id="message" placeholder="Message"></textarea>
</div>
</fieldset>
<div class="submit-btn">
<button type="submit">메세지 보내기</button>
</div>
</form>
<!-- form태그의 목적은 input, textarea, checkbox, radio,
select data를 submit(전송)하는 것이 목적 -->
<!-- get(비보안용)방식은 유일하게 검색할 때 사용, post(보안용)방식은 입력, 수정, 삭제할 때 사용 -->
</div>
</section>

<%@ include file="./include/footer.jsp" %>