@isTest
public class LeadProcessorTest {
	@isTest
    public static void test1(){
        List<Lead> leadList = new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead l = new Lead();
            l.LastName='name'+i;
            l.Company='company';
            l.Status='Open - Not Contacted';
            leadList.add(l);
        }
        insert leadList;
        test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        test.stopTest();
        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }
}