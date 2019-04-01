public class Dev541_mod1_governor {

    public static void OutOfLimitSample(Integer num)
    {
        try{
            for (Integer i=0; i<num; i++)
            {
                Account[] accs = [SELECT id FROM Account];
                
            }
        }catch(Exception ex){
            System.debug(ex.getMessage());
        }
    }
}