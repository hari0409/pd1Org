trigger SoqlTriggerBulk on Opportunity(after update) {
    List<Opportunity> oppos=[SELECT Id, AccountId, Name, StageName FROM Opportunity where Id IN :Trigger.New];
}