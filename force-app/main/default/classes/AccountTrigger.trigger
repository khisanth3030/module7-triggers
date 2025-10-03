
trigger AccountTrigger on Account ( Before Insert ,Before Update , After Insert, After Update) {
        switch on Trigger.OperationType  {
             when BEFORE_INSERT
             {
                 System.debug('BEFORE_INSERT------>' + Trigger.OperationType );
                 System.debug(Trigger.OperationType +'-Before Insert-->'+Trigger.isInsert+'--->'+Trigger.isBefore);
             }
             when AFTER_INSERT
             {
                 System.debug('AFTER_INSERT ------->' +Trigger.OperationType );
                 System.debug(Trigger.OperationType +'-After Insert-->'+Trigger.isInsert+'--->'+Trigger.isAfter);
             }
             when BEFORE_UPDATE, AFTER_UPDATE
             {
                 System.debug('BEFORE_UPDATE or AFTER_UPDATE----->' +Trigger.OperationType );
             }
         }

}