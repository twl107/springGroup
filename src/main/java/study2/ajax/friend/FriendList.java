package study2.ajax.friend;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import study2.login.LoginDAO;
import study2.login.LoginVO;

@SuppressWarnings("serial")
@WebServlet("/study2/ajax/friend/FriendList")
public class FriendList extends HttpServlet {

	@SuppressWarnings("unchecked")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		List<LoginVO> vos = dao.getLoginList();
		Map<String, String> map = new HashMap<String, String>();
		
		JSONArray jArray = new JSONArray();
		
		for(LoginVO vo : vos) {
			map.put("mid", vo.getMid());
			map.put("nickName", vo.getNickName());
			map.put("name", vo.getName());
			map.put("age", vo.getAge()+"");
			map.put("gender", vo.getGender());
			map.put("address", vo.getAddress());
			
			JSONObject jObj = new JSONObject(map);
			jArray.add(jObj);
		}
		response.getWriter().write(jArray + "");
	}
	
}
