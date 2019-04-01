public class Dev541_mod4_aggregatequery {

    public static void QueryDemo()
    {
        System.debug('*****集計クエリーデモ*****');
        
        //GROUP BY
        AggregateResult[] ars = 
            [SELECT billingcountry,count(id) CNT
             FROM account 
             GROUP BY billingcountry
             HAVING count(id)>=2];
        
        for (AggregateResult ar:ars){
            System.debug(ar.get('billingcountry'));
            System.debug(ar.get('cnt'));
        }

        //ROLL UP
        ars = [SELECT billingcountry,count(id) CNT
               FROM account
               GROUP BY ROLLUP(billingcountry)];
        
        for (AggregateResult ar:ars){
            System.debug(ar.get('billingcountry'));
            System.debug(ar.get('cnt'));
        }
            
    }
}