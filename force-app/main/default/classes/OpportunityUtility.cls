public with sharing class OpportunityUtility {
    
    public static void beforeUpdate(List<Opportunity> newOpps) {

        List<Contact> contactList = [SELECT Id, FirstName, Title, AccountId FROM Contact WHERE Title = 'CEO' AND AccountId IN (SELECT AccountId FROM Opportunity WHERE Id IN : newOpps)];
        System.debug('Contact List Size: ' + contactList.size());
        System.debug('Contact List: ' + contactList);

        Map<Id,Contact> contactMap = new Map<Id,Contact>();
        for(Contact con : contactList) {
            System.debug('Contact Id: ' + con.Id);
            System.debug('Contact First Name: ' + con.FirstName);
            System.debug('Contact Title: ' + con.Title);
            System.debug('Contact Account Id: ' + con.AccountId);
            contactMap.put(con.AccountId, con);
        }

        for (Opportunity opp : newOpps) {
            //System.debug('Opportunity Amount: ' + opp.Amount);
            //System.debug('Opportunity Id: ' + opp.Id);
            if (opp.Amount != null && opp.Amount <= 5000) {
                opp.addError('Opportunity amount must be greater than 5000');
            }
            System.debug('Opportunity Account Id: ' + opp.AccountId);
            if(contactMap.containsKey(opp.AccountId)) {
                Contact con = contactMap.get(opp.AccountId);
                opp.Primary_Contact__c = con.Id;
                System.debug('Contact Map Value: ' + contactMap.get(opp.AccountId));
                System.debug('Opportunity Primary Contact: ' + opp.Primary_Contact__c);
                System.debug('Opportunity Id: ' + opp.Id);            

            }else{opp.Primary_Contact__c = null;}
            

        }
    }
    public static void beforeDelete(List<Opportunity> oldOpps) {
        for (Opportunity opp : oldOpps) {
            //System.debug('Account Industry: ' + opp.Account.Industry);
            //System.debug('Opportunity StageName: ' + opp.StageName);
            //System.debug('Opportunity Id: ' + opp.Id);
            if (opp.StageName == 'Closed Won' && opp.Account.Industry == 'Banking') {
                opp.addError('Cannot delete closed opportunity for a banking account that is won');
            }
        }
    }

}