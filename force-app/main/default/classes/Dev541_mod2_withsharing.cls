public with sharing class Dev541_mod2_withsharing {

    public static void WithsharingDemo()
    {
        Integer num;
        num = [SELECT count() FROM Account];
        
        System.debug('取引先数：' + num.format());
    }

}