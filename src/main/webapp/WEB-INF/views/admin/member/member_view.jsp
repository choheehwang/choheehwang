<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jstl: java standard tag library, 표준 태그 라이브러리 -->


  <!-- 대쉬보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문 헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Member view</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Member view</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- 본문 내용 Main content -->
    <section class="content">
      <div class="container-fluid">
      
      <div class="row"> <!-- 부트스트랩의 디자인 클래스 row -->
          <div class="col-12"> <!-- width=100%와 같은 말 -->
          
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Read Member</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-book mr-1"></i> user_id</strong>
                <p class="text-muted">
                <!-- jsp에서 자바 변수(저장소)를 사용하는 방법 = Model로 수신한 $ 변수명으로 표시 -->
                  <%-- ${user_id2}에서 아래 보안 코딩으로 변경 --%>
                  <c:out value="${memberVO.user_id}"></c:out>
                </p>
                
                <hr>
                <strong><i class="fas fa-map-marker-alt mr-1"></i> user_name</strong>
                <p class="text-muted">${memberVO.user_name}</p>

                <hr>
                <strong><i class="fas fa-pencil-alt mr-1"></i> e-mail</strong>
                <p class="text-muted">${memberVO.email}</p>

                <hr>
                <strong><i class="far fa-file-alt mr-1"></i> point</strong>
                <p class="text-muted">${memberVO.point}</p>
                
                <hr>
                <strong><i class="fas fa-adjust mr-1"></i> enabled</strong>
                <p class="text-muted">${memberVO.enabled}</p>
                
                <hr>
                <strong><i class="fas fa-layer-group mr-1"></i> levels</strong>
                <p class="text-muted">${memberVO.levels}</p>
              </div>
              <!-- /.card-body -->
              </div>
              
          <form name="action_form" id="action_form" action="">
          <!-- button section 시작 -->
	          <div class="card-body">
		          <a href="/admin/member/member_list?page=${pageVO.page}" class="btn btn-primary float-right mr-1">LIST ALL</a>
		          <button type="button" id="deleteBtn" class="btn btn-danger float-right mr-1">DELETE</button>
		          <button type="button" id="updateBtn" class="btn btn-warning float-right mr-1 text-white">UPDATE</button>
	          <!-- 부트스트랩 버튼 디자인 적용 예시 btn-primary, btn은 버튼 모양으로 변경하는 것 (위) -->
	          </div>
          <!-- button section 끝 -->
          <input type="hidden" name="user_id" value="${memberVO.user_id}">
          </form>
         
          </div>
        </div>
      
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

<%@ include file="../include/footer.jsp" %>

<script>
$(document).ready(function(){
	$("#deleteBtn").bind("click", function(){
		if(confirm("삭제하시겠습니까?")) {
			$("#action_form").attr("action", "/admin/member/member_delete");
			$("#action_form").attr("method", "post");
			$("#action_form").submit();
		} // confirm() 자바스크립트의 반환값은 true or false
	});
	
	$("#updateBtn").bind("click", function(){
		$("#action_form").attr("action", "/admin/member/member_update");
		$("#action_form").attr("method", "get");
		$("#action_form").submit();
	});
	
});
</script>