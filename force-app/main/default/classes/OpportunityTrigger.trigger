trigger OpportunityTrigger on Opportunity (Before Insert ,Before Update , After Insert, After Update, Before Delete, After Delete) {
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
        }
        when AFTER_DELETE {
            // call your after delete handler
        }
        when else {
            // this shouldn't happen
        }
  }
}