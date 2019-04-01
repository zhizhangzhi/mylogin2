@isTest
public class DailyLeadProcessorTest {
	@isTest
    public static void test1(){
        List<lead> leadList = new List<lead>();
        for(Integer i=0;i<200;i++){
            lead l = new lead();
            l.lastname = 'lastname' + i;
            l.company = 'company' +i;
            leadList.add(l);
        }
        insert leadList;
        Test.startTest();
        DailyLeadProcessor dlp = new DailyLeadProcessor();
        String jobId = System.schedule('dailylead','0 14 11 16 11 ?',dlp);
        Test.stopTest();
        
        List<lead> leatListcheck = new List<lead>([select id,LeadSource from lead where LeadSource !='Dreamforce']);
        System.debug(leatListcheck.size());
        System.assertEquals(0,leatListcheck.size() );
    }
}