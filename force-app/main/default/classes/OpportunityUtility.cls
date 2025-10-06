public with sharing class OpportunityUtility {
    
    public static void beforeUpdate(List<Opportunity> newOpps) {
        for (Opportunity opp : newOpps) {
            if (opp.Amount <= 5000) {
                opp.addError('Opportunity amount must be greater than 5000');
            }

        }
    }
    public static void beforeDelete(List<Opportunity> oldOpps) {
        for (Opportunity opp : oldOpps) {
            if (opp.StageName == 'Closed Won' && opp.Account.Industry == 'Banking') {
                opp.addError('Cannot delete closed opportunity for a banking account that is won');
            }
        }
    }
    public static void afterUpdate(List<Opportunity> newOpps, List<Opportunity> oldOpps) {
        
        for (Opportunity opp : newOpps) {
            
            }
        }
    
}