public class userSignupExtension {

    public Account acc;
    public blob file { get; set; }
    public Boolean userSignup {get; set;}
    Public attachment objAttachment{get; set;}

    public userSignupExtension(ApexPages.StandardController stdController) {
       userSignup= true;
       acc = (Account)stdController.getRecord();
       objAttachment = new Attachment();
    }

     public PageReference saveUser() {
       try {
             if(notExistingUser()){
                 Account accObj = getAccountDetails();
                 accObj.Name = acc.Name;
                 accObj.Email__c = acc.Email__c;
                 accObj.Phone = acc.Phone;
                 accObj.Date_of_Birth__c = acc.Date_of_Birth__c;
                 accObj.Visa_Status__c = acc.Visa_Status__c;
                 accObj.Current_City__c = acc.Current_City__c;
                 accObj.Highest_Qualification__c = acc.Highest_Qualification__c;
                 accObj.Company_Name_If_working__c = acc.Company_Name_If_working__c;
                 accObj.Skill_Set__c = acc.Skill_Set__c;
                 accObj.Type = 'Sanatan Yuva';
                 update (accObj);
                 uploadCV();
             }else{
                 acc.Type = 'Sanatan Yuva';
                 insert acc;
                 uploadCV();
             }
       }
       catch(System.DMLException e) {
           ApexPages.addMessages(e);
           return null;
      }
      // PageReference p = Page.ThankYou;
      // p.setRedirect(true);
       userSignup = false;
       return null;
     }
     
     public void uploadCV(){
        if(objAttachment!=null && objAttachment.Body!=null){
            Account acc= getAccountDetails();
            List<Attachment> lstAttachments= [SELECT Id FROM ATTACHMENT Where ParentId =: acc.Id];
            if(lstAttachments.size()>0){
                delete lstAttachments;
            }
            objAttachment.Name = 'CV';
            objAttachment.ParentId = acc.id;
            insert objAttachment;
        }
     }
     
     public Account getAccountDetails(){
         return [Select Id FROM Account Where Email__c =: acc.Email__c limit 1];
     }
     
     public Boolean notExistingUser(){
         List<Account> accUserList = [Select Id FROM Account Where Email__c =: acc.Email__c];
         System.debug('accUserList------------->'+accUserList);
         if(accUserList.SIZE()>0){
             return true;
         }else{
             return false;
         }
     }
}