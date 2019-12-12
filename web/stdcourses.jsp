
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
			<a href="std-page.jsp?pgprt=0"><h2>Profile</h2></a>
			<a class="active" href="std-page.jsp?pgprt=6"><h2>Courses</h2></a>
			<a href="std-page.jsp?pgprt=1"><h2>Exams</h2></a>
			<a href="std-page.jsp?pgprt=2"><h2>Results</h2></a>
			<br>
			<a href="controller.jsp?page=logout"><h2>LOG OUT</h2></a>

		</div>
	</div>
</div>
<!-- CONTENT AREA -->
<div class="content-area">

	<div class="title" style="margin-top: 5px;position:center;z-index: 1">Courses module</div>
	<div class="inner" style="margin-top: 30px;">
<br>
			<table id="one-column-emphasis">
				<colgroup>
					<col class="oce-first" />
				</colgroup>
				<thead>
				<tr>
					<th scope="col">Course Name</th>
					<th scope="col">File</th>
					<th scope="col">Display</th>

				</tr>
				</thead>
				<tbody>
				<tr bgcolor="#FFFFFF"><td><label> </label></td><td><label> </label></td><td><label> </label></td></tr>
				<%		ArrayList list=pDAO.getAllCoursesTeacher();
					for(int i=0;i<list.size();i=i+2){%>
				<tr>
					<td>
						<label><%=list.get(i).toString()%></label>

					</td>
					<%
					ArrayList list1=pDAO.getAllFiles(list.get(i).toString());
		Files file;
					if(list1.isEmpty()){%>
					<td>
						<label>There is no file for this course.</label>
					</td>
					<td>
						<label> </label>
					</td>
					<%}else{
			for(int j=0;j<list1.size();j++){
				file=(Files)list1.get(j); %>
					<% if (j>0){ %>
					<td bgcolor="#FFFFFF">
						<label> </label>
					</td><%}%>
					<td>
						<label><%=file.getFilePath()%></label>
					</td>
					<td><center><a href="files/<%=file.getFilePath() %>"  target="_blank">
						<div class="edit-btn" style="max-width: 40px;font-size: 17px; padding: 3px">View</div>
					</a></center></td>
				</tr>
				<%}%>
				<tr bgcolor="#FFFFFF"><td><label> </label></td><td><label> </label></td><td><label> </label></td></tr>
				<%
					}
					}%>
				</tbody>
			</table>
	</div>
</div>
