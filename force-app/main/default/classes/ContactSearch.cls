public class ContactSearch {
    public static List<Contact> searchForContacts(String last,String mailCode){
    	List<Contact> con = new List<Contact>();
        con = [select id,name from contact where MailingPostalCode = :mailCode and lastname = :last];
        return con;
    }
}