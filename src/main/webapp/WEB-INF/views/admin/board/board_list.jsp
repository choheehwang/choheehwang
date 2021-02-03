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
            <h1 class="m-0">Board List${session_board_type}</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Board list</li>
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
            <div class="card"> <!-- 부트스트랩의 card class = 네모난 디자인 -->
              <div class="card-header">
                <h3 class="card-title">Post search</h3>

                <div class="card-tools">
                
                <form name="search_form" action="/admin/board/board_list" method="get">
                  <div class="input-group input-group-sm">
               <div>
                 <select name="search_type" class="form-control">
                 <option value="all" selected>-All-</option>
                     <option value="title" data-select2-id="8">Title</option>
                     <option value="contents" data-select2-id="16">Contents</option>
                 </select>
                 </div>
                 
                    <div>
                    <input type="text" name="search_keyword" class="form-control float-right" placeholder="Search">
                    </div>

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                  </form>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr class="text-center">
                      <th>bno</th> <!-- table head title tag (th) -->
                      <th>title[reply_count]</th>
                      <th>writer</th>
                      <th>regdate</th>
                      <th>view_count</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:if test="${fn:length(board_list) == 0}">
                  	<tr><td colspan="5" class="text-center">조회된 데이터가 없습니다.</td></tr>
                  </c:if>
                  <c:forEach items="${board_list}" var="boardVO" varStatus="status">
                  <tr>
                      <td>
                      <!-- ${boardVO.bno} 대신에 보기 편한 넘버링으로 변환(아래) -->
                      ${pageVO.totalCount-(pageVO.page*pageVO.queryPerPageNum)+pageVO.queryPerPageNum-status.index}
                      [${boardVO.bno}]
                      </td>
                      <!-- 아래 a 링크는 리스트가 늘어날수록 동적으로 bno값이 변하게 됨, 개발자가 jsp 처리 -->
                      <td><a href="/admin/board/board_view?page=${pageVO.page}&bno=${boardVO.bno}">
                      <!-- c:out 사용하는 이유: 보안 때문에(secure coding) -->
					  <c:out value="${boardVO.title}"></c:out>[<c:out value="${boardVO.reply_count}"></c:out>]
					  </a></td>
                      <td><c:out value="${boardVO.writer}"></c:out></td>
                      <td><fmt:formatDate pattern="yyy-MM-dd HH:mm:ss" value="${boardVO.reg_date}"/></td>
                      <td><span class="badge bg-danger">${boardVO.view_count}</span></td>
                      <!-- 조회수 = 부트스트랩 badge class 사용 -->
                    </tr>
                  </c:forEach>
                  
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              
              </div>
              <!-- /.card -->
              
              <!-- button section 시작 -->
              <div class="card-body">
              <a href="/admin/board/board_write" class="btn btn-primary float-right">CREATE</a>
              <!-- 부트스트랩 버튼 디자인 적용 예시 btn-primary, btn은 버튼 모양으로 변경하는 것 (위) -->
              </div>
              <!-- button section 끝 -->
              
              <!-- paging section 시작 -->
              <div class="pagination justify-content-center">
				<ul class="pagination">
              	<c:if test="${pageVO.prev}">
	            	 <li class="paginate_button page-item previous" id="example2_previous">
	            	 <a href="/admin/board/board_list?page=${pageVO.startPage-1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
	            	 </li>
	            	 <!-- 위 이전게시물링크 -->
           		</c:if>

            	 <!-- jstl for문이고, 향상된 for문이아닌 고전for문으로 시작값, 종료값 var변수idx는 인덱스값이 저장되어 있습니다. -->
            	 <c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
            	 	<li class='paginate_button page-item <c:out value="${idx==pageVO.page?'active':''}" />'>
            	 	<a href="/admin/board/board_list?page=${idx}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">${idx}</a></li>
            	 </c:forEach>

            	 <c:if test="${pageVO.next}">
	            	 <!-- 아래 다음게시물링크 -->
	            	 <li class="paginate_button page-item next" id="example2_next">
	            	 <a href="/admin/board/board_list?page=${pageVO.endPage+1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
	            	 </li>
            	 </c:if>
            	 </ul>
            </div>
              <!-- paging section 끝 -->
     
          </div>
        </div>
      
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>