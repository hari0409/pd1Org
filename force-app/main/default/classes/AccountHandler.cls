public with sharing class AccountHandler {
    public static Account insertNewAccount(String accName) {
        try {
            Account acc=new Account(Name=accName, AccountNumber='827492864938');
            insert acc;
            return acc;    
        } catch (Exception e) {
            System.debug(e.getMessage());
            return null;
        }
    }
}