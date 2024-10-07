public with sharing class LeadProcessor implements Database.Batchable<SObject>{
    public static Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id FROM Lead');
    }

    public static void execute(Database.BatchableContext BC,List<Lead> leads){
        for (Lead lea : leads) {
            lea.LeadSource='Dreamforce';
        }
        update leads;
    }
    public static void finish(Database.BatchableContext BC){}
}
