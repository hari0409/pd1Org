public with sharing class ContactsListWithController {
    private String sortOrder = 'LastName';
    public List<Contact> getContacts(){
        List<Contact> results=Database.query(
            'SELECT Id, FirstName, Lastname, Title, Email, Phone '+
            'FROM Contact ORDER BY '+sortOrder+' ASC '+
            'LIMIT 10'
        );
        return results;
    }

    public void sortByLastname(){
        this.sortOrder = 'LastName';
    }

    public void sortByFirstname(){
        this.sortOrder = 'FirstName';
    }
}