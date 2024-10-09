@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {
    @HttpGet
    global static Case getCaseById(){
        RestRequest request=RestContext.request;
        String caseId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case c=[SELECT CaseNumber,Subject,Status,Origin,Priority FROM Case WHERE Id=:caseId];
        return c;
    }

    @HttpPost
    global static Id createCase(String subject,String status,String origin, String priority){
        Case c=new Case(
            Subject=subject,
            Status=status,
            Origin=origin,
            Priority=priority
        );
        insert c;
        return c.Id;
    }

    @HttpDelete
    global static void deleteCase(){
        RestRequest request = RestContext.request;
        String caseId= request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case c=[SELECT Id FROM Case WHERE Id=:caseId];
        delete c;
    }

    @HttpPut
    global static Id upsertCase(String subject, String status, String origin, String priority, String id){
        Case c=new Case(
            Id=id,
            Subject=subject,
            Priority=priority,
            Status=status,
            Origin=origin
        );
        upsert c;
        return c.Id;
    }

    @HttpPatch
    global static Id updateCaseFields(){
        RestRequest request=RestContext.request;
        String caseId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case thisCase=[SELECT Id FROM Case WHERE Id=:caseId];
        Map<String,Object> params=(Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
        for(String field:params.keySet()){
            thisCase.put(field, params.get(field));
        }
        update thisCase;
        return thisCase.Id;
    }
}