public class AddPrimaryContact implements Queueable{
	public contact c;
    public String state;
    public AddPrimaryContact(contact c,String state){
        this.c=c;
        this.state=state;
    }
    public void execute(QueueableContext context){
        List<Account> accountList = new List<Account>([select id,name,BillingState from account where BillingState = :this.state limit 200]);
        List<contact> contactList = new List<contact>();
        for(Account a : accountList){
            contact c = new contact();
            c = this.c.clone();
            System.debug(c);
            c.AccountId = a.Id;
            contactList.add(c);
        }
        insert contactList;
    }
}