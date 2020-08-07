global with sharing class BatchApex implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id FROM Contact WHERE MailingState = null';
        return database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, list<Contact> conList){
        for(Contact con : conList){
            con.MailingState = 'WY';
        }
        update conList;
    }    
    
    global void finish(Database.BatchableContext BC){
        
    }
    
    
    
    
    
}