public with sharing class AccountDisplayController {
    public Account acc {get;set;}
    Map<String,String> session = Auth.SessionManagement.getCurrentSession();
    String userId = session.get('UsersId');
    public AccountDisplayController() {
       User u = [SELECT ContactId FROM User WHERE id =: userId];
        try{
       acc = [SELECT Name, Type, AccountNumber, BillingAddress, Active__c, 
       Industry, Phone, ShippingAddress, NumberOfEmployees, YearStarted, Website FROM Account WHERE OwnerId =: u.ContactId];
        }catch(Exception e){
            acc = null;
        }
    }
	    public void save()	{
        update acc;
    }
}