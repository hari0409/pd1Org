public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String searchTerm) {
        return [FIND :searchTerm IN NAME FIELDS RETURNING Contact, Lead];
    }
}