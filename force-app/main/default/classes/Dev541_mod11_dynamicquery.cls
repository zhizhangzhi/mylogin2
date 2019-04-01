public class Dev541_mod11_dynamicquery {

    public static void DynamicqueryDemo()
    {
        string searchKeyword = 'ac';
        string qry1 = 'SELECT id, name FROM ';
        string qry2 = 'account WHERE name LIKE \'%' + searchKeyword + '%\'';

        for (List<Account> accs:Database.query(qry1 + qry2))
        {
            for (Account a: accs)
            {
                System.debug(a.name);
            }
        }
    }
}