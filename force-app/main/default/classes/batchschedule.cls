global without sharing  class batchschedule implements Schedulable{
    Integer BATCH_SIZE=10;
    global void execute(SchedulableContext ctx){
        batch1 batch = new batch1();
        Database.executebatch(batch, BATCH_SIZE);
    }

}