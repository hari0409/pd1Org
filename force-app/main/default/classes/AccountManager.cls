@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request=RestContext.request;
        String accId=request.requestURI.substring(
            request.requestURI.lastIndexOf('/',request.requestURI.lastIndexOf('/')-1)+1,
            request.requestURI.lastIndexOf('/')
        );
        Account account=[SELECT Id, Name, (Select Id, Name FROM Contacts) FROM Account WHERE Id=:accId][0];
        return account;
    }
}