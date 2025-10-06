public with sharing class AccountUtility {
    

        public static void beforeInsert(List<Account> newAccounts) {
            
            for (Account acc : newAccounts) {
                if (acc.Type == null) {
                    acc.Type = 'Prospect';}

                if(acc.ShippingStreet != null) {
                    acc.BillingStreet = acc.ShippingStreet;}
                if(acc.ShippingCity != null) {
                    acc.BillingCity = acc.ShippingCity;}
                if(acc.ShippingState != null) {
                    acc.BillingState = acc.ShippingState;}
                if(acc.ShippingPostalCode != null) {
                    acc.BillingPostalCode = acc.ShippingPostalCode;}
                if(acc.ShippingCountry != null) {
                    acc.BillingCountry = acc.ShippingCountry;}

                if(acc.Phone != null && acc.Website != null && acc.Fax != null) {
                    acc.Rating = 'Hot';}
                }
            }
            
        public static void afterInsert(List<Account> newAccounts) {
            List<Contact> contactsToInsert = new List<Contact>();
            for (Account acc : newAccounts) {
                Contact defaultContact = new Contact();
                defaultContact.LastName = 'DefaultContact';
                defaultContact.Email = 'default@email.com';                    
                defaultContact.AccountId = acc.Id;
                contactsToInsert.add(defaultContact);
            }
            insert contactsToInsert;
            
        }
}