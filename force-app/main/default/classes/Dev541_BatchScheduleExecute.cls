global class Dev541_BatchScheduleExecute implements Schedulable{
   global void execute(SchedulableContext sc)
   {
        Dev541_batchapex b = new Dev541_batchapex('Select Id, name, AnnualRevenue From Account'); 
        database.executebatch(b);
   }
}