public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String fname){
        List<List<sObject>> searchList = [FIND :fname IN NAME FIELDS 
                                          RETURNING Contact(FirstName,LastName,Department),Lead(FirstName,LastName)];
        return searchList;
    }
}