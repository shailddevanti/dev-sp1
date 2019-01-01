public class YouthRegistrationController {

    
    public Boolean userSignup {get;set;}
    public Account acc {get;set;}
    
    public YouthRegistrationController(ApexPages.StandardController stdController) {
        userSignup= true;
        acc = (Account)stdController.getRecord();
    }

    public PageReference saveRegistration(){
        acc.Type='DL Campign';
        insert acc;   
        PageReference myVFPage = new PageReference('https://sanatanyuvasena.secure.force.com/Prerna/');
        myVFPage.setRedirect(true);
        return myVFPage;
    }

}