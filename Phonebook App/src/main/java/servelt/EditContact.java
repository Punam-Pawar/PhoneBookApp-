//

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

@WebServlet("/update")
public class EditContact extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cidStr = req.getParameter("cid");
        HttpSession session = req.getSession();

        if (cidStr == null || cidStr.isEmpty()) {
            session.setAttribute("failedMsg", "Invalid contact ID.");
            resp.sendRedirect("editcontact.jsp");
            return;
        }

        int cid = 0;
        try {
            cid = Integer.parseInt(cidStr);
        } catch (NumberFormatException e) {
            session.setAttribute("failedMsg", "Invalid contact ID.");
            resp.sendRedirect("editcontact.jsp");
            return;
        }

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phno = req.getParameter("phno");
        String about = req.getParameter("about");

        Contact c = new Contact();
        c.setId(cid);
        c.setName(name);
        c.setEmail(email);
        c.setPhno(phno);
        c.setAbout(about);

        ContactDao dao = new ContactDao(dbConnect.getConn());
        boolean f = dao.updateContact(c);
        if (f) {
            session.setAttribute("succMsg", "Your Contact Updated.");
            resp.sendRedirect("viewContact.jsp");
        } else {
            session.setAttribute("failedMsg", "Something went wrong on the server.");
            resp.sendRedirect("editcontact.jsp?cid=" + cid);
        }
    }
}

//
//
//
//
//
//
//
//
//
//
//
//
//
////
////package servelt;
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import conn.dbConnect;
//import dao.ContactDao;
//import entity.Contact;
//@WebServlet("/update")
//public class EditContact extends HttpServlet{
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
//		
//		int cid =Integer.parseInt(req.getParameter("cid"));
//		String name = req.getParameter("name");
//		String email = req.getParameter("email");
//		String phno = req.getParameter("phno");
//		String about = req.getParameter("about");
//
//		Contact c= new Contact();
//		c.setId(cid);
//		c.setName(name);
//		c.setEmail(email);
//		c.setPhno(phno);
//		c.setAbout(about);
//		
//		ContactDao dao= new ContactDao(dbConnect.getConn());
//	HttpSession session= req.getSession();
//	boolean f= dao.updateContact(c);
//	if(f)
//	{
//		session.setAttribute("succMsg", "Your Contact Updated..");
//	resp.sendRedirect("viewContact.jsp");
//
//	}
//	else {
//		session.setAttribute("failedMsg", "Something Went Wrong On Server..");
//		resp.sendRedirect("editcontact.jsp?cid="+cid);
//	
//	}
//}
//
//		
//		
//	}
//
//	
////
