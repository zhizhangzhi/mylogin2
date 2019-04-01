global without sharing class Schedule_testBatch implements Schedulable{
	global static Integer size = 10;
    global void execute(SchedulableContext cx){
        testBatch batch = new testBatch();
        Database.executebatch(batch, size);
    }
}