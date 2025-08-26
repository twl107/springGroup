package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

public class BoardGoodCheckPlusMinusCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int gooCnt = (request.getParameter("gooCnt")==null || request.getParameter("gooCnt").equals("")) ? 0 : Integer.parseInt(request.getParameter("gooCnt"));
		int res = 0;
		
		BoardDAO dao = new BoardDAO();
		
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		List<Integer> goodIdx = (List<Integer>)session.getAttribute("goodIdx");
		
		if(goodIdx==null) {
			goodIdx = new ArrayList<Integer>();
		}
		
		if(!goodIdx.contains(idx)) {
			res = dao.setBoardGoodCheckPlusMinus(idx, gooCnt);
			goodIdx.add(idx);
		}
		
		session.setAttribute("goodIdx", goodIdx);
		
		response.getWriter().write(res + "");
	}

}
