public with sharing class AccountDisplayController {
    public Account acc {get;set;}
    Map<String,String> session = Auth.SessionManagement.getCurrentSession();
    String userId = session.get('UsersId');
    public AccountDisplayController() {
       User u = [SELECT ContactId FROM User WHERE id =: userId];
       Contact c = [SELECT AccountId FROM Contact WHERE id =: u.ContactId];
        try{
       acc = [SELECT Name, Type, AccountNumber, BillingAddress, Active__c, 
       Industry, Phone, ShippingAddress, NumberOfEmployees, YearStarted, Website FROM Account WHERE id =: c.AccountId];
        }catch(Exception e){
            acc = null;
        }
    }
	    public void save()	{
        update acc;
    }
}