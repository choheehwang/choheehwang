<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<!-- 대쉬보드 본문 Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- 본문 헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Board Update</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Board Update</li>
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
          
          <form name="update_form" action="/admin/board/board_update" method="post" encType="multipart/form-data">
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">UPDATE BOARD</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" value="${boardVO.title}" class="form-control" name="title" id="title" placeholder="Enter the title" required>
                    <!-- name 없으면 저장이 안 된다 -->
                    <!-- required는 필수입력값(html5에서 지원)이므로 입력하지 않으면 다음 단계로 넘어가지 않는다 -->
                  </div>
                  
                  <div class="form-group">
                    <label for="content">Content</label>
                    <textarea rows="5" name="content" id="content" class="form-control"><c:out value="${boardVO.content}" /></textarea>
                </div>
                
                <div class="form-group">
                    <label for="writer">writer</label>
                    <input type="text" value="${boardVO.writer}" class="form-control" name="writer" id="writer" placeholder="Enter the writer" required>
                </div>
                
                <div class="form-group" style="margin-bottom:0px;">
                <label>attach</label>
                </div>
                <c:forEach var="index" begin="0" end="1">
                <!--  -->
                <div class="div_file_delete">
                <div class="custom-file">
                <input type="file" name="file" class="custom-file-input" id="customFile_${index}">
                <label class="custom-file-label" for="customFile_${index}" style="color:#999;">Choose file${index}</label>
                </div>
				<c:if test="${boardVO.save_file_names[index] != null}">
	                <strong><i class="far fa-save mr-1"></i>attach</strong>
	                <p class="text-muted"><a href="/download?save_file_name=${boardVO.save_file_names[index]}&real_file_name=${boardVO.real_file_names[index]}">
	                ${boardVO.real_file_names[index]}-File Download-
	                </a>
	                &nbsp;
	                <input type="hidden" name="save_file_name" value="${boardVO.save_file_names[index]}">
	                <button type="button" class="btn btn-info btn_file_delete">delete</button>
	                </p>
                </c:if>
                <hr>
                </div>
                </c:forEach>
             </div>
             <!-- /.card-body -->
              
            </div>
          
          <!-- button section 시작 -->
          <div class="card-body">
          <a href="/admin/board/board_view?page=${pageVO.page}&bno=${boardVO.bno}" class="btn btn-primary float-right mr-1">Board View</a>
          <button type="submit" class="btn btn-danger float-right mr-1 text-white">SUBMIT</button>
          <!-- a태그는 link 이동은 되지만 form의 post값을 전송할 수 없으므로 button 태그를 사용 -->
          </div>
          <!-- button section 끝 -->
          <input type="hidden" name="bno" value="${boardVO.bno}">
      	  <input type="hidden" name="page" value="${pageVO.page}">
      	   </form>
          </div>
        </div>
      
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>

<!-- 첨부파일 부트 스트랩 디자인 js -->
<script src="/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- 첨부파일 선택한 내용 출력 실행 -->
<script>
$(document).ready(function () {
  bsCustomFileInput.init();
});
</script>
<link rel="stylesheet" href="//resources/plugins/summernote/summernote.css">
<style>
.note-editor.note-frame.fullscreen{background:white;}
</style>
<script src="/resources/plugins/summernote/summernote.js"></script>
<script>
$(document).ready(function(){
	$('#content').summernote({
		height:150,
		lang:"ko-KR",
		placeholder:'글 내용을 입력해주세요',
		toolbar: [
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['link','video']], //'picture',
				    ['view', ['fullscreen', 'help']]
				  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
}); // textarea 중 content아이디영역을 섬머노트에디터로 변경처리 함수실행

</script>

<script>
$(document).ready(function() {
	$(".btn_file_delete").on("click", function() {
		if(confirm("선택한 첨부파일을 삭제하시겠습니까?")) {
			//alert("디버그");
			var click_element = $(this); // 현재 클릭한 element(삭제 버튼)를 가리킨다
			var save_file_name = click_element.parent().find('input[name=save_file_name]').val();
			//alert("디버그: 삭제할 파일명은: " + save_file_name); return false;
			$.ajax({
				type:"post",
				url:"/file_delete?save_file_name="+save_file_name,
				dataType:"text",
				success:function(result) {
					if(result=="success") {
						click_element.parents(".div_file_delete").remove();
					}
				},
				error:function(result) {
					alert("RestAPI 접근 실패");
					//click_element.parents(".div_file_delete").remove(); //디버그
				}
			});
		} // confirm end
		
	});
});
</script>