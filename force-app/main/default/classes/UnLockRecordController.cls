public class UnLockRecordController {
    @InvocableMethod(label='UnLock Opportunities' description='UnLock Opportunities and return the record ids')
    public static List<ID> unlockRecords(List<ID> opportunityIds) {
        system.debug('=========opportunityIds=======' + opportunityIds);
        system.debug('---------userName-------' + UserInfo.getUserName());
        List<ID> alreadyUnLockedList = new List<ID>();
        Map<Id,Boolean> isLockedMap = Approval.isLocked(opportunityIds);
        for(Id currentOpportunityId : opportunityIds) {
            Boolean isCurrentOpportunityLocked = isLockedMap.get(currentOpportunityId) == null ? false : isLockedMap.get(currentOpportunityId);
            if(isCurrentOpportunityLocked) {
                Approval.UnLockResult unLockResult = Approval.unlock(currentOpportunityId);
                if(unLockResult.isSuccess()) {
                    alreadyUnLockedList.add(currentOpportunityId);
                } else {
                    for(Database.Error error : unLockResult.getErrors()) {
                        System.debug('error message : ' + error.getMessage());
                    }
                }
            }
        }
        system.debug(alreadyUnLockedList);
        return alreadyUnLockedList;
    }


}