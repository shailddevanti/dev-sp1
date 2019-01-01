trigger DonationTrigger on Donation__c (before insert, before update) {
        DonationTriggerClass.sendDonationReceipt(Trigger.New, Trigger.OldMap);
    
}