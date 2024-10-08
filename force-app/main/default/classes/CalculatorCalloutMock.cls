@isTest
public with sharing class CalculatorCalloutMock implements WebServiceMock{
    public static void doInvoke(Object stub,Object request, Map<String,Object> response, String endpoint,String soapAction,String requestName,String responseNS,String responseName,String responseType){
        // For the method being calling, find the response Class from the WSDL Class and create an object for it.
        calculatorServices.doAddResponse response_x=new calculatorServices.doAddResponse();
        // Assign the response to the response parameter.
        response_x.return_x = 3.0;
        response.put('response_x', response_x);
    }
}