public with sharing class AccountUtils {
    public static List<Account> accountsByState(String billingState) {
        if (!Schema.SObjectType.Account.isAccessible() || !Schema.SObjectType.Account.Name.isAccessible()){
            return null;
        }
        else{
            List<Contact> contactRecs = [SELECT Id FROM Contact];
            SObjectAccessDecision sceurityDecision=Security.stripInaccessible(contactRecs);
            List<Contact> strippedRecs=sceurityDecision.getRecords();
            strippedRecs[0].isSet('FIELD_API_NAME');

            String.valueOf(arg0);
            String.escapeSingleQuotes(arg0);

            input.replaceAll('[^\\w]','');

            return [SELECT Id, Name FROM Account WHERE BillingState=:billingState WITH USER_MODE];
        }
    }
}