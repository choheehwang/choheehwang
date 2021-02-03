<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자단 푸터 시작 footer.jsp -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2020 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0-rc
    </div>
  </footer>

  <!-- Log out Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3 control-sidebar-content text-center">
	    <h5>로그 아웃</h5><hr class="mb-2"/>
	    <a href="/logout" class="btn btn-lg btn-primary">로그아웃</a>
    </div>
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/resources/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="/resources/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="/resources/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="/resources/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/resources/plugins/moment/moment.min.js"></script>
<script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/resources/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.js"></script>
<!--
AdminLTE for demo purposes 
<script src="/resources/demo.js"></script>
-->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/resources/dist/js/pages/dashboard.js"></script>
<!-- 왼쪽 메뉴 active 클래스 j쿼리 추가 (아래) -->
<script>
$(document).ready(function() {
	//현재 선택된 url값을 가져오는 명령어
	var current = location.pathname;//current변수 저장소에서 어떤 게시판을 클릭하였는지 내용 확인용
	var current_2 = current.split("/")[2];
	//alert(current_2); //디버그 확인용
	//active 클래스 추가할 영역은 nav-item의 a태그 영역
	$(".nav-treeview li a").each(function(){
		//each function으로 a태그 2개를 찾는 명령어(반복함수:결과가 2개이므로 2번 반복)
		//$(this)는 현재 함수의 구현대상 본인(a태그 영역)
		//2개 값 비교: 1. a태그값, 2. current_2값
		//if( $(this).attr('href').includes(current_2) == true) {}
		//위 includes function은 크롬에서만 작동되므로 아래 indexOf function으로 대체
		if( $(this).attr('href').indexOf(current_2) != -1) {
			if(current_2 != 'board'){
				$(this).addClass("active"); // 선택한 메뉴의 배경색상을 흰색으로 보이게 추가하는 처리.
			}
		} else {
			if(current_2 != 'board'){
				$(this).removeClass("active"); // 선택하지 않은 메뉴의 배경색상 흰색을 제거하는 처리.
			}
		}
	});
});
</script>
</body>
</html>
<!-- 관리자단 푸터 끝 -->