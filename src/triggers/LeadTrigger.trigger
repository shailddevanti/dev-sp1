trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {

    if(Trigger.IsAfter){
        if(Trigger.IsInsert){
            LeadTriggerClass.webToLeadProcessing(trigger.new);
        }
    
    }else{
    
    
    }
}