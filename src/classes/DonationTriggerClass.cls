public class DonationTriggerClass{

    public static void sendDonationReceipt(List<Donation__c> donNewList, Map<Id, Donation__c> donOldList){
        Map<Id, Id> mapDonationWIthDevotee = new Map<Id, Id>();
        Map<Id, String> mapAccountDetails = new Map<Id, String>();
        
        for(Donation__c obj: donNewList){
            mapDonationWIthDevotee.put(obj.Devotee__c, obj.Devotee__c);
        }
    
    
        if(!mapDonationWIthDevotee.ISEMPTY()){
            for(Account acc: [Select Id, Email__c from Account Where Id IN: mapDonationWIthDevotee.keySet()]){
                mapAccountDetails.put(acc.Id,acc.Email__c);
            }
        }
        for(Donation__c obj: donNewList){
            obj.Email__c = mapAccountDetails.get(obj.Devotee__c);
        }
       
     
   } 
   
}