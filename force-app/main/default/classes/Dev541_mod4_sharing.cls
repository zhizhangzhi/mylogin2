public class Dev541_mod4_sharing {
    
    public static void SharingDemo()
    {
        //テスト用データの追加
        Account acc = new Account(name='共有追加デモ');
        Insert acc;
        
        //組織全体グループのID取得
        ID orgID = [SELECT id FROM Group WHERE type='Organization'][0].id;
        
        //手動共有の設定
        //AccountShare aShare = new AccountShare();
        //aShare.UserOrGroupId = orgID;
        //aShare.AccountAccessLevel = 'Edit'; 
        //aShare.OpportunityAccessLevel = 'Read';
        
        //aShare.AccountId = acc.id;
        
        //Insert aShare;
    }
}