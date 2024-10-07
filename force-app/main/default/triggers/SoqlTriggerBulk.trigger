trigger SoqlTriggerBulk on Account(after update) {
    System.debug(Trigger.new);
    List<Account> accWithOppo=[SELECT Id, Name, (SELECT Id, Name FROM Opportunities) from Account where Id IN :Trigger.new];
    for (Account acc : accWithOppo) {
        System.debug(acc.Opportunities);
    }
}