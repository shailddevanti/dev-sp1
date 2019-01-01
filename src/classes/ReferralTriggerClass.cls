public class ReferralTriggerClass{


    public static void updateEmailAndName(List<Reference__c> lstRef){
        Set<Id> setAccountId = new Set<Id>();
        Set<Id> setCandidateId = new Set<Id>();
        
        try {
            for(Reference__c ref: lstRef){
                if(ref.Employer__c!=null){
                    setAccountId.add(ref.Employer__c);
                }
                if(ref.Candidate__c!=null){
                    setCandidateId.add(ref.Candidate__c);
                }
            }
            if(!setAccountId.ISEMPTY()){
                Map<Id, Account> mapAccount = new Map<Id, Account>([SELECT ID, NAME, EMAIL__c FROM ACCOUNT WHERE ID IN: setAccountId]);
                
                for(Reference__c ref: lstRef){
                    ref.Employer_Email__c = mapAccount.get(ref.Employer__c).EMail__c;
                    ref.Employer_Name__c = mapAccount.get(ref.Employer__c).Name;
                }
                sendEmailWithAttachment(mapAccount,lstRef,setCandidateId);
            }
        }catch(System.DMLException e) {
           ApexPages.addMessages(e);
        }
       
    }

    public static void sendEmailWithAttachment(Map<Id, Account> mapAccount, List<Reference__c> lstRef, Set<Id> setCandidateId){
    
       Map<Id, Attachment> mapAtt = new Map<Id, Attachment>();
 
       try {
       
           for(Attachment att: [SELECT Id, ParentId, Parent.Name, Body FROM Attachment Where ParentId IN: setCandidateId]){
               mapAtt.put(att.ParentId,att);
           }    
           
           for(Reference__c ref: lstRef){
                   Messaging.SingleEmailMessage semail= new Messaging.SingleEmailMessage();
                   Messaging.EmailFileAttachment attach= new Messaging.EmailFileAttachment();
                   if(ref.Candidate__c!=null && mapAtt!=null && mapAtt.get(ref.Candidate__c)!=null){
                       attach.setBody(mapAtt.get(ref.Candidate__c).body);
                       attach.setFileName((mapAtt.get(ref.Candidate__c).Parent.Name));
                       String[] emailIds= new String[]{mapAccount.get(ref.Employer__c).Email__c};
                       semail.setToAddresses(emailIds);
                       
                       semail.setSubject('Job Referral: CV of '+mapAtt.get(ref.Candidate__c).Parent.Name);
                       semail.setHtmlBody(ref.Description__c);
                       semail.setFileAttachments(new Messaging.EmailFileAttachment[]{attach});
                       Messaging.sendEmail(new Messaging.SingleEmailMessage[]{semail});
                   }
           }
      }catch(System.DMLException e) {
           ApexPages.addMessages(e);
      }      
    }   
}