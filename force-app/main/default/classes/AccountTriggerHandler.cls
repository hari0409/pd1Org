public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> acclist) {
        for(Account a:acclist){
            a.ShippingState = a.BillingState;
        }
    }

    public static void sampleModification(List<Account> acc) {
        for (Account a : acc) {
            a.Website='https://www.google.com';
        }
    }
}