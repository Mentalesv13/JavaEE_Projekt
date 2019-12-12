
<%@page import="myPackage.classes.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<%if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("admin")){
%>
<!-- SIDEBAR -->

			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                        <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a class="active" href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
                        <a href="adm-page.jsp?pgprt=4"><h2>Results</h2></a>
                        <br>
                        <a href="controller.jsp?page=logout"><h2>LOG OUT</h2></a>

                    </div>
				</div>
			</div>
            <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="inner" style="margin-top: 50px">
                                <div class="title" style="margin-top: -30px">List of All Registered Persons</div>
       
                                <br>
                                <br>
                                <br/>
                                <a href="register.jsp" class="button"><span class="add-btn" style="margin-left: 80px;">Add New Person</span></a>
           <br>
           
           
                       <table id="one-column-emphasis" >
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
    	<tr>
        	<th scope="col">Name</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Number</th>
            <th scope="col">City</th>
            <th scope="col">Address</th>
            <th scope="col">Action</th>
            
        </tr>
    </thead>
    <tbody>

           <%
              ArrayList list=pDAO.getAllUsers();
              User user;
              for(int i=0;i<list.size();i++){
                  user=(User)list.get(i);
                  if(user.getUserId()!= Integer.parseInt(session.getAttribute("userId").toString())){
               %>
   
    	<tr>
        	<td><%=user.getFirstName()+" "+user.getLastName() %></td>
            <td><%=user.getUserName() %></td>
            <td><%=user.getEmail() %></td>
            <td><%=user.getContact() %></td>
            <td><%=user.getCity() %></td>
            <td><%=user.getAddress() %></td>
            <td><a href="controller.jsp?page=accounts&operation=del&uid=<%=user.getUserId() %>" 
                  onclick="return confirm('Are you sure you want to delete this ?');">
                <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
                </a></td>
            
        </tr>

               
               
               <%
                  }
                  }

                   }
                   else{    session.setAttribute("userStatus","0");
                      session.removeAttribute("examId");
                      session.removeAttribute("examStarted");
                      response.sendRedirect("index.jsp");;
    }%>
               
                </tbody>
    </table>

    </div>
</div>