@isTest
public class YouthRegistrationControllerTest {
    
    static testMethod void MyTest(){        
        Account myaccount = new Account (name='Test');
        
        PageReference pageRef = Page.YouthRegistration;
        Test.setCurrentPage(pageRef);
        
        Apexpages.StandardController sc = new Apexpages.StandardController(myaccount);
        YouthRegistrationController ext = new  YouthRegistrationController(sc);         
        ext.saveRegistration();         
    }
}