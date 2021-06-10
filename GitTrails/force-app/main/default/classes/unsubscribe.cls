Global class unsubscribe implements Messaging.inboundEmailHandler{
    
    Global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, 
                                                           Messaging.InboundEnvelope env ) 
    {
        
        // Create an inboundEmailResult object for returning 
        // the result of the email service.
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
       
        // Convert the subject line to lower case so the program can match on lower case.
        String mySubject = email.subject.toLowerCase();
        // The search string used in the subject line.
        String s = 'unsubscribe';
        String Tdate=date.today().format();
        
        // Check the variable to see if the word "unsubscribe" was found in the subject line. 
        Boolean unsubMe;
        // Look for the word "unsubcribe" in the subject line. 
        // If it is found, return true; otherwise, return false.
        unsubMe = mySubject.contains(s);
        
        // If unsubscribe is found in the subject line, enter the IF statement.
        
        if (unsubMe == true) {
            for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
                
                ContentVersion conVer = new ContentVersion();
                conVer.ContentLocation = 'S'; // to use S specify this document is in Salesforce, to use E for external files
                conVer.PathOnClient = bAttachment.fileName; // The files name, extension is very important here which will help the file in preview.
                conVer.Title = s+' '+Tdate; // Display name of the files
                System.debug(bAttachment.fileName);
                conVer.VersionData = bAttachment.body; // converting your binary string to Blob
                insert conVer;    //Insert ContentVersion
            } 
                System.debug('Successfully Inserted');
            } 
            else {
                System.debug('Subject not Match' );
            }
            // Return True and exit.
            // True confirms program is complete and no emails 
            // should be sent to the sender of the unsubscribe request. 
            result.success = true;
            return result;
        }   
    }