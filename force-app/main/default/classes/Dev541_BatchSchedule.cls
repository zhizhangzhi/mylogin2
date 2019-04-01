public class Dev541_BatchSchedule {

    public static void BatchScheduleStart()
    {
        String jobId = 
            System.schedule('スケジューリングサンプル',
                getSchedule(), new Dev541_BatchScheduleExecute());
    }
    
    public static string getSchedule()
    {        
        Date dt = System.today();
        dt = dt.addDays(10);
        
        String sc = '0 0 0 ' + dt.day().format()+' '+ dt.month().format()+' ? ' + String.valueOf(dt.year());
        
        System.debug(sc);
 
        return sc;
    }
}