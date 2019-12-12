
package myPackage.classes;


public class Files {
   private int fileId;
   private String courseName, filePath;

   public Files(){

   }

    public Files(int fileId, String courseName, String filePath) {
        this.fileId = fileId;
        this.courseName = courseName;
        this.filePath = filePath;
    }

    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
