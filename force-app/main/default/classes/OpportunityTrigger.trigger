trigger OpportunityTrigger on Opportunity (before insert, after insert, after update) {
    switch on Trigger.operationType {
        when BEFORE_INSERT{

            
        }
        when BEFORE_UPDATE {
            
        }
        when AFTER_INSERT {
            // call your after handler
        }
        when AFTER_UPDATE {
            // call your after update handler
        }
        when AFTER_DELETE {
            // call your after delete handler
        }
        when BEFORE_DELETE {
            // call your before delete handler
        }
        when else {
            // this shouldn't happen
        }
  }
}