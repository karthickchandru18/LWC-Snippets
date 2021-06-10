global class DeliverabiltyStatusScheduledClass Implements Schedulable
            {
                
                
                        global void execute(SchedulableContext sch)
                        {
                                    sendmail();
                        }

                        public void sendmail()
                        {
                                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                                    string [] toaddress= New string[]{'karthickchandru18@gmail.com'};
                                    String plainTextBody = '';
                                    plainTextBody +='Hello Everyone \n\n';
                                    plainTextBody +='Greetings !! \n\n'; 
                                    plainTextBody +='As per ASG  Salesforce Configuration Setup ,Email deliverability is being SET ON \n';
                                    plainTextBody +='& therefore email are being  sent to respective external accounts \n\n';
                                    plainTextBody +='Regards \n';
                                    plainTextBody +='QRS Support \n\n';
                                    email.setSubject('E-Mail Deliverability Status: ON ----'+system.now().format());  
                                    email.setPlainTextBody(plainTextBody);
                                    email.setToAddresses(toaddress);
                                    Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
                        }
            }