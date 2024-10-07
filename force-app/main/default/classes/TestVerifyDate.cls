/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestVerifyDate {
    @IsTest
    private static void CheckDatesTest() {
        Date date1 = Date.newInstance(2022, 06, 01);
        Date date2 = Date.newInstance(2022, 06, 15);
        Date date3 = Date.newInstance(2022, 07, 01);

        Test.startTest();
        Date result1 = VerifyDate.CheckDates(date1, date2);
        Date result2 = VerifyDate.CheckDates(date1, date3);
        Test.stopTest();

        System.assertEquals(date2, result1, 'Dates are within 30 days');
        System.assertEquals(Date.newInstance(2022, 06, 30), result2, 'Date is not within 30 days');
    }
}