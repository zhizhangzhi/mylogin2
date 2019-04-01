public class Dev541_mod5_classlib {

    public static void ClasslibDemo()
    {
        System.debug('******クラスライブラリ******');
        
        //Systemクラス
        Date d1 = System.today();
        Datetime d2 = System.now();
        
        System.debug(d1);
        System.debug(d2);
        
        //UserInfoクラス
        String n1 = UserInfo.getName();
        String n2 = UserInfo.getUserName();

        System.debug(n1);
        System.debug(n2);
        
        //Mathクラス
        Double m1 = 1234.56789;
        Long m2 = Math.Round(m1);
        
        System.debug(m1);
        System.debug(m2);
        
        //Limitsクラス
        Integer l1 = Limits.getQueries();
        Integer l2 = Limits.getLimitQueries();  
        
        System.debug(l1.format() + '/' + l2.format());
        
        //Databaseクラス
        Savepoint sp = Database.setSavepoint();
        
        try{
            Account a1 = new Account(name='ライブラリデモ');           
            Database.insert(a1);

            //必須項目がNULLでエラー         
            Account a2 = new Account();
        
            //オプションがFalseなのでエラー発生せず
            //上のInsertもそのまま残る
            Database.insert(a2, false);
            
        }catch(Exception ex){
            System.debug(ex.getMessage());
            
            Database.rollback(sp);
        }
            
    }
}