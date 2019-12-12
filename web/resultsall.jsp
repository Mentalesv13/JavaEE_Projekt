
<%@page import="myPackage.classes.Answers"%>
<%@page import="myPackage.classes.Exams"%>
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="myPackage.classes.User" %>
<jsp:useBean id="pDAO" scope="page" class="myPackage.DatabaseClass" />
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
                        <a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
                        <a class="active" href="adm-page.jsp?pgprt=4"><h2>Results</h2></a>
                        <br>
                        <a href="controller.jsp?page=logout"><h2>LOG OUT</h2></a>

                    </div>
				</div>
		
                       </div>
               <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 900px">
                                
        <%
            if(request.getParameter("eid")==null&&request.getParameter("sid")==null){
        %>
                                    <div class="title">All Results</div>
                                    <table id="rounded-corner">
                                        <thead>
                                        <tr>
                                            <th scope="col" class="rounded-company">Student ID</th>
                                            <th scope="col" class="rounded-company">Student Name</th>
                                            <th scope="col" class="rounded-company">Date</th>
                                            <th scope="col" class="rounded-q1">Course</th>
                                            <th scope="col" class="rounded-q2">Time</th>
                                            <th scope="col" class="rounded-q3">Status</th>
                                            <th scope="col" class="rounded-q4">Action</th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <%
                                            ArrayList list=pDAO.getAllResultsFromExams();
                                            for(int i=0;i<list.size();i++){
                                                Exams e=(Exams)list.get(i);
                                                User u = pDAO.getUserDetails(e.getStdId());
                                        %>
                                        <tr>
                                            <td><%=e.getStdId() %></td>
                                            <td><%=u.getFirstName()+" "+u.getLastName() %></td>
                                            <td><%=e.getDate() %></td>
                                            <td><%=e.getcName() %></td>
                                            <td><%=e.getStartTime()+" - "+e.getEndTime()%></td>
                                            <% if(e.getStatus()!=null){
                                                if(e.getStatus().contains("Pass")){%>
                                            <td style="background: #00cc33;color:white"><%=e.getStatus()%></td>
                                            <% }else{%>
                                            <td style="background: #ff3333;color:white"><%=e.getStatus()%></td>
                                            <% }
                                            }else{%>
                                            <td style="background: bisque ;">Terminated</td>
                                            <% } %>
                                            <td><a href="adm-page.jsp?pgprt=4&eid=<%=e.getExamId()%>">Details</a></td>
                                        </tr>

                                        <% }
                                        %>

                                        </tbody>
                                    </table>
                                    <form method='post' action="controller.jsp">
                                        <input type="hidden" name="page" value="resultstd">
                                        <input type="text" class="text" placeholder="First Name" name="stdname">
                                        <input type="text" class="text" placeholder="Last Name" name="stdlname">
                                        <input type="submit" value="Search" class="button">
                                            <%
            }else if(request.getParameter("sid")!=null){
        %>
                                        <div class="title">All Results</div>
                                        <table id="rounded-corner">
                                            <thead>
                                            <tr>
                                                <th scope="col" class="rounded-company">Student ID</th>
                                                <th scope="col" class="rounded-company">Student Name</th>
                                                <th scope="col" class="rounded-company">Date</th>
                                                <th scope="col" class="rounded-q1">Course</th>
                                                <th scope="col" class="rounded-q2">Time</th>
                                                <th scope="col" class="rounded-q3">Status</th>
                                                <th scope="col" class="rounded-q4">Action</th>
                                            </tr>
                                            </thead>

                                            <tbody>

                                            <%
                                                ArrayList list=pDAO.getAllResultsFromExams(Integer.parseInt(request.getParameter("sid")));
                                                for(int i=0;i<list.size();i++){
                                                    Exams e=(Exams)list.get(i);
                                                    User u = pDAO.getUserDetails(e.getStdId());
                                            %>
                                            <tr>
                                                <td><%=e.getStdId() %></td>
                                                <td><%=u.getFirstName()+" "+u.getLastName() %></td>
                                                <td><%=e.getDate() %></td>
                                                <td><%=e.getcName() %></td>
                                                <td><%=e.getStartTime()+" - "+e.getEndTime()%></td>
                                                <% if(e.getStatus()!=null){
                                                    if(e.getStatus().contains("Pass")){%>
                                                <td style="background: #00cc33;color:white"><%=e.getStatus()%></td>
                                                <% }else{%>
                                                <td style="background: #ff3333;color:white"><%=e.getStatus()%></td>
                                                <% }
                                                }else{%>
                                                <td style="background: bisque ;">Terminated</td>
                                                <% } %>
                                                <td><a href="adm-page.jsp?pgprt=4&eid=<%=e.getExamId()%>">Details</a></td>
                                            </tr>

                                            <% }
                                            %>

                                            </tbody>
                                        </table>
                                        <form method='post' action="controller.jsp">
                                            <input type="hidden" name="page" value="resultstd">
                                           <!-- <input type="text" class="text" placeholder="StudentID" name="stdid">-->
                                            <input type="text" class="text" placeholder="First Name" name="stdname">
                                            <input type="text" class="text" placeholder="Last Name" name="stdlname">
                                            <input type="submit" value="Search" class="button">


       <%
            }else{
                %>
                <div class="title">Result Details</div>
                <table id="gradient-style" >
                
                <%
                ArrayList list=pDAO.getAllAnswersByExamId(Integer.parseInt(request.getParameter("eid")));
                for(int i=0;i<list.size();i++){
                    Answers a=(Answers) list.get(i);
                
            %>

            
                <tr>
                    <td rowspan="2"><%=i+1 %>)</td>
                    <td colspan="2"><%=a.getQuestion()%></td>
                    <td rowspan="2"><%=a.getStatus() %></td>
                </tr>
                <tr >
                    <td><%="Your Ans: "+a.getAnswer()%></td>
                    <td><%="Correct Ans: "+a.getCorrectAns() %></td>
                </tr>
                <tr>
                    <td colspan="3" style="background: white"></td>
                <%
                }
                %>
            </table>
                    
            
            <%
            }
            %>
                            </div>
            </div>