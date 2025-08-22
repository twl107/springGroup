package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;
import study2.exam.LoginVO;
import study2.login.LoginDAO;

public class AdminOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();

		study2.login.LoginVO vo = dao.getLoginIdCheck(mid);
		

		if(vo.getMid() != null) {
			String salt = vo.getPwd().substring(0, 5);
			pwd = salt + (Integer.parseInt(pwd) ^ Integer.parseInt(salt)) + "";
			
			if(vo.getPwd().equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("sAdmin", "adminOK");
				
				request.setAttribute("message", "관리자 인증 성공!!!");
				request.setAttribute("url", "GuestList.gu");
			}
		}
		else {
			request.setAttribute("message", "관리자 인증 실패~~");
			request.setAttribute("url", "Admin.gu");
		}
	}

}
