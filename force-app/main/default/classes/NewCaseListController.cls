public with sharing class NewCaseListController {
    public List<Case> getNewCases(){
        return Database.query('SELECT Id, CaseNumber FROM Case WHERE Status=\'New\'');
    }
}