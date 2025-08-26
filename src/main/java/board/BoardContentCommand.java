package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

public class BoardContentCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		List<Integer> viewIdx = (List<Integer>)session.getAttribute("viewIdx");
		
		if(viewIdx==null) {
			viewIdx = new ArrayList<Integer>();
		}
		
		if(!viewIdx.contains(idx)) {
			dao.setBoardReadNumPlus(idx);
			viewIdx.add(idx);
		}
		
		session.setAttribute("viewIdx", viewIdx);
		
		BoardVO vo = dao.getBoarContent(idx);
		
		request.setAttribute("vo", vo);
		
	}

}
