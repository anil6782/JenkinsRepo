public without sharing class StudentController {
   
    public static Integer getStudentRec() {

        System.debug([SELECT Id,Name,Email__c FROM student__c].size());
        return[SELECT Id,Name,Email__c FROM student__c].size();
    }

   
  
}
