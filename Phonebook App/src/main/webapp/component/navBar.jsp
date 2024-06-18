
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entity.User"%>

<!-- <nav class="navbar navbar-expand-lg bg-body-primary ">

	 -->
	 
	<nav class="navbar navbar-expand-lg bg-primary">
	
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-phone"></i>PhoneBook</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-solid fa-house"></i>Home</a></li>
				<li class="nav-item active"><a class="nav-link active"
					href="addContact.jsp"><i class="fa-solid fa-square-plus"></i>Add
						Phone number</a></li>
				<li class="nav-item active"><a class="nav-link active"
					href="viewContact.jsp"><i class="fa-solid fa-eye"></i>View Contact</a></li>
			</ul>


			<%
			User user = (User) session.getAttribute("user");

			if (user == null) {
			%>
			<form class="form-inline my-2 my-lg-0">
				<a href="login.jsp" class="btn btn-success"> <i
					class="fa-solid fa-right-to-bracket"></i>Login
				</a> <a href="register.jsp" class="btn btn-danger ml-2"><i
					class="fa-solid fa-user"></i>Register</a>
			</form>

			<%
			} else {
			%>
			<form class="form-inline my-2 my-lg-0">
				<button class=" btn btn-success"><%=user.getName()%></button>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal"
					 class="btn btn-danger ml-2 text-white">Logout</a>
			</form>
			<%
			}
			%>


			<!-- Logout popup -->
			<!-- Button trigger modal -->
			<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button> -->

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
								title</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body text-center">
						<h6>Do You Want To Logout</h6>
						<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<a href="logout"  class="btn btn-primary">Logout
							</a>
						
						</div>
						<div class="modal-footer">
							
						</div>
					</div>
				</div>
			</div>



		</div>
	</div>
</nav>