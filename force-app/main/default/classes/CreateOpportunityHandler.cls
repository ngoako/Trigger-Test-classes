public with sharing class CreateOpportunityHandler {
    public static void createOpportunity(List<Opportunity> lstOpportunity) {
        if(!lstOpportunity.isEmpty()){
            for(Opportunity opp : lstOpportunity){
                if(opp.amount >= 100000 && opp.amount <= 500000){
                    opp.Description = 'Hot Opportunity';
                }
            }
        }
    }
}