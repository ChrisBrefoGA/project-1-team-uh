public with sharing class AccountDisplayController {
    public Account acc {get;set;} //Account object for display
    Map<String,String> session = Auth.SessionManagement.getCurrentSession();//api call for getting the user's session/ person who is currently logged in
    String userId = session.get('UsersId');//get the userid of the person currently logged in
    public AccountDisplayController() {
        Contact c;
        try{
       User u = [SELECT ContactId FROM User WHERE id =: userId];//Now get the user that matches the user id
       c = [SELECT AccountId FROM Contact WHERE id =: u.ContactId];//get the contact that matches the user contact id
       acc = [SELECT Name, Type, AccountNumber, BillingAddress, Active__c, 
       Industry, Phone, ShippingAddress, NumberOfEmployees, Website FROM Account WHERE id =: c.AccountId]; //display the account information
        }catch(Exception e){
            acc = null;
            system.debug(e);
        }
    }
	    public void save()	{
        update acc;
    }
}