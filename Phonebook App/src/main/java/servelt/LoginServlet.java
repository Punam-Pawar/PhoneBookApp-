package servelt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.dbConnect;
import dao.UserDao;
import entity.User;
@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email= req.getParameter("email");
		String pass= req.getParameter("password");
		
		UserDao dao= new UserDao(dbConnect.getConn());
		User u= dao.loginUser(email,pass);
		HttpSession session= req.getSession();
		
		if(u!=null)
		{
			session.setAttribute("user",u);
			resp.sendRedirect("index.jsp");
			
			//System.out.println("User is Avaible" +u);
		
		}
		
		else {
			//System.out.println("user is not Avaible");
			session.setAttribute("invalidMsg","Invalid Email and Password");
			resp.sendRedirect("login.jsp");
		}
	}


}
