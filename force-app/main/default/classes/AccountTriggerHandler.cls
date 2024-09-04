public with sharing class AccountTriggerHandler {
    public static void updateRating(List<Account> accList){

        if(!accList.isEmpty()){
            //List<Account> lstList = new List<Account>();
            for(Account acc : accList){
                if(acc.Industry == 'Media' || acc.Industry == 'Energy'){
                    acc.Rating = 'Hot';
                }else {
                    system.debug('Error updating records');
                }
                //lstList.add(acc);
            }
           // update lstList;
        }

    }

    public static void copyBillingAddressToShipping(List<Account> accList){
        if(!accList.isEmpty()){
            for(Account acc : accList){
                if(acc.CopyBillingToShipping__c && acc.BillingCity != null){
                    acc.ShippingCity = acc.BillingCity;
                    acc.ShippingCountry = acc.BillingCountry;
                    acc.ShippingState = acc.BillingState;
                    acc.ShippingStreet = acc.BillingStreet;
            }
        }
    }
}
}