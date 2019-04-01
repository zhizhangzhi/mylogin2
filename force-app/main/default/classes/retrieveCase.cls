public class retrieveCase {
  public String getContactName() {
return 'Barr Tim';
}
public List<Case> getCases() {
return [SELECT status, subject FROM Case
WHERE Contact.name = 'Barr Tim' AND status != 'Closed' limit 5];
}
}