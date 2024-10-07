public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accIds) {
        List<Account> accounts=[SELECT id, Type, (Select Id from Contacts) from Account where Id in :accIds];
        for (Account acc : accounts) {
            acc.Number_of_Contacts__c=acc.Contacts.size();
        }
        update accounts;
    }
}