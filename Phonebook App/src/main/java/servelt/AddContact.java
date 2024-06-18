package servelt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.dbConnect;
import dao.ContactDao;
import entity.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId = Integer.parseInt(req.getParameter("userId"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String about = req.getParameter("about");

		Contact c= new Contact(name,email,phno,about,userId);
		ContactDao dao= new ContactDao(dbConnect.getConn());
		
		HttpSession session= req.getSession();
		boolean f= dao.saveContact(c);
		if(f)
		{
			session.setAttribute("succMsg", "Your Contact Saved");
		resp.sendRedirect("addContact.jsp");
	
		}
		else {
			session.setAttribute("failedMsg", "Something Went Wrong On Server..");
			resp.sendRedirect("addContact.jsp");
		
		}
	}

}
