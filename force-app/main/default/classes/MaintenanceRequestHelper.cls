public class MaintenanceRequestHelper {
    public static void updateWorkOrders(Map<Id,case> caseMap,List<Work_Part__c> workPartList){
        List<Work_Part__c> allWorkPart = workPartList;
        Decimal shortestCycle;
        List<Case> caseCreate = new List<Case>();
        for(Case c : caseMap.values()){
            List<Work_Part__c> relatedworkPart = new List<Work_Part__c>();
            for(Work_Part__c workPart : workPartList){
                if(c.Id == workPart.Maintenance_Request__c){
                    relatedworkPart.add(workPart);
                }
            }
            shortestCycle = getMaintenanceCycle(relatedworkPart);
            Case newCase = new Case();
            newCase.Vehicle__c = c.Vehicle__c;
            newCase.Equipment__c = c.Equipment__c;
            newCase.Type = 'Routine Maintenance';
            newCase.Subject = String.isBlank(c.Subject)?'Routine Maintenance Request':c.Subject;
            newCase.Date_Reported__c = Date.today();
            newCase.Date_Due__c = Date.today().addDays(Integer.valueOf(shortestCycle));
            newCase.Status = 'New';
            newCase.Old_Case__c = c.Id;
            caseCreate.add(newCase);
        }
        if(caseCreate.size() > 0){
            insert caseCreate;
            updateRelatedWorkPart(caseCreate,allWorkPart);
        }
    }
    public static Decimal getMaintenanceCycle(List<Work_Part__c> workPartList){
        Decimal maintenanceCycle;
        List<Decimal> cycleList = new List<Decimal>();
        if(workPartList.size() > 0){
            for(Work_Part__c workPart : workPartList){
            	cycleList.add(workPart.Equipment__r.Maintenance_Cycle__c);
                cycleList.sort();
            }
        }
        if(cycleList.size()>0){
            maintenanceCycle=cycleList.get(0);
        }else{
            maintenanceCycle=0.0;
        }
        return maintenanceCycle;
    }
    public static void updateRelatedWorkPart(List<Case> caseList,List<Work_Part__c> workPartList){
        Map<Id,Id> oldToNewCaseMap = new Map<Id,Id>();
        for(case singleCase : caseList){
            oldToNewCaseMap.put(singleCase.Old_Case__c,singleCase.Id);
        }
        if(workPartList!=null){
            for(Work_Part__c singleWorkPart : workPartList){
                Id newCaseId = oldToNewCaseMap.get(singleWorkPart.Maintenance_Request__c);
                //singleWorkPart.Maintenance_Request__c = newCaseId;
            }
        }
        if(workPartList!=null && workPartList.size() > 0){
            update workPartList;
        }
    }
}