package org.edu.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.edu.service.IF_BoardService;
import org.edu.util.CommonController;
import org.edu.util.SecurityCode;
import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page. 앱을 위한 홈페이지 요청을 처리한다.
 * http://localhost:8080/ 요청을 받았을 때, 변수를 만들어서 화면에 뿌려준다.
 */
@Controller
public class HomeController {
	
	// private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	private IF_BoardService boardService;
	
	@Inject
	private SecurityCode securityCode;
	
	@Inject
	private CommonController commonController;
	
		//전역 홈페이지 스프링 진입 전 발생하는 에러페이지 처리
		@RequestMapping(value="/home/error/404", method=RequestMethod.GET)
		public String error404() throws Exception {
			return "home/error/404";
		}
		
		//사용자 홈페이지 게시판 상세보기 매핑
		@RequestMapping(value="/home/board/board_view",method=RequestMethod.GET)
		public String board_view(@RequestParam("bno") Integer bno, @ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
			BoardVO boardVO = boardService.readBoard(bno);
			// 게시판 내용 secure coding
			String xssData = securityCode.unscript(boardVO.getContent());
			boardVO.setContent(xssData); // 악성코드 제거 결과 set(저장)
			
			// 첨부파일 데이터 jsp 뷰단으로 전송(아래)
			List<HashMap<String, Object>> files = boardService.readAttach(bno);
			String[] save_file_names = new String[files.size()];
			String[] real_file_names = new String[files.size()];
			int cnt = 0;
			for(HashMap<String, Object> filename:files) { // 위 files data에서 값을 가져오는 로직
				save_file_names[cnt] = (String) filename.get("save_file_name");
				real_file_names[cnt] = (String) filename.get("real_file_name");
				cnt = cnt + 1;
			}
			boardVO.setSave_file_names(save_file_names);
			boardVO.setReal_file_names(real_file_names);
			//====================================================
			model.addAttribute("boardVO", boardVO);
			// Upload된 file이 이미지인지 일반 문서 파일인지 구분
			model.addAttribute("checkImgArray", commonController.getCheckImgArray());
			return "home/board/board_view";
		}
		
		//사용자 홈페이지 게시판 쓰기 매핑(POST) 오버로드(매개변수의 개수또는 타입이 틀린)메서드이용
		//jsp에서 board_write메서드를 호출합니다 -> 호출할때 폼의 필드값을 컨트롤러로 보냅니다.
		//컨트롤러에서 받을때 사용하는 매개변수 BoardVO boardVO입니다.
		//위에서 받은 boardVO 를 DAO에서 받아서 DB테이블에 쿼리명령으로 입력합니다.
		@RequestMapping(value="/home/board/board_write",method=RequestMethod.POST)
		public String board_write(BoardVO boardVO) throws Exception {
			//위에서 받은 boardVO를 서비스로 보내기.
			return "redirect:/home/board/board_view";
		}
		//사용자 홈페이지 게시판 쓰기 매핑(GET)
		@RequestMapping(value="/home/board/board_write",method=RequestMethod.GET)
		public String board_write() throws Exception {

			return "home/board/board_write";
		}

		//사용자 홈페이지 게시판 리스트 매핑
		@RequestMapping(value="/home/board/board_list",method=RequestMethod.GET)
		public String board_list(@ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
			//페이지 처리 추가(아래)
			if(pageVO.getPage() == null) {
				pageVO.setPage(1);
			}
			pageVO.setPerPageNum(5);//페이지 하단 페이징번호 개수
			pageVO.setQueryPerPageNum(10);//1페이지당 보여줄 게시물 개수
			int totalCount = boardService.countBoard(pageVO);//페이징의 게시물 전체개수 구하기 
			pageVO.setTotalCount(totalCount);
			List<BoardVO> board_list = boardService.selectBoard(pageVO);
			model.addAttribute("board_list", board_list);
			return "home/board/board_list";
		}
	
	// 사용자 홈페이지 회원 마이페이지 접근 mapping
	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
	public String mypage() throws Exception {
		
		return "home/member/mypage";
	}
	
	// 사용자 홈페이지 회원가입 접근 mapping
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() throws Exception {
		
		return "home/join";
	}
	
	// 사용자 홈페이지 루트(최상위) 접근  mapping
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home() throws Exception{
		
		return "home/home";
	}

	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("환영합니다! 현재 여러분 컴퓨터 언어는 {} 입니다.", locale);
		System.out.println("위에 Locale 클래스를 사용하는 이유는 다국어 지원때문");
		System.out.println("함수-C언어나 자바스크립트-와 메소드-자바, 스프링-는 같은 대상을 가리킨다.");
		System.out.println("함수-메소드-는 함수명(입력값-매개변수-){구현내용}형식이고, 입력값->출력값으로 구현");
		Date date = new Date();
		//Data 날짜관련 클래스형 변수 Date를 선언함. date라는 변수 메소드를 사용가능=오브젝트 됐다고도 한다.
		//Data 변수=실행가능한 변수=클래스형 변수=오브젝트=인스턴스
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//DateFormat이라는 클래스형 변수가 선언->실행 가능한 변수
		String formattedDate = dateFormat.format(date);
		//변수 실행.
		//위 변수가 실행되어서 출력된 결과값이 아래 serverTime 변수값으로 jsp파일로 이동
		model.addAttribute("TomcatserverTime", formattedDate );
		//위 모델이라는 클래스형 변수를 이용해서 serverTime이라는 변수값을 아래 home.jsp로 전송
		System.out.println("현재 서버의 시간은" + formattedDate );
		return "home";//결과적으로 리턴값(출력값)이 home(.jsp 생략됨)에 연동
	}*/
	
}
