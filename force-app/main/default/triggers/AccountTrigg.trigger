trigger AccountTrigg on Account (before insert) {
    AccountTriggerHandler.updateRating(Trigger.new);
    AccountTriggerHandler.copyBillingAddressToShipping(Trigger.new);
}