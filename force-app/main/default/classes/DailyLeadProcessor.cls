public class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext ctx){
        List<lead> updateLeadList = new List<lead>();
        List<lead> leadList = new List<lead>([select id,LeadSource from lead where LeadSource=null]);
        for(lead l : leadList){
            l.LeadSource = 'Dreamforce';
            updateLeadList.add(l);
        }
        update updateLeadList;
    }
}