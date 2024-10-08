@isTest
public with sharing class ParkServiceMock implements WebServiceMock{
    public static void doInvoke(Object stub, Object request, Map<String,Object> response, String endpoint, String soapAction, String requestName,String responseNS, String responseName, String responseType) {
        ParkService.byCountryResponse response_x=new ParkService.byCountryResponse();
        response_x.return_x=new List<String>{'India Park 1','India Park 2','India Park 3','India Park 4'};
        response.put('response_x',response_x);
    }
}