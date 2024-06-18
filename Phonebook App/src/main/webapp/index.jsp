<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/phone.jpeg");
	width:100%;
	height: 85vh;
	background-repeat: no-repeat;
	background-position: fixed;
	background-size: cover;	
}


    .custom-h1 {
        color: black;
        font-weight:700;
        padding-top:140px;
        text-align:center;
        font-size:45px;
       
                animation: moveDown 2s ease-in-out; /* Apply animation */
           
    }

   @keyframes moveDown {
        0% {
            transform: translateY(-100px); /* Start above the element's original position */
            opacity: 0; /* Start invisible */
        }
        100% {
            transform: translateY(0); /* End at the element's original position */
            opacity: 1; /* End fully visible */
        }
    }



</style>
</head>
<body>
	<%@include file="component/navBar.jsp"%>

  
	
	<div class="container-fluid back-img text-center text-danger">
		<h1 class="mt-0 custom-h1">Welcome to Phone Book</h1>
	</div>
	
	
	<%@include file="component/footer.jsp"%>
</body>
</html>