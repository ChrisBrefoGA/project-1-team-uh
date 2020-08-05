public with sharing class AccountDisplayController {
    public Account acc {get;set;}
    Map<String,String> session = Auth.SessionManagement.getCurrentSession();
    String userId = session.get('UserId');
    public AccountDisplayController() {
        User u = [SELECT Name, ProfileId, Id FROM User WHERE Name = 'Christopher Brefo'];
        system.debug(u.ProfileId);
        system.debug(u.Id);
        //Account acc = [SELECT Name FROM Account WHERE OwnerId =:u.Id AND Name = 'Apex Test'];
       acc = [SELECT Name, Type, AccountNumber, BillingAddress, Active__c, 
       Industry, Phone, ShippingAddress, NumberOfEmployees, YearStarted, Website FROM Account WHERE Name = 'Apex Test'];
    }
	    public void save()	{
        update acc;
    }
}