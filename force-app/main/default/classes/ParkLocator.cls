public with sharing class ParkLocator {
    public static String[] country(String code){
        ParkService.ParksImplPort park=new ParkService.ParksImplPort();
        String[] parkList=park.byCountry(code);
        return parkList;
    }
}