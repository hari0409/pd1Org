public with sharing class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext SC){
        List<Lead> leads=[SELECT Id FROM Lead WHERE LeadSource=null LIMIT 200];
        for (Lead lea : leads) {
            lea.LeadSource='Dreamforce';
        }
        update leads;
    }
}