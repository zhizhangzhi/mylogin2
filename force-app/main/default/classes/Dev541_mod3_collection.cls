public class Dev541_mod3_collection {
    
    public static void CollectionDemo()
    {
        //List
        List<String> c1 = new List<String>();
        c1.add('One');
        c1.add('Two');
        c1.add('Three');
        
        System.debug('*****コレクションデモ*****');
        
        System.debug('Listデータ型');
        for(integer i=0; i<3; i++){
            System.debug(c1.get(i));
        }
        
        //Set
        Set<String> c2 = new Set<String>();
        c2.add('One');
        c2.add('Two');
        c2.add('Three');
        
        System.debug('Setデータ型');
        System.assert(c2.contains('Two'));
        
        //Map
        Map<ID,Account> c3 = new Map<ID,Account>([SELECT id,name FROM Account]);
        
        System.debug('Mapデータ型');
        
        for(ID keyId:c3.KeySet()){
            System.debug(c3.get(keyId).name);
        }   
    }

}