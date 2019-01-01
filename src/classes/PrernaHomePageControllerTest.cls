/**
 * @description: Test class for PrernaHomePageController
 * @author: Shailendra
 * @history:
 * 20Sept2018 Shailendra: Initial version
 */

@isTest(SeeAllData = false)
public class PrernaHomePageControllerTest {
    
    
    
    
    static testMethod void homePageTest() {
        PrernaHomePageController cls = new PrernaHomePageController();
        cls.toYouthConnect();
        cls.toJobPost();
        cls.tologin();
    }

}