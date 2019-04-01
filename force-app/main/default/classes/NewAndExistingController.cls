public class NewAndExistingController {
 // ApexPages.StandardSetController must be instantiated
// for standard list controllers
public ApexPages.StandardSetController setCon {
get {
if(setCon == null) {
setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
[SELECT Name, CloseDate FROM Opportunity]));
}
return setCon;
}
set;
}
// Initialize setCon and return a list of records
public List<Opportunity> getOpportunities() {
    System.debug('$$$$$$$$'+(List<Opportunity>) setCon.getRecords());
return (List<Opportunity>) setCon.getRecords();
}


}