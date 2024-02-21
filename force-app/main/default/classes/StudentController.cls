public without sharing class StudentController {
   
    public static Integer getStudentRec() {

        System.debug([SELECT Id,Name,Email__c,Date1__c FROM Student__c].size());
        return[SELECT Id,Name,Email__c FROM Student__c].size();
    }

 
}