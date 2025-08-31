package study2.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/study2/login/LoginMain")
public class LoginMain extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String viewPage = "/WEB-INF/study2/login/loginMain.jsp";
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		if(mid == null) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/study2/login/Login");
			viewPage = "/include/message.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
}
