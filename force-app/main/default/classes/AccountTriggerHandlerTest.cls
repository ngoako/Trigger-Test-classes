@isTest
public with sharing class AccountTriggerHandlerTest {
    @isTest
    public static void updateRatingTest(){
        //Create sample data
        List<Account> lstAccount = new List<Account>();

        for(Integer counter = 1; counter <= 5; counter++){
            Account acc = new Account();
            acc.Name = 'TestingApexTrigger' + counter;
            acc.Industry = 'Energy';
            acc.recordTypeId = '0128d000001ODfvAAG';

            lstAccount.add(acc);
        }
        //Insert data
        Test.startTest();
        Insert lstAccount;
        Test.stopTest();

        //query the data
        List<Account> lstAcc = [SELECT Id, Rating FROM Account WHERE id =: lstAccount[0].Id];

        //Assert the data
        System.AssertEquals('Hot', lstAcc[0].Rating);
    }

    @isTest
    public static void copyBillingAddrssToShippingAddrssTest(){
        List<Account> lstAcc = new List<Account>();

        for(Integer x = 1; x<=5; x++){
            Account acc = new Account();
             acc.Name = 'Test' + x;
             acc.CopyBillingToShipping__c = true;
             acc.BillingCity = 'Munich';
             acc.BillingCountry = 'Germany';
             acc.BillingStreet = 'BillingStreet' + x;

             lstAcc.add(acc);
        }

        Test.startTest();
        Insert lstAcc;
        Test.stopTest();

        //query the data
         List<Account> lstAccToVerify = [SELECT Id, ShippingCity FROM Account WHERE id =: lstAcc[0].Id];

         //Assert the data
         System.AssertEquals('Munich', lstAccToVerify[0].ShippingCity);
    }
}