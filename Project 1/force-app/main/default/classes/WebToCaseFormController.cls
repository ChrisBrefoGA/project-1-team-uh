public class WebToCaseFormController {
    //get current user signed into page
    Map<String,String> session = Auth.SessionManagement.getCurrentSession();
    String userID = session.get('UsersId');
    public Contact contact {get;set;}
    public Case newCase {get;set;}
    public ID webCaseID {get;set;}
    
    public WebToCaseFormController() {
        try{
        User u = [SELECT ContactId FROM User WHERE id =: userID];
        //grab contact related to user; for customer/partner liscence, will only ever have one contact. we do [0] because query returns list.
     	contact = [SELECT id, firstName, LastName FROM Contact WHERE id =: u.ContactId];
        /*all web cases will be assigned to the "NAWebCases" queue.
        while we have case assignment rules set up to do so, apex code automatically assigns
		to the current user, so we programmatically assign it to the id of "NAWebCases" queue*/
        
        webCaseID = [SELECT id FROM Group WHERE Type='Queue' And Name ='NAWebCases'][0].id; //querying for that queue id here
		newCase = new Case(); //here we create an instance of Case so we can bind it to the VF page.
        newcase.Origin = 'Web'; //even with this origin declared as web, case assignment rules will not be triggered. 
        newCase.ContactId = contact.id; //this associates case with contact.
        newCase.OwnerId = webCaseID; //this is programatically assigning to the NAWebCase queue. 
        }catch(Exception e){
            system.debug(e);
        }
    }
    
    public PageReference insertCase(){
		database.insert(newCase); //result of command button being pressed
        //bottom three lines to refresh page
        PageReference tempPage = ApexPages.currentPage();           
        tempPage.setRedirect(true);
       return tempPage;
    }
        
        

}