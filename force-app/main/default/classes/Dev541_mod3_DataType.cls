//システムログを表示して結果を確認してください
public class Dev541_mod3_DataType {

    private enum Season{WINTER ,SPRING, SUMMER, FALL}
    
    public static void DataTypeDemo()
    {
        //基本データ型
        Integer num = 10;
        
        Date dt = System.today();
        System.debug(dt);
        System.debug(dt.addDays(30));
        
        String str = 'Apex Code Sample';    
        System.debug(str);
        System.debug(str.length());
        
        //列挙型
        Season se;
        se = Season.WINTER;
        
        if (se == Season.WINTER){
            System.debug('WINTER');
        }else if (se == Season.SPRING){
            System.debug('SPRING');
        }else if (se == Season.SUMMER){
            System.debug('SUMMER');
        }else if (se == Season.FALL){
            System.debug('FALL');
        }else{
            System.debug('Unknown Season');
        }
        
    }
}