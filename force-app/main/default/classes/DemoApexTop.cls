public class DemoApexTop {


    private ID getApexClassID(string classname)
    {
        return [SELECT id FROM ApexClass WHERE name = :classname][0].id;
    }
  
    private ID getApexTriggerID(string triggername)
    {
        return [SELECT id FROM ApexTrigger WHERE name = :triggername][0].id;
    }
    
    //Apexコードサンプル
    public PageReference doDev541_mod1_sample()
    {
        Dev541_mod1_sample.CodeSample();
        
        return null;
    }
    
    public ID getDev541_mod1_sample()
    {
        return getApexClassID('Dev541_mod1_sample');
    }
    
    //ガバナ制限値オーバー
    public PageReference doDev541_mod1_governor() {
        Dev541_mod1_governor.OutOfLimitSample(1000);
        
        return null;
    }

    public ID getDev541_mod1_governor() {
        return getApexClassID('Dev541_mod1_governor');
    }

    //With Sharing
    public PageReference doDev541_mod1_withsharing() {  
        Dev541_mod2_withsharing.WithsharingDemo();
        return null;
    }


    public ID getDev541_mod1_withsharing() {
        return getApexClassID('Dev541_mod2_withsharing');
    }

    //データ型
    public PageReference doDev541_mod3_DataType() {  
        Dev541_mod3_DataType.DataTypeDemo();
        return null;
    }

    public ID getDev541_mod3_DataType() {
        return getApexClassID('Dev541_mod3_DataType');
    }
    
    //SObject
    public PageReference doDev541_mod3_sobject() {
        Dev541_mod3_sobject.SobjectDemo();
        return null;
    }


    public ID getDev541_mod3_sobject() 
    {
         return getApexClassID('Dev541_mod3_sobject');   
    }

    //コレクション
    public PageReference doDev541_mod3_collection() {
        Dev541_mod3_collection.CollectionDemo();
        return null;
    }


    public String getDev541_mod3_collection()
    {
        return getApexClassID('Dev541_mod3_collection'); 
        }


    //クエリ
    public PageReference doDev541_mod3_query() {
        Dev541_mod3_query.QueryDemo();
        return null;
    }


    public String getDev541_mod3_query()
    {
        return getApexClassID('Dev541_mod3_query'); 
     }

    //集計クエリ
    public PageReference doDev541_mod4_aggregatequery() {
        Dev541_mod4_aggregatequery.QueryDemo();
        return null;
    }

    public String getDev541_mod4_aggregatequery()
    {
        return getApexClassID('Dev541_mod4_aggregatequery'); 
     }
             
    //共有の追加
    public PageReference doDev541_mod4_sharing() {
        Dev541_mod4_sharing.SharingDemo();
        return null;
    }


    public String getDev541_mod4_sharing()
    {
        return getApexClassID('Dev541_mod4_sharing'); 
        }
    
    //クラスライブラリ
    public PageReference doDev541_mod5_classlib() {
        Dev541_mod5_classlib.ClasslibDemo();
        return null;
    }


    public String getDev541_mod5_classlib()
    {
        return getApexClassID('Dev541_mod5_classlib'); 
        }
    
    //トリガ
    public PageReference doDev541_mod6_trigger() {
        return null;
    }


    public String getDev541_mod6_trigger()
    {
        return getApexTriggerID('Dev541_mod6_trigger'); 
    }
    
    //テストの実行
    public String getDev541_mod7_testmethod()
    {
        return getApexClassID('Dev541_mod7_testmethod'); 
    }
    
    //
    public String getDev541_mod9_HelloService()
    {
        return getApexClassID('Dev541_mod9_HelloService'); 
    }
    
    //
    public String getDev541_mod9_Rest()
    {
        return getApexClassID('Dev541_mod9_Rest'); 
    }
    
    public PageReference doDev541_mod9_Rest()
    {        
        return Page.Dev541_mod9_Rest;
    }

    //
    public String getDev541_mod10_mail()
    {
        return getApexClassID('Dev541_mod10_mail'); 
    }
    
    //
    public String getDev541_mod11_describe()
    {
        return getApexClassID('Dev541_mod11_describe'); 
    }
    
    public PageReference doDev541_mod11_describe()
    {        
        Dev541_mod11_describe.DescribeDemo();
        return null;
    }
  
    public String getDev541_mod11_dynamicquery()
    {
        return getApexClassID('Dev541_mod11_dynamicquery'); 
    }
    
    public PageReference doDev541_mod11_dynamicquery()
    {        
        Dev541_mod11_dynamicquery.DynamicqueryDemo();
        return null;
    }

    public String getDev541_mod11_dynamicDML()
    {
        return getApexClassID('Dev541_mod11_dynamicDML'); 
    }
    
    public PageReference doDev541_mod11_dynamicDML()
    {        
        Dev541_mod11_dynamicDML.DynamicDMLDemo();
        return null;
    }
    
    public String getDev541_batchapex()
    {
        return getApexClassID('Dev541_batchapex'); 
    }
    
    public PageReference doDev541_batchapex()
    {        
        Dev541_batchapex bat = new Dev541_batchapex('SELECT Id, name, AnnualRevenue FROM Account');
        Database.executeBatch(bat);
        
        return null;
    }

    public String getDev541_batchschedule()
    {
        return getApexClassID('Dev541_batchschedule'); 
    }
    
    public PageReference doDev541_batchschedule()
    {        
        Dev541_batchschedule.BatchScheduleStart();
        
        return null;
    }
    
           
}