<%@page import="java.time.LocalTime"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.SQLException" %>
<%@page import="sun.rmi.runtime.Log" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass"/>
<%
if(request.getParameter("page").toString().equals("login")){
    try {
        if(pDAO.loginValidate(request.getParameter("username").toString(), request.getParameter("password").toString())){
            session.setAttribute("userStatus", "1");
            session.setAttribute("userId",pDAO.getUserId(request.getParameter("username")));
            response.sendRedirect("dashboard.jsp");
        }else{
            request.getSession().setAttribute("userStatus", "-1");
            response.sendRedirect("login.jsp");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

}else if(request.getParameter("page").toString().equals("register")){
        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");

            if (pDAO.addNewStudent(fName, lName, uName, email, pass, contactNo, city, address)=="true")
            response.sendRedirect("adm-page.jsp?pgprt=1");
            else if (pDAO.addNewStudent(fName, lName, uName, email, pass, contactNo, city, address)=="fill")
            {
                request.getSession().setAttribute("registerStatus", "-1");
                response.sendRedirect("register.jsp");
            }
            else if (pDAO.addNewStudent(fName, lName, uName, email, pass, contactNo, city, address)=="false"){
                request.getSession().setAttribute("registerStatus", "-2");
                response.sendRedirect("register.jsp");
            }
}
else if(request.getParameter("page").toString().equals("resultstd")){
    String sId =request.getParameter("stdid");
    String sName =request.getParameter("stdname");
    String lName =request.getParameter("stdlname");
    if (sName=="" && lName=="" ) sId="0";
    else {
       sId=String.valueOf(pDAO.getUserId(sName, lName));
    }

    //if (pDAO.addNewStudent(fName, lName, uName, email, pass, contactNo, city, address))
        response.sendRedirect("adm-page.jsp?pgprt=4&sid="+sId);

}else if(request.getParameter("page").toString().equals("editquestion")){

    String fName =request.getParameter("question");
    String lName =request.getParameter("opt1");
    String uName=request.getParameter("opt2");
    String email=request.getParameter("opt3");
    String pass=request.getParameter("opt4");
    String contactNo =request.getParameter("correct");

    int qid=Integer.parseInt(request.getParameter("qid"));

    pDAO.updateQuestion(fName,lName,uName,email,pass,contactNo,qid);
    String cName=request.getParameter("coursename");
    response.sendRedirect("adm-page.jsp?pgprt=5&coursename="+cName);
}else if(request.getParameter("page").toString().equals("editcourse")){

    String cName =request.getParameter("name");
    String time =request.getParameter("time");
    String courseName =request.getParameter("coursename");

    pDAO.updateCourses(cName, time, courseName);
    response.sendRedirect("adm-page.jsp?pgprt=2");
}else if(request.getParameter("page").toString().equals("profile")){

    String fName =request.getParameter("fname");
    String lName =request.getParameter("lname");
    String uName=request.getParameter("uname");
    String email=request.getParameter("email");
    String pass=request.getParameter("pass");
    String contactNo =request.getParameter("contactno");
    String city =request.getParameter("city");
    String address =request.getParameter("address");
    String uType =request.getParameter("utype");
    int uid=Integer.parseInt(session.getAttribute("userId").toString());

    pDAO.updateStudent(uid,fName,lName,uName,email,pass,contactNo,city,address,uType);
    response.sendRedirect("dashboard.jsp");
}else if(request.getParameter("page").toString().equals("courses")){
    if(request.getParameter("operation").toString().equals("addnew")){
//        pDAO.addNewCourse(request.getParameter("coursename"),Integer.parseInt(request.getParameter("totalmarks")),
//                request.getParameter("time"));
        pDAO.addNewCourse(request.getParameter("coursename"),
              request.getParameter("time"));
        response.sendRedirect("adm-page.jsp?pgprt=2");
    }else if(request.getParameter("operation").toString().equals("edit")){
        response.sendRedirect("adm-page.jsp?pgprt=10&cname="+(request.getParameter("cname")));
    }else if(request.getParameter("operation").toString().equals("del")){
        pDAO.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adm-page.jsp?pgprt=2");
    }

}else if(request.getParameter("page").toString().equals("accounts")){
    if(request.getParameter("operation").toString().equals("del")){
        pDAO.delUser(Integer.parseInt(request.getParameter("uid")));
        response.sendRedirect("adm-page.jsp?pgprt=1");
    }

}else if(request.getParameter("page").toString().equals("files")){
    if(request.getParameter("operation").toString().equals("del")){
        pDAO.delFiles(Integer.parseInt(request.getParameter("uid")));
        response.sendRedirect("adm-page.jsp?pgprt=10&cname="+request.getParameter("cname"));
    }

}else if(request.getParameter("page").toString().equals("questions")){
    if(request.getParameter("operation").toString().equals("addnew")){
        pDAO.addQuestion(request.getParameter("coursename"),request.getParameter("question"),
                request.getParameter("opt1"), request.getParameter("opt2"),request.getParameter("opt3"),
        request.getParameter("opt4"), request.getParameter("correct"));
        response.sendRedirect("adm-page.jsp?pgprt=3");
    }else if(request.getParameter("operation").toString().equals("del")){
        pDAO.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adm-page.jsp?pgprt=3");
    }else if(request.getParameter("operation").toString().equals("delQuestion")){
        pDAO.delQuestion(Integer.parseInt(request.getParameter("qid")));
        String cName=request.getParameter("coursename");
        response.sendRedirect("adm-page.jsp?pgprt=5&coursename="+cName);
    }

}else if(request.getParameter("page").toString().equals("exams")){
    if(request.getParameter("operation").toString().equals("startexam")){
        String cName=request.getParameter("coursename");
        int userId=Integer.parseInt(session.getAttribute("userId").toString());
        
        int examId=pDAO.startExam(cName,userId);
        session.setAttribute("examId",examId);
        session.setAttribute("examStarted","1");
        response.sendRedirect("std-page.jsp?pgprt=1&coursename="+cName);
    }else if(request.getParameter("operation").toString().equals("submitted")){
        try{
        String time=LocalTime.now().toString();
        int size=Integer.parseInt(request.getParameter("size"));
        int eId=Integer.parseInt(session.getAttribute("examId").toString());
        int tMarks=Integer.parseInt(request.getParameter("totalmarks"));
        session.removeAttribute("examId");
        session.removeAttribute("examStarted");
        for(int i=0;i<size;i++){
            String question=request.getParameter("question"+i);
            String ans=request.getParameter("ans"+i);
            
            int qid=Integer.parseInt(request.getParameter("qid"+i));
            
            pDAO.insertAnswer(eId,qid,question,ans);
        }
        //System.out.println(tMarks+" conn\t Size: "+size);
        pDAO.calculateResult(eId,tMarks,time,size);
        
        response.sendRedirect("std-page.jsp?pgprt=1&eid="+eId+"&showresult=1");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}else if(request.getParameter("page").toString().equals("logout")){
    session.setAttribute("userStatus","0");
    session.removeAttribute("examId");
    session.removeAttribute("examStarted");
    response.sendRedirect("index.jsp");
}
%>