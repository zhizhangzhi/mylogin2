//Apexデモ
public class Dev541_mod1_sample {

    public static void CodeSample()
    {
        //変数宣言
        Integer num = 10;
        
        //セールスフォースオブジェクト型変数＆配列
        Account[] accs;
        
        //SOQLクエリ
        accs = [SELECT id,name,AnnualRevenue FROM account];
        
        //制御構造
        for(Account a:accs){
            if (a.AnnualRevenue != null){
                a.AnnualRevenue *= 1.2;
            }else{
                a.AnnualRevenue = 0;
            }
        }
        
        //DML処理
        update accs;
    }
}