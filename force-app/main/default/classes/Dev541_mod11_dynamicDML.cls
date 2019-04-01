public class Dev541_mod11_dynamicDML {

    public static void DynamicDMLDemo()
    {
        Account acc = new Account();
        Schema.Sobjecttype tk;
        
        tk = acc.getSobjectType();
        
        SObject obj = tk.newSObject();
        obj.put('Name', '動的DMLテスト');
                
        insert (Account)obj;
    }
}