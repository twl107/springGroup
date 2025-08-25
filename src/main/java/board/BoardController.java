package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

@SuppressWarnings("serial")
@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonInterface command = null;		// 인터페이스
		String viewPage = "/WEB-INF/board/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		HttpSession session = request.getSession();	// 세션 인증
		String mid = (String) session.getAttribute("sMid");
		
		if(mid == null) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/study2/login/Login");
			viewPage = "/include/message";
		}
		else if(com.equals("BoardList")) {		// 1. 커맨드에서 처리하고 뷰로 보내기
			command = new BoardListCommand();		// 구현객체 
			command.execute(request, response);
			viewPage += "boardList";						// 가져온 데이터를 뷰페이지로 보냄
		}
		else if(com.equals("BoardInput")) {		// 2. 뷰로 보내기
			viewPage += "boardInput";
		}
		else if(com.equals("BoardInputOk")) {
			command = new BoardInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";			// 처리해서 메시지로 보냄						
		}
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
