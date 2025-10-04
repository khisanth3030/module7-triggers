public with sharing class OpportunityUtility {
    
        public static List<Opportunity> updateOpportunityStage(List<Opportunity> opportunitiesToUpdate, String newStage) {
            for (Opportunity opp : opportunitiesToUpdate) {
                opp.StageName = newStage;
            }
            return opportunitiesToUpdate;
        }


    
}