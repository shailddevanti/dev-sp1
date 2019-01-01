public class LeadTriggerClass{

    public static Map<String, Lead> mapLead = new Map<String, Lead>();
    public static List<Task> taskList = new List<Task>();
    public static List<Lead> delLeadList = new List<Lead>();
    
    public static void webToLeadProcessing(List<Lead> leadList){
    
        for(Lead lead: leadList){
            mapLead.put(lead.Email, lead);
        }
        
        
        List<Account> existingAccList = [SELECT Id, Email__c FROM ACCOUNT Where Email__c IN: mapLead.keySet()];
        //
        taskList.addAll(processExistingAccountTask(existingAccList));
        //
        taskList.addAll(processNewLeads(mapLead.values()));
        
        if(!taskList.ISEMPTY()){
            insert taskList;
        }
        
    }
    
    public static List<Task> processNewLeads(List<Lead> leadProcessingList){
    
        List<Task> taskLead = new List<Task>();
        List<Account> lstAccountInsert = new List<Account>();
        
        for(Lead l: leadProcessingList){
            Account acc = new Account();
            acc.Name = l.FirstName + ' ' + l.LastName;
            acc.Email__c = l.Email;
            acc.Phone = l.MobilePhone;
            acc.BillingStreet = l.Street;            
            acc.BillingCity = l.City;
            acc.BillingState = l.State;
            acc.BillingCountry = l.Country;
            acc.BillingPostalCode = l.PostalCode;
            lstAccountInsert.add(acc);
        }
        if(!lstAccountInsert.ISEMPTY()){
            insert lstAccountInsert;
        }   
        taskLead = processExistingAccountTask(lstAccountInsert);
        return taskLead;
    }
    
    public static List<Task> processExistingAccountTask(List<Account> accList){
        List<Task> taskList = new List<Task>();
        
        for(Account acc: accList){
            Task tsk = new Task();
            tsk.Subject = mapLead.get(acc.Email__c).Type__c + ' Booking';
            tsk.ActivityDate = mapLead.get(acc.Email__c).Date__c;
            tsk.WhatId = acc.Id;
            tsk.Status = 'Open';
            tsk.OwnerId = '0055D000001O2wy';
            tsk.Description = mapLead.get(acc.Email__c).Description;
            taskList.add(tsk);
            mapLead.keySet().remove(acc.Email__c);
        }
        return taskList;       
    }

}