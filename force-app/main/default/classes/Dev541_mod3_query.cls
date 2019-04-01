public class Dev541_mod3_query {

    public static void QueryDemo()
    {
        System.debug('*****クエリーデモ*****');
        
        //SOQL
        System.debug('SOQL');
        List<Account> a1 = [SELECT id, name FROM Account];      
        System.debug(a1.size());
        
        //COUNT関数
        System.debug('COUNT関数');
        Integer numOfAccount = [SELECT count() FROM Account];
        System.debug(numOfAccount);

        //バインド
        System.debug('バインド');
        String name='%ac%';
        List<Account> a2 = 
            [SELECT id, name, annualRevenue 
             FROM Account
             WHERE name LIKE :name];
        
        for (Account a:a2){
            System.debug(a.name);
        }
        
        //関係クエリ
        System.debug('関係クエリ');
        List<Account> a3 = [SELECT id, name, (SELECT lastname FROM Contacts) FROM Account];
        for (Account a:a3){
            System.debug(a.name + a.contacts);
        }
        
        //Query More
        System.debug('Query More');
        for(List<Account> accs:[SELECT id,name FROM Account]){
            for(Account a:accs){
                System.debug(a.name);
            }
        }
        
        //SOSL
        System.debug('SOSL');
        List<List<SObject>> searchList = [FIND 'ac*' IN ALL FIELDS RETURNING Account (id, name), Contact(id,name)];
        List<Account> sl1 = (List<Account>)searchList[0];
        if (sl1.size() > 0){
            System.debug(sl1[0].name);
        }
            
        List<Contact> sl2 = (List<Contact>)searchList[1];
        if (sl2.size() > 0){
            System.debug(sl2[0].name);
        }
    }
}