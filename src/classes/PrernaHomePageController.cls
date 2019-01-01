public class PrernaHomePageController {


    public PageReference toYouthConnect(){
        PageReference pr = new PageReference(Label.UserSignup); 
        pr.setRedirect(true);
        return pr;
    }

    public PageReference toJobPost(){
        PageReference pr = new PageReference(Label.JobPortal); 
        pr.setRedirect(true);
        return pr;
    }

    public PageReference tologin(){
        PageReference pr = new PageReference('https://login.salesforce.com/'); 
        pr.setRedirect(true);
        return pr;
    }
}