
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>


<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a  href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a class="active" href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
                        <a href="adm-page.jsp?pgprt=4"><h2>Results</h2></a>
                        <br>
                        <a href="controller.jsp?page=logout"><h2>LOG OUT</h2></a>

                    </div>
				</div>
			</div>
            <!-- CONTENT AREA -->
            <div class="content-area">
                <div class="title" style="margin-top: 5px;position:center">Edit Question</div>
        <%
               ArrayList list=pDAO.getAllQuestions(request.getParameter("coursename"));
    Questions question=(Questions)list.get(Integer.parseInt(request.getParameter("label"))-1);%>

<div class="central-div form-style-6" style="position: inherit;margin-top: 50px;z-index: -1" >

    <form action="controller.jsp">
        <input type="hidden" name="page" value="editquestion">
        <input type="hidden" name="qid" value="<%=request.getParameter("qedt")%>">
        <input type="hidden" name="coursename" value="<%=request.getParameter("coursename")%>">
        <table>

            <tr>
                <td>
                    <label>Question</label>
                </td>
                <td>
                    <input type="text" name="question" value="<%=question.getQuestion() %>" class="text" placeholder="Question">
                </td>
            </tr>
            <tr>
                <td>
                    <label>First Option</label>
                </td>
                <td>
                    <input type="text"  name="opt1" value="<%=question.getOpt1()  %>" class="text" placeholder="First Option">
                </td>
            </tr>
            <tr>
                <td>
                    <label>Second Option</label>
                </td>
                <td>
                    <input type="text" name="opt2" value="<%=question.getOpt2() %>" class="text" placeholder="Second Option">
                </td>
            </tr>

            <tr>
                <td>
                    <label>Third Option</label>
                </td>
                <td>
                    <input type="text" name="opt3" value="<%=question.getOpt3() %>" class="text" placeholder="Third Option">
                </td>
            </tr>
            <tr>
                <td>
                    <label>Fourth Option</label>
                </td>
                <td>
                    <input type="text" name="opt4" value="<%=question.getOpt4()%>" class="text" placeholder="Fourth Option">
                </td>
            </tr>
            <tr>
                <td>
                    <label>Correct Answer</label>
                </td>
                <td>
                    <input type="text" name="correct" value="<%=question.getCorrect() %>" class="text" placeholder="Correct Answer">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <center>

                        <input type="submit" value="Done" class="button">
                    </center>
                </td>
            </tr>
        </table>
    </form>
</div>
            </div>

