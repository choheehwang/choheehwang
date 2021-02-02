package org.edu.vo;

/**
 * PageVO: 회원,게시판 공통으로 사용
 * 1페이지당 보여줄 개수 = 전체 데이터를 분할해서 보여주는 역할
 * 회원 또는 게시물 nnn개를 한 페이지에 모두 보여주게 되면 조회속도가 느려지므로
 * 1페이지당 10개, 20개, 30개 등 데이터를 분할하여 속도 향상 및 사용자 화면을 개선시키는 용도
 * 아래 계산식에서 [] 부분 = 멤버 변수 생성 해야함
 * - 1페이지 계산 => 10[1페이지당 출력할 개수]x(1[n번째 페이지 번호]-1) = 0
 * - 2페이지 계산 => 10x(2-1) = 10[계산 결과의 시작 페이지번호]
 * - SELECT * FROM tbl_board order by bno desc limit 10, 5; #10-시작인덱스, 10-출력할 개수
 * @author 황초희
 *
 */
public class PageVO {
	// 매퍼쿼리에 보낼 board_type 변수 생성
	private String board_type;
	private int perPageNum; // 리스트하단에 보이는 페이징 번호의 개수
	private int queryPerPageNum; // 1페이지당 출력할 개수
	private Integer page; // 선택한 페이지 번호
	private int queryStartNo; // 시작 인덱스값
	private boolean prev; // 페이징에서 이전 번호가 있을 때 prev 표시
	private boolean next; // 페이징에서 이후 번호가 있을 때 next 표시
	// 프리뷰, 넥스트 변수값 유무 확인시 계산식 필요
	// 계산시 필요한 변수 3개 (아래)
	private int totalCount; // 회원 or 게시물 전체 개수값 변수
	private int startPage; // 페이징 리스트 시작번호
	private int endPage; // 페이징 리스트 끝번호
	
	// 검색에 필요한 변수 2개도 포함 => 컨트롤러 내 매개변수 사용 축소
	private String search_type; // 검색조건
	private String search_keyword; // 검색어
	public String getBoard_type() {
		// this.board_type = "notice"; // 세션변수를 사용 예정.
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	
	// 전체 클래스에서 계산식 4개 필요(아래)
	// 계산식 반환값(4개): startPage(11), endPage(20), prev(true), next(false)
	// totalCount변수: 컨트롤러에서 쿼리문을 통해서 수신
	private void calcPage() {
		// page변수: 현재 클릭한 페이지 번호
		// 예) 11 를 받아서 아래 계산식에서 사용
		// (int)형변환 : 2.1, 2.8(double) => 2로 반환(int형은 실수가 아니라 정수를 나타내므로)
		// ceil메서드: 1.1 => 2, 2.3 => 3 (ceil=천장값=올림)
		// floor메서드: 1.1 => 1, 2.3 => 2 (floor=바닥값=내림)
		// ceil(1/10) =>1.0 0.9 0.8...0.1 0.0 -0.1 -0.2 => 1
		// 2 1.9 1.8 ... 1.2 1.1 => 2
		// ceil(11/10)*10 => 20페이지
		int tempEnd = (int)(
				Math.ceil(page/(double)this.perPageNum)*this.perPageNum
				);
		// 예) 클릭한 페이지번호 1 을 기준으로 끝 페이지 계산(위)
		// 예) < 1 2 3 4 5 6 7 8 9 10(tempEnd) > 페이징 리스트의 시작1 과 끝10 값이 바뀜
		// 예) < 11 12 13 14 15 16 17 18 19 20(tempEnd) > 시작 11 과 끝 20
		this.startPage = (tempEnd - this.perPageNum) + 1;
		// jsp에서 11페이지를 클릭했을때 (20 - 10) + 1 = 11 스타트 페이지 값(위)
		// 20 x 10 = 200 개의 레코드(= 회원 or 게시물) (아래)
		// if, 회원 or 게시물이 195개일 경우?
		if(tempEnd*this.queryPerPageNum > this.totalCount) { // 200>195
			// (끝페이지(임시)*1페이지당 출력할 개수 > 실제전체개수)
			// 클릭한 page번호로 계산된 게시물수가 실제게시물(totalCount)수보다 클때
			this.endPage = (int)Math.ceil(
					this.totalCount/(double)this.queryPerPageNum
					); //  195/10 => [20] 19.9 19.8 ... 19.5
		} else {
			// 전체 회원 or 게시물 수가 195일때 page 1을 클릭한 경우 100 > 195
			// 결과가 195/10 => 20: 잘못됨
			// 다음처럼 나와서 위 조건을 타면 안 되고 else 문을 진입해야 함
			this.endPage = tempEnd; // tempEnd 10 = endPage 10
		}
		// ================== 여기까지가 endPage를 구하는 계산식 ==================
		//  prev, next 구하는 계산식(아래)
		this.prev = (this.startPage != 1); // 예) 시작 페이지 11 결과값은 true
		// 시작 페이지가 1보다 크면 무조건 이전 페이지가 있다는 뜻(위)
		this.next = (this.endPage*this.queryPerPageNum < this.totalCount);
		// 20x10 < 195 결과는 false 이므로 jsp에서  >표시 안 보이게 처리
		// 예) < 11 12 13 14 15 16 17 18 19 20(tempEnd) 시작 11, 끝 20
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		// perPageNum = 10;// 강제로 1페이지당 보여줄 개수 = 10개로 지정
		this.perPageNum = perPageNum;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getQueryStartNo() {
		// 시작 인덱스번호(0) 구하는 계산식(아래)
		// 계산식 = (jsp에서 클릭한페이지번호-1)*페이지당 보여지는 개수
		// 1페이지 계산 => 10[1페이지당 출력할 개수]x(1[n번째 페이지 번호]-1) = 0
		// 2페이지 계산 => 10x(2-1) = 10[계산 결과  시작 페이지 번호]
		queryStartNo = queryPerPageNum*(this.page-1); // queryPerPageNum=10
		return queryStartNo;
	}
	public void setQueryStartNo(int queryStartNo) {
		this.queryStartNo = queryStartNo;
	}
	public boolean getPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean getNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		// totalCount변수값 생성 후 calcPage메서드 동시 실행 시 4개의 변수값 SET
		calcPage(); // totalCount변수값이 필수로 필요한 메서드
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public int getQueryPerPageNum() {
		return queryPerPageNum;
	}

	public void setQueryPerPageNum(int queryPerPageNum) {
		this.queryPerPageNum = queryPerPageNum;
	}
	
}