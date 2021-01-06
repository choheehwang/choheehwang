<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp" %>

  <!-- 대쉬보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문 헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Board view</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Board view</li>
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
                <h3 class="card-title">Read Board</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-book mr-1"></i> title</strong>
                <p class="text-muted">
                <%-- EL(Express Language)출력: ${boardVO.title} 보안에 취약하므로 c tag 사용하여 EL을 감싸준다 --%>
                <c:out value="${boardVO.title}"></c:out>
                </p>
                
                <hr>
                <strong><i class="fas fa-map-marker-alt mr-1"></i> contents</strong>
                <p class="text-muted">
                	${boardVO.content}
                </p>

                <hr>
                <strong><i class="fas fa-pencil-alt mr-1"></i> writer</strong>
                <p class="text-muted">
                <c:out value="${boardVO.writer}">
                </c:out>
                </p>
                <c:forEach var="index" begin="0" end="2">
                <c:if test="${boardVO.save_file_names[index] != null}">
	                <hr>
	                <strong><i class="far fa-save mr-1"></i>attach${index}</strong>
	                <p class="text-muted">
	                <a href="/download?save_file_name=${boardVO.save_file_names[index]}&real_file_name=${boardVO.real_file_names[index]}">
	                ${boardVO.real_file_names[index]}-File Download${index}-
	                </a>
	                <c:set var="fileNameArray" value="${fn:split(boardVO.save_file_names[index], '.')}" />
	                <c:set var="extName" value="${fileNameArray[fn:length(fileNameArray)-1]}" />
	                
	                <!-- 이미지 파일인지 일반 파일인지 비교, result = true, false -->
	                <c:choose> 
	                	<c:when test="${fn:containsIgnoreCase(checkImgArray,extName)}">
	                		<img style="width:100%;" src="/download?save_file_name=${boardVO.save_file_names[index]}&real_file_name=${boardVO.real_file_names[index]}">
	                	</c:when>
	                	<c:otherwise>
	                		<c:out value="${checkImgArray}" />
	                		<!-- 사용자 홈페이지 메인화면 최근 게시물 미리보기 이미지 없을 때 사용 예정 -->
	                	</c:otherwise>
	                </c:choose>
	                </p>
                </c:if>
                </c:forEach>
              </div>
              <!-- /.card-body -->
              </div>
          
          <!-- button section 시작 -->
          <div class="card-body">
          <a href="/admin/board/board_list?page=${pageVO.page}" class="btn btn-primary float-right mr-1">LIST ALL</a>
          <button class="btn btn-danger float-right mr-1" id="btn_board_delete">DELETE</button>
          <a href="/admin/board/board_update?page=${pageVO.page}&bno=${boardVO.bno}" class="btn btn-warning float-right mr-1 text-white">UPDATE</a>
          <!-- 부트스트랩 버튼 디자인 적용 예시 btn-primary, btn은 버튼 모양으로 변경하는 것 (위) -->
          </div>
          <!-- button section 끝 -->
          
          <!-- 댓글 영역 시작 -->
      <div class="card card-primary card-outline col-12">
         <div class="card-header">
           <h5 class="card-title">Add New Reply</h5>
           </div>
           <form action="board_view.html" name="reply_form" method="post">
           
         <div class="card-body">
           <div class="form-group">
	           <label for="replyer">Replyer</label>
	           <input type="text" class="form-control" name="replyer" id="replyer" placeholder="Enter the Writer" required>
           </div>
           <div class="form-group">
	           <label for="replytext">Reply Text</label>
	           <input type="text" class="form-control" name="replytext" id="replytext" placeholder="Enter the contents" required>
           </div>
           <!-- 게시판에서는 form을 전송할 때 submit 타입을 사용하지만 댓글은 Ajax로 전송하므로 button 타입을 사용 -->
	       <button type="button" class="btn btn-warning float-left mr-1 text-white" id="insertReplyBtn">Comments</button>
         </div>
         
         <div class="timeline">
         	 <!-- .time-label before 위치 -->
	         <div class="time-label">
	         <span class="bg-red" id="btn_reply_list" style="cursor:pointer;">Reply List[${boardVO.reply_count}]&nbsp;&nbsp;</span>
	         </div>
	         <!-- .time-label after 위치 -->
	         
	         <!-- <div>
                <i class="fas fa-envelope bg-blue"></i>
                <div class="timeline-item">
                  <h3 class="timeline-header">Writer</h3>

                  <div class="timeline-body">
                    Comments input test
                  </div>
                  <div class="timeline-footer">
                    Button trigger modal
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#replyModal">
					  Modify
					</button>
                  </div>
                </div>
              </div> -->
         </div><!-- //.timeline -->
         
         <!-- paging section 시작 -->
         <div class="pagination justify-content-center">
		         <ul class="pagination pageVO">
		         <!-- 
		         <li class="paginate_button page-item previous disabled" id="example2_previous">
			     <a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
			     </li>
			         
		                     위 이전 게시물 링크
		         <li class="paginate_button page-item active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
		         <li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
		         <li class="paginate_button page-item "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
		         
		       	  아래 다음 게시물 링크
		         <li class="paginate_button page-item next" id="example2_next">
		         <a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
		         </li>
		          -->
	         </ul>
	         </div>
         <!-- paging section 끝 -->
         
         </form>
      </div>
      <!-- 댓글 영역 끝 -->
      </div><!-- //col-12 -->
      </div><!-- //row -->
      
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>
<input type="hidden" id="reply_page" value="1">
<!-- html에서 jsp로 옮길 때 댓글영역 같은 경우 footer 상단에 위치해야하나, 디자인이 안 먹힐 경우 하단에 위치시킨다.  -->
<!-- 자바 스크립트용 #template eliment 제작(아래) jstl의 향상된 for문과 같은 역할 -->
<!-- 외부코어(아래) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- 댓글템플릿(빵틀) 만들기(아래) -->
<%-- jsp <c:forEach> = {{#each .}} --%>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<div class="template-div" data-rno="{{rno}}">
 <i class="fas fa-envelope bg-blue"></i>
 <div class="timeline-item">
	<h3 class="timeline-header">{{replyer}}</h3>
	<div class="timeline-body">{{reply_text}}</div>
	<div class="timeline-footer">
	  <!-- Button trigger modal -->
	  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#replyModal">
		Modify
	  </button>
 	</div>
 </div>
</div>
{{/each}}
</script>

<!-- pageVO를 파싱하는 함수(아래) -->
<script type="text/javascript">
var printPageVO = function(pageVO, target) {
	var paging = "";
	if(pageVO.prev) {
		paging = paging +
		'<li class="paginate_button page-item previous disabled" id="example2_previous"><a href="'+(pageVO.startPage-1)+'" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>';
	}
	//pageVO를 target영역에 페이징 번호파싱-반복문사용(아래)
	for(var cnt=pageVO.startPage;cnt<=pageVO.endPage;cnt++) {
		var active = (cnt == pageVO.page)?"active":"";
		paging = paging +
		'<li class="paginate_button page-item '+active+'"><a href="'+cnt+'" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">'+cnt+'</a></li>';
	}
	if(pageVO.next) {
	//이후 댓글 링크-pageVO.next(아래)
	'<li class="paginate_button page-item next" id="example2_next"><a href="'+(pageVO.endPage+1)+'" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>';
	}
	target.html(paging);
}
</script>

<script>
$(document).ready(function(){
	$(".pageVO").on("click", "li a", function(event){
		event.preventDefault(); // a 태그의 기본 기능인 이동기능을 금지하는 명령
		var page = $(this).attr("href"); // 현재 클릭한 페이지 값 저장
		// alert(page); // 디버그
		$("#reply_page").val(page);
		$("#btn_reply_list").click();
	});
});
</script>

<!-- 화면 재구현(representation) 함수(아래) -->
<script>
var printReplyList = function(data, target, templateObject) {
	var template = Handlebars.compile(templateObject.html()); //html 태그로 변환
	var html = template(data); //빅데이터를 리스트 템플릿에 바인딩 해주는 역할
	$(".template-div").remove(); //현재 화면에 보이는 댓글 리스트만 지우기
	target.after(html); //target은 .time-label class 영역을 가리킴
};

</script>

<!-- 댓글 리스트 버튼 클릭 시 Ajax RestAPI controller 호출(아래) -->
<script>
$(document).ready(function() {
	$("#btn_reply_list").on("click", function() {
		var page = $("#reply_page").val();
		// alert("선택한 페이지 값은" + page + "입니다."); // 디버그
		$.ajax({
			type:"post",
			url:"/reply/reply_list/${boardVO.bno}/"+page,
			dataType:"json", // 받을 때 json으로 받음
			success:function(result) { // result는 댓글 목록을 jason data로 받는다
				//alert("디버그" + result);
				if(typeof result=="undefinded" || result=="" || result==null) {
					alert('조회된 값이 없습니다.');
				}else{
				// 빵틀에 result data를 binding하여 출력
				// console.log(result);
				// var result = JSON.parse(result);//텍스트자료를 제이슨 자료로 변환.
				// console.log("여기까지" + jsonData.replyList);//디버그용 
				printReplyList(result.replyList, $(".time-label"), $("#template"));//화면에 출력하는 구현함수를 호출하면 실행
				printPageVO(result.pageVO, $(".pageVO"));
				}
			},
			error:function(result) {
				alert("RestAPI 서버에 문제가 발생하였습니다. 다음에 이용해주십시오.");
			}
		});
	});
});
</script>

<!-- 댓글 등록 버튼 action 처리(아래) -->
<script>
$(document).ready(function() {
	$("#insertReplyBtn").on("click", function() {//댓글 등록 버튼 클릭 시 구현 내용(아래)
		//alert("디버그");
		//Ajax를 이용하여, 화면을 Representation(REST-API 방식) 부분 화면 재구현(아래)
		$.ajax({//통신 프로그램
			type:'post',//html->get, jsp->post로 변경
			url:'/reply/reply_write',//jsp로 가면 ReplyController에서 지정한 url로 변경 예정
			dataType:'text',//ReplyController에서 받은 데이터 형식을 text형식으로 받겠다고 명시
			//통신 성공(HTTP 상태 코드가 404에러, 500에러가 아닌 200 통신 성공)일 시, 위 경로에서 반환받은 result(json text data)를 이용하여 화면을 재구현하는 방식(아래)
			success:function(result) {
				alert(result);//디버그용
				//html이므로 result값을 이용할 수가 없어 댓글 더미데이터 생성
				result = [
					//{rno:댓글 번호, bno:게시물 번호, replytext:"첫 번째 댓글", replyer:"admin", regdate:타임스탬프}
					{rno:1, bno:15, reply_text:"첫 번째 댓글", replyer:"user02", reg_date:1601234512345},//1st comment data
					{rno:2, bno:15, reply_text:"두 번째 댓글", replyer:"admin", reg_date:1601234512345}//2st comment data
				];//위 url이 공공데이터일 때, 이 데이터를 화면에 구현하면 빅데이터의 시각화라고 부른다.
				//printReplyList(빅데이터, 출력할 타겟 위치, 빅데이터를 가진 바인딩된 템플릿 화면)
				printReplyList(result, $(".time-label"), $("#template"));
			}
		})
	});
});
</script>

<script>
<!-- 댓글 리스트에서 수정 버튼 누를 시 뜨는 팝업창 내용을 동적 변경하는 구현 내용(아래) -->
$(document).ready(function() {
	$(".timeline").on("click", ".template-div", function() {//.template-div 댓글 리스트 영역
		//$(this); 클릭한 댓글에 따라서 this는 첫 번째 댓글이 될 수도 있고 두 번째 댓글이 될 수도 있다.
		$("#rno").val($(this).attr("data-rno"));
		$(".modal-title").html($(this).find(".timeline-header").text());
		$("#replytext").val($(this).find(".timeline-body").text());
		//마우스 클릭으로 선택한 댓글의 .timeline-body영역의 text문자를 modal창의 #replytext영역에 값으로 입력
	})
});
</script>

	<!-- Modal 시작 -->
	<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Writer</h5> <!-- 작성자는 동적으로 값이 바뀐다 -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<input type="hidden" name="rno" id="rno" value=""> <!-- 상단의 $(".timeline").on("click" 액션 -->
	        <input type="text" class="form-control" name="replytext" id="replytext" placeholder="Enter the contents">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="updateReplyBtn">Modify</button>
	        <button type="button" class="btn btn-danger" id="deleteReplyBtn">Delete</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal 끝-->

<!-- 게시물 삭제 버튼 클릭 시 액션(아래) -->
<form name="action_form">
	<input type="hidden" name="bno" value="${boardVO.bno}">
	<input type="hidden" name="page" value="${pageVO.page}">
</form>
<script>
$(document).ready(function(){
	$("#btn_board_delete").on("click",function(){
		//aleart("debug");
		if(confirm("삭제하시겠습니까?")) {
			$('form[name="action_form"]').attr("method","post");
			$('form[name="action_form"]').attr("action","/admin/board/board_delete");
			$('form[name="action_form"]').submit();
		}
	});
});
</script>
