public class Dev541_mod11_describe {

    public static void DescribeDemo(){
        Map<string, Schema.Sobjecttype> smap = Schema.getGlobalDescribe();
        
        String name = 'Account';
        Schema.Describesobjectresult objDsc = smap.get(name).getDescribe();
        
        Map<string, Schema.Sobjectfield> fmap = objDsc.fields.getMap();
        
        String fname = 'Industry';
        
        Schema.Describefieldresult fldDsc = fmap.get(fname).getDescribe();
        
        List<Schema.Picklistentry> plist = fldDsc.getPicklistValues();
        
        for(Schema.Picklistentry p: plist)
        {
            System.Debug(p.getLabel());
        }
    }
}