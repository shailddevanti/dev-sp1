trigger ReferralTrigger on Reference__c (before insert) {

        if(trigger.IsBefore){
            ReferralTriggerClass.updateEmailAndName(Trigger.New);
        }
        
}