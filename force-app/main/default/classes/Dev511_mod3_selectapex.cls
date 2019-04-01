public class Dev511_mod3_selectapex {
    string[] countries = new string[]{};
    
    public PageReference test()
    {
        return null;
    }
    
    public List<SelectOption> getItem()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('TOKYO','東京'));
        options.add(new SelectOption('OSAKA','大阪'));
        options.add(new SelectOption('FUKUOKA','福岡'));
        return options;
        
    }
    
    public string[] getCountries()
    {
        return countries;
    }
    
    public void setCountries(String[] countries)
    {
        this.countries = countries;
    }

}