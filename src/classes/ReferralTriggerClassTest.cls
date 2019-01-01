/**
 * @description: Test class for ReferralTriggerClass
 * @author: Shailendra
 * @history:
 * 20Sept2018 Shailendra: Initial version
 */

@isTest(SeeAllData = false)
public class ReferralTriggerClassTest {
    
    static testMethod void saveReferralTest() {
        Account candidate= new Account(Name='test abc');
        insert candidate;
        
        Account employer= new Account(Name='test employer', Email__c='test@gmail.com');
        insert employer;
        
        Attachment attach=new Attachment();     
        attach.Name='Unit Test Attachment';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        attach.body=bodyBlob;
        attach.parentId=candidate.id;
        insert attach;
        
    
        Reference__c ref = new Reference__c();
        ref.Employer__c = employer.Id;
        ref.Candidate__c = candidate.Id;
        ref.Description__c = 'test desc';
        insert ref;
    }

}