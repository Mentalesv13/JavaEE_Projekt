package myPackage;

import myPackage.classes.*;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


 public class DatabaseClass {
    private Connection conn;
    
    public DatabaseClass() throws ClassNotFoundException, SQLException {
        establishConnection();
    }
    
    private void establishConnection() throws ClassNotFoundException, SQLException {
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_system","root","");
    }
    
    public ArrayList getAllUsers(){
        ArrayList list=new ArrayList();
        User user=null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from users");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                user =new User(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10));
            list.add(user);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
        return list;
    }

     public ArrayList getAllFiles(String cName){
         ArrayList list=new ArrayList();
         Files file=null;
         PreparedStatement pstm;
         try {
             pstm = conn.prepareStatement("Select * from files WHERE course_name=?");
             pstm.setString(1,cName);
             ResultSet rs=pstm.executeQuery();
             while(rs.next()){
                 file =new Files(rs.getInt(1),rs.getString(2),
                         rs.getString(3));
                 list.add(file);
             }
         } catch (SQLException ex) {
             System.out.println(ex.getMessage());

         }
         return list;
     }
    
     public String getUserType(String userId){
        String str="";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from users where user_id=?");
            pstm.setInt(1, Integer.parseInt(userId));
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                str= rs.getString("user_type");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            str= "error";
        }
        return str;
    }
     public int getUserId(String fName, String lName){
        int str=0;
        PreparedStatement pstm;
        try {
            if (fName!="" && lName!=""){
            pstm = conn.prepareStatement("Select * from users where last_name=? and first_name=?");
            pstm.setString(1,lName);
            pstm.setString(2,fName);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                str= rs.getInt("user_id");
            }
            }
            else if (fName=="" && lName!=""){
                pstm = conn.prepareStatement("Select * from users where last_name=?");
                pstm.setString(1,lName);
                ResultSet rs=pstm.executeQuery();
                while(rs.next()){
                    str= rs.getInt("user_id");
                }
            }
            else if (fName!="" && lName==""){
                pstm = conn.prepareStatement("Select * from users where first_name=?");
                pstm.setString(1,fName);
                ResultSet rs=pstm.executeQuery();
                while(rs.next()){
                    str= rs.getInt("user_id");
                }
            }else if (fName=="" && lName==""){
                pstm = conn.prepareStatement("Select * from users");
                ResultSet rs=pstm.executeQuery();
                while(rs.next()){
                    str= rs.getInt("user_id");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
        return str;
    }

     public int getUserId(String uName){
         int str=0;
         PreparedStatement pstm;
         try {
                 pstm = conn.prepareStatement("Select * from users where user_name=?");
                 pstm.setString(1,uName);
                 ResultSet rs=pstm.executeQuery();
                 while(rs.next()){
                     str= rs.getInt("user_id");

             }

         } catch (SQLException ex) {
             System.out.println(ex.getMessage());

         }
         return str;
     }
     
     public User getUserDetails(String userId){
         User userDetails=null;
         
         try {
            String sql="SELECT * from users where user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, userId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                userDetails=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
                                        ,rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)
                                            ,rs.getString(9),rs.getString(10));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
         return userDetails;
     }
     public String addNewFiles(String cName,String filePath){
         try {
             if (cName=="" || filePath=="" ){return "fill";}
             else {
                 String sql = "INSERT into files(course_name, file_path) "
                         + "Values(?,?)";
                 PreparedStatement pstm = conn.prepareStatement(sql);
                 pstm.setString(1, cName);
                 pstm.setString(2, filePath);
                 pstm.executeUpdate();
                 return "true";
             }
         } catch (SQLException ex) {
             //Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
             return "false";
         }
     }
    
    public String addNewStudent(String fName,String lName,String uName,String email,String pass,
            String contact,String city,String address){
        try {
            if (fName=="" || lName=="" || uName=="" || email=="" || pass=="" || contact=="" || city=="" || address==""){return "fill";}
            else {
                String sql = "INSERT into users(first_name,last_name,user_name,email,password,user_type,contact_no,city,address) "
                        + "Values(?,?,?,?,?,?,?,?,?)";
                PreparedStatement pstm = conn.prepareStatement(sql);
                pstm.setString(1, fName);
                pstm.setString(2, lName);
                pstm.setString(3, uName);
                pstm.setString(4, email);
                pstm.setString(5, pass);
                pstm.setString(6, "student");
                pstm.setString(7, contact);
                pstm.setString(8, city);
                pstm.setString(9, address);
                pstm.executeUpdate();
                return "true";
            }
        } catch (SQLException ex) {
            //Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
            return "false";
        }
    }
    public void updateStudent(int uId,String fName,String lName,String uName,String email,String pass,
            String contact,String city,String address,String userType){
        try {
            String sql="Update users"
                    + " set first_name=? , last_name=? , user_name=? , email=? , password=? , user_type=? , contact_no=? , city=? , address=? "
                    + " where user_id=?";
            
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,fName );
            pstm.setString(2,lName );
            pstm.setString(3,uName );
            pstm.setString(4,email );
            pstm.setString(5,pass );
            pstm.setString(6,userType );
            pstm.setString(7,contact );
            pstm.setString(8,city );
            pstm.setString(9,address );
            pstm.setInt(10,uId);
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

     public void updateQuestion(String question,String opt1,String opt2,String opt3,String opt4,String correct, int qId){
         try {
             String sql="Update questions"
                     + " set question=? , opt1=? , opt2=? , opt3=? , opt4=? , correct=?"
                     + " where question_id=?";

             PreparedStatement pstm=conn.prepareStatement(sql);
             pstm.setString(1,question );
             pstm.setString(2,opt1 );
             pstm.setString(3,opt2 );
             pstm.setString(4,opt3);
             pstm.setString(5,opt4 );
             pstm.setString(6,correct );
             pstm.setInt(7,qId);
             pstm.executeUpdate();

         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);

         }
     }

     public void updateCourses(String cName,String time, String courseName){
         try {
             String sql="Update courses"
                     + " set course_name=? , time=?"
                     + " where course_name=?";
             PreparedStatement pstm=conn.prepareStatement(sql);
             pstm.setString(1, cName);
             pstm.setString(2, time);
             pstm.setString(3, courseName);
             pstm.executeUpdate();
             pstm.close();

         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);

         }
     }
    
    public boolean loginValidate(String userName, String userPass) throws SQLException{
        boolean status=false;
    
    String sql="SELECT * FROM users\n"
            + "WHERE user_name=?";
    PreparedStatement pstm=conn.prepareStatement(sql);
    pstm.setString(1,userName);
    ResultSet rs=pstm.executeQuery();
    String uname;
    String pass;
    while(rs.next()){
        uname=rs.getString("user_name");
        pass=rs.getString("password");
        
            if( pass.equals(userPass)){
                  return true;
             } 
        }//end while
         return false;
          
    }
    
    public ArrayList getAllCourses(){
        ArrayList list=new ArrayList();
        try {
            String sql="SELECT * from courses";
            PreparedStatement pstm=conn.prepareStatement(sql);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                String sql1="SELECT count(question_id) from questions WHERE course_name=?";
                PreparedStatement pstm1=conn.prepareStatement(sql1);
                String course = rs.getString(1);
                pstm1.setString(1, course);
                ResultSet rs1=pstm1.executeQuery();
                rs1.next();
                int value = rs1.getInt(1);

                if (value!=0) {
                    list.add(rs.getString(1));
                    list.add(rs.getInt(2));
                }
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

     public ArrayList getAllCoursesTeacher(){
         ArrayList list=new ArrayList();
         try {
             String sql="SELECT * from courses";
             PreparedStatement pstm=conn.prepareStatement(sql);
             ResultSet rs=pstm.executeQuery();
             while(rs.next()){
                     list.add(rs.getString(1));
                     list.add(rs.getInt(2));
                 }
             pstm.close();
         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
         }
         return list;
     }

     public ArrayList getCoursebyName(String cName){
         ArrayList list=new ArrayList();
         try {
             String sql="SELECT * from courses WHERE course_name=?";
             PreparedStatement pstm=conn.prepareStatement(sql);
             pstm.setString(1,cName);
             ResultSet rs=pstm.executeQuery();
             while(rs.next()){
                 list.add(rs.getString(1));
                 list.add(rs.getInt(2));
             }
             pstm.close();
         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
         }
         return list;
     }
    
//    public void addNewCourse(String courseName,int tMarks,String time){
//        try {
//            String sql="INSERT into courses(course_name,total_marks,time) Values(?,?,?)";
//            PreparedStatement pstm=conn.prepareStatement(sql);
//            pstm.setString(1, courseName);
//            pstm.setInt(2,tMarks);
//            pstm.setString(3,time);
//            pstm.executeUpdate();
//            pstm.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }

     public void addNewCourse(String courseName,String time){
         try {
             String sql="INSERT into courses(course_name, time) Values(?,?)";
             PreparedStatement pstm=conn.prepareStatement(sql);
             pstm.setString(1, courseName);
             pstm.setString(2, time);
             pstm.executeUpdate();
             pstm.close();
         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
         }
     }

    public void delCourse(String cName){
        try {
            String sql="DELETE from courses where course_name=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,cName);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void delQuestion(int qId){
        try {
            String sql="DELETE from questions where question_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,qId);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void delUser(int uid){
        try {
            String sql="DELETE from users where user_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,uid);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public void delFiles(int uid){
         try {
             ArrayList list=new ArrayList();
             String sql1="SELECT file_path from files WHERE file_id=?";
             PreparedStatement pstm1=conn.prepareStatement(sql1);
             pstm1.setInt(1,uid);
             ResultSet rs=pstm1.executeQuery();
             while(rs.next()){
                 list.add(rs.getString(1));
             }
             pstm1.close();


             File f=new File("C:\\Users\\Menta\\Desktop\\ProjektJava\\web\\files\\"+list.get(0));
             f.delete();
             File f1=new File("C:\\Users\\Menta\\Desktop\\ProjektJava\\out\\artifacts\\Project_war_exploded\\files\\"+list.get(0));
             f1.delete();


             String sql="DELETE from files where file_id=?";
             PreparedStatement pstm=conn.prepareStatement(sql);
             pstm.setInt(1,uid);
             pstm.executeUpdate();
             pstm.close();
         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
         }
     }
    public void addQuestion(String cName,String question,String opt1,String opt2,String opt3
                                ,String opt4,String correct){
        
        try {
            String sql="INSERT into questions( `question`, `opt1`, `opt2`, `opt3`, `opt4`, `correct`,course_name)"
                    + " VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,question);
            pstm.setString(2,opt1 );
            pstm.setString(3,opt2 );
            pstm.setString(4,opt3);
            pstm.setString(5,opt4 );
            pstm.setString(6,correct );
            pstm.setString(7,cName);
            pstm.executeUpdate();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList getQuestions(String courseName,int questions){
        ArrayList list=new ArrayList();
        try {
            
            String sql="Select * from questions where course_name=? ORDER BY RAND() LIMIT ?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,courseName);
            pstm.setInt(2,questions);
            ResultSet rs=pstm.executeQuery();
            Questions question;
            while(rs.next()){
               question = new Questions(
                       rs.getInt(1),rs.getString(3),rs.getString(4),rs.getString(5),
                       rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(2)
                    ); 
               list.add(question);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public int startExam(String cName,int sId){
        int examId=0;
        try {
            String sql="INSERT into exams(course_name,date,start_time,exam_time,std_id,total_Marks) "
                    + "VALUES(?,?,?,?,?,?)";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,cName);
            pstm.setString(2,getFormatedDate(LocalDate.now().toString()));
            pstm.setString(3,LocalTime.now().toString());
            pstm.setString(4,getCourseTimeByName(cName));
            pstm.setInt(5,sId);
            pstm.setInt(6, getQuestionCount(cName));
            pstm.executeUpdate();
            pstm.close();
            examId=getLastExamId();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return examId;
    }
    public int getLastExamId(){
        int id=0;
         try {
            
            String sql="Select * from exams";
            PreparedStatement pstm=conn.prepareStatement(sql);
            ResultSet rs=pstm.executeQuery();
            
            while(rs.next()){
               id=rs.getInt(1);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
         return id;
    }public String getStartTime(int examId){
        String time="";
        try {
            
            String sql="Select start_time from exams where exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1, examId);
            ResultSet rs=pstm.executeQuery();
            
            while(rs.next()){
               time=rs.getString(1);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return time;
    }
    public String getCourseTimeByName(String cName){
     String c=null;
     try{
         PreparedStatement pstm=conn.prepareStatement("Select time from courses where course_name=?");
         pstm.setString(1,cName);
         ResultSet rs=pstm.executeQuery();
         while(rs.next()){
             c=rs.getString(1);
         }
         pstm.close();
     }catch(Exception e){
          Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, e);
     }
     
     return c;
    }
    public int getTotalMarksByName(String cName){
     int marks=0;
     try{
         PreparedStatement pstm=conn.prepareStatement("Select total_marks from courses where course_name=?");
         pstm.setString(1,cName);
         ResultSet rs=pstm.executeQuery();
         while(rs.next()){
             marks=rs.getInt(1);
             System.out.println(rs.getInt(1));
         }
         pstm.close();
     }catch(Exception e){
          e.printStackTrace();
     }
     
     return marks;
    }
    
    public ArrayList getAllQuestions(String courseName){
        ArrayList list=new ArrayList();
        try {
            
            String sql="Select * from questions where course_name=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,courseName);
            ResultSet rs=pstm.executeQuery();
            Questions question;
            while(rs.next()){
               question = new Questions(
                       rs.getInt(1),rs.getString(3),rs.getString(4),rs.getString(5),
                       rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(2)
                    ); 
               list.add(question);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList getAllAnswersByExamId(int examId){
        ArrayList list=new ArrayList();
        try {
            
            String sql="Select * from answers where exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,examId);
            ResultSet rs=pstm.executeQuery();
            Answers a;
            while(rs.next()){
               a = new Answers(
                       rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
                    ); 
               list.add(a);
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    private  String getFormatedDate(String date){
        LocalDate localDate=LocalDate.parse(date);
        return localDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
    }
    private String getNormalDate(String date){
        String[] d=date.split("-");
        return d[2]+"-"+d[1]+"-"+d[0];
    }
    private String getFormatedTime(String time){
        if(time!=null){
            LocalTime localTime=LocalTime.parse(time);
        return  localTime.format(DateTimeFormatter.ofPattern("hh:mm a"));
        }else{
            
        return  "-";
        }
    }

    public int getRemainingTime(int examId){
        int time=0;
        try {
            
            String sql="Select start_time,exam_time from exams where exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1, examId);
            ResultSet rs=pstm.executeQuery();
            
            while(rs.next()){
                //totalTime-(Math.abs(currentTime-examStartTime))
                //Duration.between(first,sec) returns difference between 2 dates or 2 times
               time=Integer.parseInt(rs.getString(2))-(int)Math.abs((Duration.between(LocalTime.now(),LocalTime.parse(rs.getString(1))).getSeconds()/60));
            }
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(time);
        return time;
    }
   public void insertAnswer(int eId,int qid,String question,String ans){
        try {
            PreparedStatement pstm=conn.prepareStatement("insert into answers(exam_id,question,answer,correct_answer,status) "
                    + "Values(?,?,?,?,?)");
            if (ans==null)
                ans="BRAK";
            pstm.setInt(1,eId);
            pstm.setString(2, question);
            pstm.setString(3,ans);
            String correct=getCorrectAnswer(qid);
            pstm.setString(4, correct);
            pstm.setString(5,getAnswerStatus(ans,correct));
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
   } 

    private String getCorrectAnswer(int qid) {
        String ans="";
        
        try {
            PreparedStatement pstm=conn.prepareStatement("Select correct from questions where question_id=?");
            pstm.setInt(1,qid);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                ans=rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ans;
    }

    private String getAnswerStatus(String ans, String correct) {
        String resp="";
        if(ans.equals(correct)){
            resp="correct";
        }else{
            resp="incorrect";
        }
        return resp;
       
    }
    public ArrayList getAllResultsFromExams(int stdId){
        ArrayList list=new ArrayList();
        Exams exam=null;
        ResultSet rs = null;
        PreparedStatement pstm = null;
        try {
            if(stdId!=0) {
                pstm = conn.prepareStatement("select * from exams where std_id=? order by date desc");
                pstm.setInt(1, stdId);
            }
            else {
                pstm = conn.prepareStatement("select * from exams order by date desc");
            }
            rs=pstm.executeQuery();

            while(rs.next()){
                exam=new Exams(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
                ,rs.getString(6),getFormatedTime(rs.getString(7)),getFormatedTime(rs.getString(8)),rs.getString(9),rs.getString(10));
                list.add(exam);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     public ArrayList getAllResultsFromExams(int stdId, String Name){
         ArrayList list=new ArrayList();
         Exams exam=null;
         try {
             PreparedStatement pstm=conn.prepareStatement("select * from exams where std_id=? and  order by date desc");
             pstm.setInt(1, stdId);
             pstm.setString(2, Name);
             ResultSet rs=pstm.executeQuery();
             while(rs.next()){
                 exam=new Exams(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
                         ,rs.getString(6),getFormatedTime(rs.getString(7)),getFormatedTime(rs.getString(8)),rs.getString(9),rs.getString(10));
                 list.add(exam);
             }
         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
         }
         return list;
     }
     public ArrayList getAllResultsFromExams(String Name){
         ArrayList list=new ArrayList();
         Exams exam=null;
         try {
             PreparedStatement pstm=conn.prepareStatement("select * from exams where std_id=? order by date desc");
             pstm.setString(1, Name);
             ResultSet rs=pstm.executeQuery();
             while(rs.next()){
                 exam=new Exams(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
                         ,rs.getString(6),getFormatedTime(rs.getString(7)),getFormatedTime(rs.getString(8)),rs.getString(9),rs.getString(10));
                 list.add(exam);
             }
         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
         }
         return list;
     }

     public ArrayList getAllResultsFromExams(){
         ArrayList list=new ArrayList();
         Exams exam=null;
         try {
             PreparedStatement pstm=conn.prepareStatement("select * from exams order by date desc");
             ResultSet rs=pstm.executeQuery();
             while(rs.next()){
                 exam=new Exams(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
                         ,rs.getString(6),getFormatedTime(rs.getString(7)),getFormatedTime(rs.getString(8)),rs.getString(9),rs.getString(10));
                 list.add(exam);
             }
         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
         }
         return list;

     }
    public void calculateResult(int eid,int tMarks,String endTime,int size){
        
        try {
            String sql="update exams "
                    + "set obt_marks=?, end_time=?,status=? "
                    + "where exam_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            int obt=getObtMarks(eid,tMarks,size);
            pstm.setInt(1,obt );
            pstm.setString(2,endTime);
            float percent=((obt*100.0f)/size);
            if(percent<50.0f) {
                pstm.setString(3,"Fail (2) " + String.format("%.2f", percent));
            }
            else if(percent<=75.0f){
                pstm.setString(3,"Pass (3) " + String.format("%.2f", percent));
            }else if (percent<=90.0f){
                pstm.setString(3,"Pass (4) " + String.format("%.2f", percent));
            }
            else if (percent<=100.0f){
                pstm.setString(3,"Pass (5) " + String.format("%.2f", percent));
            }
            pstm.setInt(4, eid);
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private int getObtMarks(int examId,int tMarks,int size) {
    int m=0;
    
        try {
            PreparedStatement pstm=conn.prepareStatement("select count(answer_id) from answers "
                    + "where exam_id=? and status='correct'");
            pstm.setInt(1, examId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
               m= rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        //float rat=(float)tMarks/size;
        //System.out.println(rat);
        //rat=m*rat;
        //System.out.println(rat);
    return m;
    }

     private int getQuestionCount(String courseName) {
         int m=0;

         try {
             PreparedStatement pstm=conn.prepareStatement("select count(question_id) from questions "
                     + "where course_name=?");
             pstm.setString(1, courseName);
             ResultSet rs=pstm.executeQuery();
             while(rs.next()){
                 m= rs.getInt(1);
             }
         } catch (SQLException ex) {
             Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
         }
         return m;
     }

     public Exams getResultByExamId(int examId){
        Exams exam=null;
        try {
            PreparedStatement pstm=conn.prepareStatement("select * from exams where exam_id=?");
            pstm.setInt(1, examId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                exam=new Exams(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
                ,rs.getString(6),getFormatedTime(rs.getString(7)),getFormatedTime(rs.getString(8)),rs.getString(9),rs.getString(10));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exam;
        
    }

    public void finalize(){
        try{
            if(conn!=null)
                conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
   
}