public class Dev521_mod4_wizclass {
    public String Name{ get; set;}
    public Integer Age{ get; set;}
    
    
    public PageReference goNext2()
    {   
        PageReference p = Page.Dev521_mod4_wiz2;
        return p;
    }
    
    public PageReference goNext3()
    {
        PageReference p = Page.Dev521_mod4_wiz3;
        return p;
    }

}