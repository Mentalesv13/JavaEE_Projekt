<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%
	if(session.getAttribute("userStatus")!=null){
		if(session.getAttribute("userStatus").equals("1")){
			if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("admin")){
%>
	<center>
		<div class="central-div" style="top:10%">
                    <form action="controller.jsp">
                        <input type="hidden" name="page" value="register"> 
				<table>
					<tr>
						<td colspan="2">
							<center><h2>Register New User</h2></center>
						</td>
					</tr>
					<tr>
						<td>
							<label>First Name</label>
						</td>
						<td>
                                                    <input type="text" name="fname" class="text" placeholder="First Name">
						</td>
					</tr>
					<tr>
						<td>
							<label>Last Name</label>
						</td>
						<td>
                                                    <input type="text"  name="lname" class="text" placeholder="Last Name">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Username</label>
						</td>
						<td>
                                                    <input type="text" name="uname" class="text" placeholder="Username">
						</td>
					</tr>
					<tr>
						<td>
							<label>Email</label>
						</td>
						<td>
                                                    <input type="email" name="email" class="text" placeholder="Email">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Password</label>
						</td>
						<td>
                                                    <input type="password" name="pass" class="text" placeholder="Password">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Contact No</label>
						</td>
						<td>
                                                    <input type="text" name="contactno" class="text" placeholder="Contact No">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>City</label>
						</td>
						<td>
                                                    <input type="text" name="city" class="text" placeholder="City">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Address</label>
						</td>
						<td>
                                                    <input type="text" name="address" class="text" placeholder="Address">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<%
								if(request.getSession().getAttribute("registerStatus")!=null){
									//System.out.println("called");
									if(request.getSession().getAttribute("registerStatus").equals("-1")){
										//System.out.println("inside");
							%>

							<p style="color: rgba(255, 255, 51, 1);font-size: 17px">Please fill all fields.</p>
							<br>
							<%
							} else if(request.getSession().getAttribute("registerStatus").equals("-2")){

							%>
							<p style="color: rgba(255, 255, 51, 1);font-size: 17px">Username or email already exists.</p>
							<br>
							<%

									}
								}
							%>
						</td>
					</tr>
				</table>
						<center>
							<input type="submit" value="Register Now" class="button" style="align-content: center">
						</center>
			</form>
		</div>
	</center>
<%}
else{
	session.setAttribute("userStatus","0");
	session.removeAttribute("examId");
	session.removeAttribute("examStarted");
	response.sendRedirect("index.jsp");
}
}else response.sendRedirect("login.jsp");
}else response.sendRedirect("login.jsp");

%>
</body>
</html>