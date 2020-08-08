public with sharing class DeliveriesController {
    
    public List<Mail__c> mailList{get;set;}
    public Contact contact {get;set;}
    public List<Inhabitant__c> inhabitants {get;set;}
    Map<String, String> session{get;set;}
    public String errorMessage {get;set;}
    String userId {get;set;}
    
   
    public DeliveriesController(){
        
        session = Auth.SessionManagement.getCurrentSession();     
        String userId = session.get('UsersId');
               
        User currentUser = [SELECT ContactId FROM User WHERE Id = :userId];
        contact = [SELECT id FROM Contact WHERE id =: currentUser.ContactId];
        inhabitants = new List<Inhabitant__c>();
        mailList = new List<Mail__c>();
        
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
                for(mail__c m:[SELECT name, on_route__c, Destination__c, Shipping_to__c, Receiver__c, Tracking_Code__c, Status__c, Delivered_Time__c, Value__c 
                    FROM Mail__c WHERE Status__c = 'Delivered' AND Receiver__c =: inhab.id]){
                                   mailList.add(m);}
            }
        }catch(Exception e){
            mailList = null;
            system.debug(e);
            errorMessage =  'There are no Locations associated with your profile';
        }
        
    }

}