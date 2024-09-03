@isTest
public with sharing class CreateOpportunityTest {
    @isTest
    public static void createOpportunity(){
        List<Opportunity> lstOpp = new List<Opportunity>();
        for(Integer x = 1; x<=5; x++){  
            Opportunity opp = new Opportunity();
            opp.name = 'New Contract';
            opp.amount = 300000;
            opp.CloseDate = date.today().addDays(30);
            opp.StageName = 'Needs Analysis';
            
            lstOpp.add(opp);
        }
        Test.startTest();
        insert lstOpp;
        Test.stopTest();

        List<Opportunity> myList = [SELECT Id, Description FROM Opportunity WHERE Id =: lstOpp[0].Id];

        System.Assert.areEqual('Hot Opportunity', myList[0].Description);
    }


}