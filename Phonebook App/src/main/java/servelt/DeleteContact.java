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
@WebServlet("/delete")
public class DeleteContact extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	int cid=Integer.parseInt( req.getParameter("cid"));
	
	ContactDao dao= new ContactDao(dbConnect.getConn());
	boolean f= dao.deleteContactById(cid);
	HttpSession session= req.getSession();
	
	if(f)
	{
		session.setAttribute("succMsg", "Contact delete successfully..");
		resp.sendRedirect("viewContact.jsp");
	}
	else {
		session.setAttribute("failedMsg", "Something Went Wrong..");
		resp.sendRedirect("viewContact.jsp");


	}
		
	}
	
	
	}

	

