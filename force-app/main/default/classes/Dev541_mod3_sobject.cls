public class Dev541_mod3_sobject {

    public static void SobjectDemo()
    {
        //取引先の作成
        Account a = new Account(name='NECラーニング');
        Insert a;
        
        //取引先責任者の作成
        Contact c = new Contact(lastName='山田太郎');
        c.AccountId = a.id;
        Insert c;
        
        //取引先、取引先責任者の更新
        c = [SELECT account.Name FROM Contact WHERE id = :c.id];
        c.account.name = 'NEC';
        c.LastName = '鈴木一郎';
        
        update c;
        update c.account;
        
    }
}