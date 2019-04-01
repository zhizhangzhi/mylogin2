public class TestUserHelper {
    public static User createUserByPermission(String permissionSetName){
        Profile pf1 = [select id from profile where name='System Administrator'];
        User runAsUser = new User(alias = 'zhi', email='ilikeeatsleep@163.com',
                                    emailencodingkey='GB2312', lastname='zhi', languagelocalekey='en_US',
                                    localesidkey='zh_CN', profileid = pf1.Id,  country='CN', CommunityNickname = 'xiaozhi',
                                    timezonesidkey='Asia/Shanghai', username='ilikeeatsleep@163.com' );
        Insert runAsUser;
        PermissionSet pSet = [select id,label from PermissionSet where Name = :permissionSetName];
        PermissionSetAssignment Asign = new PermissionSetAssignment();
        Asign.AssigneeId = runAsUser.Id;
        Asign.PermissionSetId = pSet.Id;
        Insert Asign;
        return runAsUser;
    }
    public static User createUserByPermissionAndProfile(String permissionSetName,String profileName){
        Profile pf1 = [select id from profile where name= :profileName];
        User runAsUser = new User(alias = 'zhi', email='ilikeeatsleep@163.com',
                                    emailencodingkey='GB2312', lastname='zhi', languagelocalekey='en_US',
                                    localesidkey='zh_CN', profileid = pf1.Id,  country='CN', CommunityNickname = 'xiaozhi',
                                    timezonesidkey='Asia/Shanghai', username='ilikeeatsleep@163.com' );
        Insert runAsUser;
        PermissionSet pSet = [select id,label from PermissionSet where Name = :permissionSetName];
        PermissionSetAssignment Asign = new PermissionSetAssignment();
        Asign.AssigneeId = runAsUser.Id;
        Asign.PermissionSetId = pSet.Id;
        Insert Asign;
        return runAsUser;
    }
    
}