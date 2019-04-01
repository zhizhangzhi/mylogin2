public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer num,String lastName){
        List<Contact> contactList = new List<Contact>();
        for(Integer i=0;i<num;i++){
            Contact c = new Contact(FirstName=i.format(),LastName=lastName);
            contactList.add(c);
        }
        return contactList;
    }
}