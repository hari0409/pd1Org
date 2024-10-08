@isTest
public with sharing class AnimalLocatorMock implements HttpCalloutMock{
    public static HttpResponse respond(HttpRequest request){
        HttpResponse responce=new HttpResponse();
        responce.setHeader('Content-Type', 'application/json;charset=UTF-8');
        responce.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        responce.setStatusCode(200);
        return responce;
    }
}