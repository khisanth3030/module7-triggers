trigger OpportunityTrigger on Opportunity (before insert, after insert, after update) {
    switch on Trigger.operationType {
        when BEFORE_INSERT{
            // call your before insert handler
            
        }
        when BEFORE_UPDATE {
            // call your before update handler
            OpportunityUtility.beforeUpdate(Trigger.new);
        }
        when BEFORE_DELETE {
            // call your before delete handler
            OpportunityUtility.beforeDelete(Trigger.old);
        }
        when AFTER_INSERT {
            // call your after insert handler
        }
        when AFTER_UPDATE {
            // call your after update handler
            OpportunityUtility.afterUpdate(Trigger.new, Trigger.old);
        }
        when AFTER_DELETE {
            // call your after delete handler
        }
        when else {
            // this shouldn't happen
        }
  }
}