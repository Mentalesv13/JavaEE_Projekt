
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="myPackage.classes.User" %>
<%@ page import="myPackage.classes.Files" %>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!-- SIDEBAR -->
<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
	<div class="sidebar-background" >
		<h2 class="logo-text">
			Online Examination System
		</h2>

		<div class="left-menu">
			<a  href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
			<a class="active" href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
			<a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
			<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
			<a href="adm-page.jsp?pgprt=4"><h2>Results</h2></a>
			<br>
			<a href="controller.jsp?page=logout"><h2>LOG OUT</h2></a>

		</div>
	</div>
</div>
<!-- CONTENT AREA -->
<div class="content-area">
	<div class="title" style="margin-top: 5px;position:center;z-index: 1">Edit Course</div>
	<%
		String cName = request.getParameter("cname");
		ArrayList list=pDAO.getCoursebyName(cName);
	%>

	<div class="central-div form-style-6" style="position: inherit;margin-top: 50px;" >

		<form action="controller.jsp">
			<input type="hidden" name="page" value="editcourse">
			<input type="hidden" name="coursename" value="<%=request.getParameter("cname")%>">
			<table>

				<tr>
					<td>
						<label>Course Name</label>
					</td>
					<td>
						<input type="text" name="name" value="<%=list.get(0) %>" class="text" placeholder="Question">
					</td>
				</tr>
				<tr>
					<td>
						<label>Time</label>
					</td>
					<td>
						<input type="text"  name="time" value="<%=list.get(1)  %>" class="text" placeholder="First Option">
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

		<div  class="panel form-style-6" style="max-width: 450px; margin-left:15px; float:right" >
			<div class="title">
				Add File to Course
			</div>
			<center>
				<form action="fileupload.jsp?coursename=<%=request.getParameter("cname")%>" method="post" enctype="multipart/form-data">
					<br>
					<table>
						<tr>
							<td><label>Select file:</label></td>
							<td><input type="file" name="file" size="50" placeholder="File"  style="width: 230px" /></td>
						</tr>

						<tr>
							<td colspan="2">
								<center><input type="submit" value="Upload File" /></center></td>
						</tr>
					</table>

				</form>

			</center>

</div>

	<div class="inner" style="margin-top: 300px;">
		<div class="title" style="margin-top: -30px">List of All Added Files</div>
	<br>
		<cetner>
	<table id="one-column-emphasis" >
		<colgroup>
			<col class="oce-first" />
		</colgroup>
		<thead>
		<tr>
			<th scope="col">Id</th>
			<th scope="col">Path</th>
			<th scope="col">Display</th>
			<th scope="col">Delete</th>

		</tr>
		</thead>
		<tbody>

		<%
			ArrayList list3=pDAO.getAllFiles(cName);
			Files file;
			for(int i=0;i<list3.size();i++){
				file=(Files)list3.get(i);
		%>

		<tr>
			<td><%=file.getFileId() %></td>
			<td><%=file.getFilePath() %></td>
			<td><center><a href="files/<%=file.getFilePath() %>"  target="_blank">
				<div class="edit-btn" style="max-width: 40px;font-size: 17px; padding: 3px">View</div>
			</a></center></td>
			<td><center><a href="controller.jsp?page=files&cname=<%=cName%>&operation=del&uid=<%=file.getFileId() %>"
				   onclick="return confirm('Are you sure you want to delete this ?');">
				<div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
			</a></center></td>

		</tr>



		<%

			}%>

		</tbody>
	</table>
		</cetner>
	</div>