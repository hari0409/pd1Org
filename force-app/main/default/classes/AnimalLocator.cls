public with sharing class AnimalLocator {

    public static String getAnimalNameById(Integer animalId){
        String url='https://th-apex-http-callout.herokuapp.com/animals/'+animalId;

        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');

        Map<String,Object> animal=new Map<String,Object>();

        HttpResponse responce=http.send(request);
        if (responce.getStatusCode()==200){
            Map<String,Object> animalObject=(Map<String,Object>) JSON.deserializeUntyped(responce.getBody());
            animal=(Map<String,Object>)animalObject.get('animal');
        }
        return (String)animal.get('name');
    }
}