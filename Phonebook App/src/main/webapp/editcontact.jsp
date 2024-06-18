<%@page import="conn.dbConnect"%>
<%@page import="dao.ContactDao"%>
<%@page import="entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>

<%@include file="component/navBar.jsp"%>
</head>
<body>
    <%
        // Ensure this code is at the very start of the body to prevent output before redirection
        if (session.getAttribute("user") == null) {
            session.setAttribute("invalidMsg", "Login Please..");
            response.sendRedirect("login.jsp");
            return; // Ensure no further processing is done
        }
    %>

    <div class="container-fluid">
        <div class="row p-2">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center text-success">Add Contact Number</h4>
                        <%
                            String failedMsg = (String) session.getAttribute("failedMsg");
                            if (failedMsg != null) {
                        %>
                        <p class="text-danger text-center"><%=failedMsg%></p>
                        <%
                            session.removeAttribute("failedMsg");
                            }
                        %>

                        <form method="post" action="update">
                            <%
                                int cid = Integer.parseInt(request.getParameter("cid"));
                                ContactDao dao = new ContactDao(dbConnect.getConn());
                                Contact c = dao.getContactById(cid);
                            %>
                            <input type="hidden" name="cid" value="<%= c.getId() %>">
                            <div class="mb-3">
                                <label for="name" class="form-label">Enter Name</label> 
                                <input type="text" class="form-control" id="name" name="name" value="<%= c.getName() %>" aria-describedby="nameHelp">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email address</label> 
                                <input type="email" class="form-control" id="email" name="email" value="<%= c.getEmail() %>" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="phno" class="form-label">Enter Phone No.</label> 
                                <input type="number" class="form-control" id="phno" name="phno" value="<%= c.getPhno() %>" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="about" class="form-label">Enter About</label>
                                <textarea class="form-control" id="about" name="about" rows="3"><%= c.getAbout() %></textarea>
                            </div>
                            <div class="text-center mt-2">
                                <button type="submit" class="btn btn-primary">Update Contact</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="component/footer.jsp"%>

</body>
</html>




























<%-- 

<%@page import="conn.dbConnect"%>
<%@page import="dao.ContactDao"%>
<%@page import="entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>

<%@include file="component/navBar.jsp"%>
</head>
<body>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Login Please..");
		response.sendRedirect("login.jsp");

	}
	%>
	
	<%
if (user == null) {
    session.setAttribute("invalidMsg", "Login Please..");
    response.sendRedirect("login.jsp");
}
%>
	

	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Contact Number</h4>
						<%
						/* String succMsg = (String) session.getAttribute("succMsg");
						 */
						String failedMsg = (String) session.getAttribute("failedMsg");
						
					  /* if (succMsg != null) {
						 */ 
							 %>
						<p class="text-success text-center"><%=succMsg%></p>
						
						<% 
						/* session.removeAttribute("succMsg");
						}  */
						 
						if (failedMsg != null) {
						%>
						<p class="text-danger text-center"><%=failedMsg%></p>
						<%
						session.removeAttribute("failedMsg");
						}
						%>

						<form method="post" action="update">

							<%
							int cid = Integer.parseInt(request.getParameter("cid"));
							ContactDao dao = new ContactDao(dbConnect.getConn());
							Contact c = dao.getContactById(cid);
							%>
							<div class="mb-3">
								<label for="name" class="form-label">Enter Name</label> <input
									type="text" class="form-control" id="name" name="name"
									value="<%=c.getName()%>" aria-describedby="nameHelp">
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email address</label> <input
									type="email" class="form-control" id="email" name="email"
									value="<%=c.getEmail()%>" aria-describedby="emailHelp">
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">Enter Phone No.</label> <input
									type="number" class="form-control" id="email" name="phno"
									value="<%=c.getPhno()%>" aria-describedby="emailHelp">
							</div>

							<div class="mb-3">
								<label for="exampleFormControlTextarea1" class="form-label">Enter
									About</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									name="about" rows="3"><%=c.getAbout()%></textarea>
							</div>

							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary">Update
									Contact</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>


</body>
</html>  --%>