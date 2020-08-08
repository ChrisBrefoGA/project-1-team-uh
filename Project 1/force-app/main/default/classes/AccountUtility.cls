@isTest
public class AccountUtility {
    
    public static List<Account> createAccounts(Integer numberOfAccounts) {
        List<Account> newAccounts = new List<Account>();
        for(Integer i = 0; i < numberOfAccounts; i++) {
            Account newAccount = new Account();
            newAccount.Name = 'Test Account' + DateTime.now().getTime();
            newAccount.Type = 'Customer - Direct';
            newAccount.AccountNumber = '000' + i;
            newAccount.BillingStreet = 'Test Account Street';
            newAccount.BillingCity = 'Test Account City';
            newAccount.BillingState = 'Test Account State';
            newAccount.BillingPostalCode = '12345';
            newAccount.BillingCountry = 'US';
            newAccount.Active__c = 'Yes';
            newAccount.Industry = 'Other';
            newAccount.Phone = '(900) 600-3000' + i;
            newAccount.ShippingStreet = 'Test Account Street';
            newAccount.ShippingCity = 'Test Account City';
            newAccount.ShippingState = 'Test Account State';
            newAccount.ShippingPostalCode = '12345';
            newAccount.ShippingCountry = 'US';
            newAccount.NumberOfEmployees = (Integer)(Math.Random() * 50);
            newAccount.YearStarted = '2000';
            newAccount.Website = 'https://account.test.org';
            newAccount.OwnerId = '0053t000007ux0eAAA';
        }
        return newAccounts;
    }

}