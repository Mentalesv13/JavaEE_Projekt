<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<%
    File file;
    File file1;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    String filePath = "C:/Users/Menta/Desktop/ProjektJava/out/artifacts/Project_war_exploded/files";
    String filePath1 = "C:/Users/Menta/Desktop/ProjektJava/web/files";

    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File("c:\\"));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax( maxFileSize );
        try{
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();
            while ( i.hasNext () )
            {
                FileItem fi = (FileItem)i.next();
                if ( !fi.isFormField () )  {
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    file = new File( filePath + File.separator + fileName) ;
                    file1 = new File( filePath1 + File.separator + fileName) ;
                    fi.write( file ) ;
                    fi.write( file1 );
                    pDAO.addNewFiles(request.getParameter("coursename"), fileName);
                    response.sendRedirect("adm-page.jsp?pgprt=10&cname="+request.getParameter("coursename")+"&files=success");
                }
            }

        }catch(Exception ex) {
            System.out.println(ex);
        }
    }else{
        response.sendRedirect("adm-page.jsp?pgprt=10&cname="+request.getParameter("coursename")+"&files=failed");
    }
%>