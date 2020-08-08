@isTest
public class AccountDisplayControllerTest {
    
    @testSetup
    public static void TestAccountDisplayControllerSetup(){
        
        List<Account> testAccounts = AccountUtility.createAccounts(10);
        
        try {
           
            insert testAccounts;
        }
        catch(DMLException e){
            
            System.debug('A DMLException was thrown while attempting ' +
                         'to insert testAccounts: ' + e.getMessage());
        }    
    }
    
    @isTest
    public static void TestAccountDisplayController(){
        
        
        
    }
}