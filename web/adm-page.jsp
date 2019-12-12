
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!DOCTYPE html>
<html>
<head>
	<title>Teacher Panel</title>
	<link rel="stylesheet" type="text/css" href="style-backend.css">
</head>
<body>
	<div class="top-area">
		<center><h2>Teacher Panel</h2></center>
	</div>

        <%
            if(session.getAttribute("userStatus")!=null){
            if(session.getAttribute("userStatus").equals("1")){
                if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("admin")){
            %>
            
            
            
            
            
            <% 
            //pgpart = pagepart, accounts=1,courses=2,questions=3 and profile is default
            if(request.getParameter("pgprt").equals("1")){
                
            %>
            
                <jsp:include page="accounts.jsp"/>
            
            <%
                
            }else if(request.getParameter("pgprt").equals("2")){
            
                %>
            
                <jsp:include page="courses.jsp"/>
                
                <%
                
            }else if(request.getParameter("pgprt").equals("3")){
                %>
            
                <jsp:include page="questions.jsp"/>
            <%
            }else if(request.getParameter("pgprt").equals("4")){
                %>
            
                <jsp:include page="resultsall.jsp"/>
            <%
            }else if(request.getParameter("pgprt").equals("5")){
                  %>
                <jsp:include page="showall.jsp"/>
                <%
                }
                else if(request.getParameter("pgprt").equals("9")){
                %>
    <jsp:include page="editquestion.jsp"/>
    <%
    }else if(request.getParameter("pgprt").equals("10")){
                %>
    <jsp:include page="edit-courses.jsp"/>
        <%
    }
            else{
                %>
            
                <jsp:include page="profile.jsp"/>
            
            <%
            }
            %>
            
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
</html>