/**
 * @description: Test class for AccountTrigger
 * @author: Shailendra
 * @history:
 * 20Sept2018 Shailendra: Initial version
 */

@isTest(SeeAllData = true)
public class jobPortalExtensionTest {
    
    static testMethod void postJobsTest() {
        Account accEmp= new Account(Name='test abc Emp');
        accEmp.Email__c = 'test@gmail.com';
        insert accEmp;
        
        Account acc= new Account(Name='test abc');
        acc.Skill_Set__c ='Cleaning;Driving';
        insert acc;
        
        Job__c job = new Job__c();
        job.Posted_By__c = accEmp.Id;
        job.Skill_Set_Required__c ='Cleaning';
        insert job;
    
        ApexPages.StandardController sc = new ApexPages.StandardController(job);
        jobPortalExtension jobExt = new jobPortalExtension(sc);
      //  jobExt.employerEmail='test@gmail.com';
        jobExt.postJobs();
    }

}