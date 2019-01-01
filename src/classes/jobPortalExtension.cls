public class jobPortalExtension{

    public Job__c job;
    public Boolean isJobPosted {get; set;} 
    public String employerEmail {get; set;}
    public String employerName {get; set;}
    public String employerPhone {get; set;}

    public jobPortalExtension(ApexPages.StandardController stdController) {
       isJobPosted= true;
       job = (Job__c)stdController.getRecord();
    }
    
     public PageReference postJobs() {
       LIST<Job_Posting__c> lstJobPosting = NEW LIST<Job_Posting__c>();
       
       try {
              validateRequiredField();
              Account employer = getPostedByDetails();
              job.Posted_By__c = employer.Id;
              insert job;
                            
              for(Account candidates: [SELECT Id, Name, Email__c FROM ACCOUNT WHERE Skill_Set__c INCLUDES (:job.Skill_Set_Required__c)]){
                  Job_Posting__c jb = new Job_Posting__c();
                  jb.Candidate__c = candidates.Id;
                  jb.Job__c = job.Id;
                  jb.Email__c = candidates.Email__c;
                  lstJobPosting.add(jb);
              }
              
              If(!lstJobPosting.ISEMPTY()){
                  INSERT lstJobPosting;
              }
              
       }catch(System.DMLException e) {
           ApexPages.addMessages(e);
           return null;
      }
      isJobPosted = false;
      return null;
    }

    public void validateRequiredField(){
        if(employerName==null){ 
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Name is Required');
            ApexPages.addMessage(myMsg);
        }
        
        if(employerEmail==null){ 
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Email is Required');
            ApexPages.addMessage(myMsg);
        }
        
        if(employerPhone==null){ 
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Contact is Required');
            ApexPages.addMessage(myMsg);
        }
    }
    
    public Account getPostedByDetails(){
        LIST<ACCOUNT> postedByAccount = [SELECT Id, Name, Email__c, Phone FROM Account Where EMAIL__c =: employerEmail limit 1];
        
        if(postedByAccount!=null && postedByAccount.size()>0){
            return postedByAccount[0];
        }else{
            Account acc = new account(Name=employerName, Email__c=employerEmail, Phone=employerPhone);
            insert acc;
            return acc;
        }
    }
  
}