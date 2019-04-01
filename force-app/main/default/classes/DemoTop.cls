public class DemoTop {
	//jjjjjjjjjjjjjjjjjjjjjjjjjjjj
    public string AccountID{
        get{
            string aID = [SELECT id FROM account LIMIT 1].id;
            return aID;
        }
    }
    
    public string ContactID{
        get{
            string cID = [SELECT id FROM contact LIMIT 1].id;
            return cID;
        }
    }
}