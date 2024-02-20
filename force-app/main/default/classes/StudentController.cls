public without sharing class StudentController {
   
    public static Integer getStudentRec() {
<<<<<<< HEAD
        System.debug([SELECT Id,Name,Email__c FROM Student__c].size());
        return[SELECT Id,Name,Email__c FROM Student__c].size();
    }

    public void createStudentRec() {
        Student__c stdObj = new Student__c(Name = 'Test', Email__c = 'test@gmail.com');
        System.debug('stdObj-->'+stdObj);
=======
        return[SELECT Id,Name,Email__c FROM Student__c].size();
    }

    public static void createStudentRec() {
        Student__c stdObj = new Student__c(Name = 'Test', Email__c = 'test@gmail.com');
>>>>>>> c688c274e1cdfb0869f16f32b1b36a04eda415f0
        Insert stdObj;
    }
  
}