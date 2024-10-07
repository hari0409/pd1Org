public with sharing class StringListTest {
    public static List<String> generateStringList(Integer num) {
        List<String> responce=new List<String>();
        for (Integer i=0;i<num;i++){
            responce.add('Test '+i);
        }


        // Insert the Josh contact
        Contact josh = new Contact(FirstName='Josh',LastName='Kaplan',Department='Finance', Email='johnkathy@gmail.com');
        Contact kathy = new Contact(FirstName='Kathy',LastName='Brown',Department='Technology', Email='johnkathy@gmail.com');
        List<Contact> contacts = new List<Contact> { josh, kathy };
        // Call upsert
        upsert contacts Contact.fields.Email;
        Database.upsert(contacts,Contact.fields.Email, false);

        return responce;
    }

    @future(callout=true)
    public static void sampleCallout() {
        HttpRequest req=new HttpRequest();
        String endPoint='https://th-apex-http-callout.herokuapp.com/animals';
        req.setEndpoint(endPoint);
        req.setMethod('GET');
        Http http=new Http();
        HttpResponse resp=http.send(req);
        System.debug(resp.getBody());
    }
}