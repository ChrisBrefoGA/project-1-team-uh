public class MailPackageController {    
    
    Map<String,String> session = Auth.SessionManagement.getCurrentSession();
    String userID = session.get('UsersId');
    public String errorMessage {get;set;}
    public Contact contact {get;set;}
    public List<Inhabitant__c> inhabitants {get;set;}
    public List<Mail__c> userMails {get;set;}

    public MailPackageController() {
        //we have USERID
     	//select all contacts where contact.owner ID == userID
     	// for this list, select all inhabitants that each contact owns, and push their mails into a list
     	User u = [SELECT ContactId FROM User WHERE id =: userId];
     	contact = [SELECT id FROM Contact WHERE id =: u.ContactId];
        inhabitants = new List<Inhabitant__c>();
        userMails = new List<Mail__c>();
        errorMessage = '';
        try{
            for(Inhabitant__c inhab:[SELECT id FROM Inhabitant__c WHERE Inhabitant_Contact__c =: contact.id]){
                    inhabitants.add(inhab);
            }      
        }catch(Exception e){
            inhabitants = null;
            errorMessage =  'There are no Locations associated with your profile';
        }
        try{
            for(Inhabitant__c inhab:inhabitants){
                for(Mail__c mail:[SELECT name, on_route__c, Shipping_to__c, Receiver__c, Tracking_Code__c, Status__c, Delivered_Time__c, Value__c FROM Mail__c WHERE Receiver__c =: inhab.id]){
                    userMails.add(mail);
                }
            }
        }catch(Exception e){
            userMails = null;
            errorMessage =  'There are no Locations associated with your profile';
        }
        
        
        
    }
    
    
} //end of controller