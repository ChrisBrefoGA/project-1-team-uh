public with sharing class AccountDisplayController {
    public Account acc {get;set;}
    Map<String,String> session = Auth.SessionManagement.getCurrentSession();
    String userId = session.get('UserId');
    public AccountDisplayController() {
        system.debug(userId);
        User u = [SELECT Name FROM User WHERE Name = 'Christopher Brefo'];
        system.debug(u.ProfileId);
        system.debug(u.Id);
        Account acc = [SELECT Name FROM Account WHERE OwnerId = '0053t000007u1WbAAI'];
        //system.debug(acc.Name);
       // acc = [SELECT Name, Type, AccountNumber, BillingAddress, Active__c, 
       // Industry, Phone, ShippingAddress, NumberOfEmployees, YearStarted, Website FROM Account WHERE OwnerId =:userId];

    }

}