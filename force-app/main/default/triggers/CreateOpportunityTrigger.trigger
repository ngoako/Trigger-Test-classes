trigger CreateOpportunityTrigger on Opportunity (before insert) {
    //call the handler class
    CreateOpportunityHandler.createOpportunity(Trigger.new);
}