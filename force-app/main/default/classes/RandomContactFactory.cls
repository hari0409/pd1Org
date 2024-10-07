// @isTest
public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer count,String conLastName){
        List<Contact> genContacts=new List<Contact>();
        for (Integer i = 0; i < count; i++) {
            Contact c=new Contact(FirstName='Test '+i,LastName=conLastName);
            genContacts.add(c);
        }
        insert genContacts;
        return genContacts;
    }
}