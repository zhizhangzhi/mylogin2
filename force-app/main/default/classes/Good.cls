global class Good implements Comparable{
    public String name;
    public Decimal price;
    public String status;
    //public Good(String name,Decimal price,String status){
        //this.name = name;
        //this.price = price;
        //this.status = status;
        
    //}
    global Integer compareTo(Object compareTo){
        Integer result = 0;
        Good goo = (Good) compareTo;
        if(this.price > goo.price){
            result =  -1;
        }else if(this.price < goo.price){
            result =  1;
        }
        return result;
    }

}