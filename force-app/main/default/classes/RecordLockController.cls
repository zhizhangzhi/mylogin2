public class RecordLockController {
    @InvocableMethod(label='Lock Opportunities' description='Lock opportunities and return the record ids') 
    public static List<Id> lockRecord(List<Id> opportunityIds) {
        system.debug('=========opportunityIds=======' + opportunityIds);
        system.debug('---------userName-------' + UserInfo.getUserName());
        List<ID> alreadyLockedList = new List<ID>();
        Map<Id,Boolean> isLockedMap = Approval.isLocked(opportunityIds);
        for(Id currentOpportunityId : opportunityIds) {
            Boolean isCurrentOpportunityLocked = isLockedMap.get(currentOpportunityId) == null ? false : isLockedMap.get(currentOpportunityId);
            if(!isCurrentOpportunityLocked) {
                Approval.LockResult lockResult = Approval.lock(currentOpportunityId);
                if(lockResult.isSuccess()) {
                    alreadyLockedList.add(currentOpportunityId);
                } else {
                    for(Database.Error error : lockResult.getErrors()) {
                        System.debug('error message : ' + error.getMessage());
                    }
                }
            }
        }
        system.debug(alreadyLockedList);
        return alreadyLockedList;
    }


}