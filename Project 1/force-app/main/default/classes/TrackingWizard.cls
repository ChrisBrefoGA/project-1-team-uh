public class TrackingWizard {
    public String tCode {get;set;}
    public String errorMessage {get;set;}
    public Mail__c mailPackage{get;set;}
    
   public pagereference page1_next(){
			if(tCode !=''){
                try{
                    mailPackage = [SELECT Name, Delivered_Time__c,Destination__c, On_Route__c, Receiver__c,Shipping_To__c,Status__c,Tracking_Code__c,Value__c FROM Mail__c WHERE Tracking_Code__c =: tCode];
                }catch(Exception e){
                    errorMessage = 'ERROR: Can\'t find a Package with that tracking code!!';
                    return page.TrackingWizardPage1;
                }
            }
       		else{
           		errorMessage = 'ERROR: Please enter a tracking code!!';
           		return page.TrackingWizardPage1;
       		}
        errorMessage = '';
        tCode = '';
        return page.TrackingWizardPage2;
    }
    public pagereference page2_previous(){
        mailPackage = null;
        return page.TrackingWizardPage1;
    }
    
}