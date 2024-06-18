
package servelt;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.dbConnect;
import dao.UserDao;
import entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		String name= req.getParameter("name");
		String email= req.getParameter("email");
		String password= req.getParameter("password");
		
		User u= new User(name,email,password);
		
		UserDao dao = new UserDao(dbConnect.getConn());
		boolean f=dao.userRegister(u);
		HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("successMsg","user Register Successfully..");
			res.sendRedirect("register.jsp");
			//System.out.println("user Register Successfully...");
		}
		else {
			session.setAttribute("failMsg","Something Wrong on server..");
			res.sendRedirect("register.jsp");
			//System.out.println("error");
		}
		
	}
}
