public class CurrentCasesController{
	public List<Case> cases{get;set;} //Account object for display
    Map<String,String> session = Auth.SessionManagement.getCurrentSession();//api call for getting the user's session/ person who is currently logged in
    String userId = session.get('UsersId');//get the userid of the person currently logged in
    public CurrentCasesController(){
        try{
       User u = [SELECT id FROM User WHERE id =: userId];//Now get the user that matches the user id
       cases = [SELECT CaseNumber, Priority, Status, Reason, Description, Comments FROM Case WHERE IsClosed = false AND CreatedById =: u.id]; //display the account information
        }catch(Exception e){
            cases = null;
            system.debug(e);
        }
    }
     public void save()	{
        update cases;
    }
}