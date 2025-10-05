
trigger AccountTrigger on Account ( Before Insert ,Before Update , After Insert, After Update) {
        switch on Trigger.OperationType  {
            when BEFORE_INSERT{
                // call your before insert handler
                AccountUtility.beforeInsert(Trigger.new);
            }
            when BEFORE_UPDATE {
                // call your before update handler
            }
            when AFTER_INSERT {
                // call your after insert handler
                AccountUtility.afterInsert(Trigger.new);
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