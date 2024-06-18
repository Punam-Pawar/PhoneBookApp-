

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
body{
background-color: #b8b6b6
}

</style>
</head>
<body>
<%@include file="component/navBar.jsp"%>
 
 <%if(user==null){
	 session.setAttribute("invalidMsg","Login Please..");
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
                    String succMsg =(String)session.getAttribute("succMsg"); 
                  String failedMsg= (String)session.getAttribute("failedMsg");
                    if(succMsg!=null)
                   {%>
                  <p class="text-success text-center"><%= succMsg%></p>
                   <%
                   session.removeAttribute("succMsg");
                   }
                   if(failedMsg!=null)
                   {%>
                   <p class="text-danger text-center"><%= failedMsg%></p>
                    <%
                    session.removeAttribute("failedMsg");
                    }
                
               
                   %>
                    
                    <form method="post" action="addContact">
                     <%
                     if(user!=null)
                     { %>
                    	 <input type="hidden" value="<%=user.getId() %>" name= "userId">  
                         
                      <%}
                     %>
                        <div class="mb-3">
                            <label for="name" class="form-label">Enter Name</label>
                            <input type="text" class="form-control" id="name" name="name" aria-describedby="nameHelp">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
                        </div>
                        
                        <div class="mb-3">
                            <label for="email" class="form-label">Enter Phone No.</label>
                            <input type="number" class="form-control" id="email" name="phno" aria-describedby="emailHelp">
                        </div>
                        
                        <div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Enter About</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" name="about" rows="3"></textarea>
</div>
                        
                        <div class="text-center mt-2">
                            <button type="submit" class="btn btn-primary">Save Contact</button>
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