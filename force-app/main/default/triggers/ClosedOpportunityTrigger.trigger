trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    System.debug(Trigger.new);
}