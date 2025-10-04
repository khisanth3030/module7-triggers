public with sharing class AccountUtility {
    
        public static List<Account> updateAccountType(List<Account> accountsToUpdate, String newType) {
            for (Account acc : accountsToUpdate) {
                acc.Type = newType;
            }
            return accountsToUpdate;
        }

        
}