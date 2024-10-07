public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lName, String mpCode) {
        return [SELECT Id,Name FROM Contact WHERE LastName=:lName AND MailingPostalCode=:mpCode];
    }
}