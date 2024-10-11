public with sharing class WarehouseSyncSchedule implements Schedulable {
    public static void execute(SchedulableContext sc){
        SampleMainApexClass syncJob=new SampleMainApexClass();
        System.enqueueJob(syncJob);
    }
    // Scheduler:
    // String sch=' 0 0 1 1/1 * ? *';
    // String jobID = System.schedule('WarehouseSyncScheduleJob', sch, new WarehouseSyncSchedule());
}