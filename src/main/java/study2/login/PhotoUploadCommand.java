package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.File;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@SuppressWarnings("serial")
@WebServlet("*.lo")
public class PhotoUploadCommand extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/");
		int maxSize = 1024 * 1024 * 5; // 최대 5MB
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		LoginDAO dao = new LoginDAO();
		
		dao.updatePhoto(mid, filesystemName);
		
		session.setAttribute("sPhoto", filesystemName);
		
		response.sendRedirect(request.getContextPath() + "/study2/login/LoginMain");
		
	}
}
