/**
 * @description: Test class for AccountTrigger
 * @author: Shailendra
 * @history:
 * 20Sept2018 Shailendra: Initial version
 */

@isTest(SeeAllData = false)
public class userSignupExtensionTest {
    
    
    
    
    static testMethod void saveUserTest() {
        Account acc= new Account(Name='test abc');
        insert acc;
    
        ApexPages.StandardController sc = new ApexPages.StandardController(acc);
        userSignupExtension usrExt = new userSignupExtension(sc);
        usrExt.saveUser();
    }

}