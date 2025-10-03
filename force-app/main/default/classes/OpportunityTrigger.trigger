trigger OpportunityTrigger on Opportunity (before insert, after insert, after update) {
    switch on Trigger.operationType {
        when BEFORE_INSERT, BEFORE_UPDATE {
            // call your before handler
        }
        when AFTER_INSERT {
            // call your after handler
        }
        when else {
            // this shouldn't happen
        }
    }
}