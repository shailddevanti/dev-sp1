trigger EventTrigger on Event (before insert) {

    List<String> toAddresses = new List<String>();
    for(Account acc:[Select Id, Email__c FROM Account where Email__c!=null limit 5]){
        toAddresses.add(acc.Email__c);
    }
   
    
    // Now create a new single email message object
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

    // Assign the addresses for the To and CC lists to the mail object.
    mail.setToAddresses(toAddresses);

    // Specify the address used when the recipients reply to the email. 
    mail.setReplyTo('support@acme.com');

    // Specify the name used as the display name.
    mail.setSenderDisplayName('Event Organizer');

    // Specify the subject line for your email address.
    mail.setSubject('New Event Created : ');

    // Set to True if you want to BCC yourself on the email.
    mail.setBccSender(false);

    // Optionally append the email signature to the email.
    // If true, email address of user executing Apex Code is used.
    mail.setUseSignature(false);

    // Specify the text content of the email.
    mail.setPlainTextBody('You are invited to a new event: ');

    // Specify the HTML content of the email.
    mail.setHtmlBody('You are invited to a new event:<b> ');

    // Send the email you have created.
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

}