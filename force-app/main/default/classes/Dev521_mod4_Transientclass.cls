public class Dev521_mod4_Transientclass {

    DateTime t1;
//    DateTime t2;
    transient DateTime t2;
   
    public string getT1(){
        if (t1==null){
            t1 = System.now();
        }
        
        return '' + t1;
    }
    
        public string getT2(){
        if (t2==null){
            t2 = System.now();
        }
        
        return '' + t2;
    }
    public Pagereference updateTime(){
        getT1();
        getT2();
        return null;
    }

}