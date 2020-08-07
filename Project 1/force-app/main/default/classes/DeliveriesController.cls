public without sharing class DeliveriesController {
    
    public List<Mail__c> mailList{get;set;}
    
     public List<User> userList{get;set;}
    
    Map<String, String> session{get;set;}
    
    String userId {get;set;}
    
   
    public DeliveriesController(){
        
        session = Auth.SessionManagement.getCurrentSession();
        
        userId = session.get('UsersId');
               
        User currentUser = [SELECT ContactId FROM User WHERE Id = :userId];
        
        mailList = [SELECT Id, Name, Destination__c, Delivered_Time__c, Receiver__c, 
                    Status__c, Tracking_Code__c, On_Route__c, Shipping_To__c, Value__c, 
                    LastModifiedBy.Name, Receiver__r.Inhabitant_Contact__r.Id 
                    FROM Mail__c 
                    WHERE Status__c = 'Delivered' /*AND Receiver__r.Inhabitant_Contact__r.Id = :currentUser.ContactId*/];
    }

}