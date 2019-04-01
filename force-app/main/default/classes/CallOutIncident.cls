public class CallOutIncident {
    Integer i;
    String ss='error';
    String dd='true';
    public String ReturnI(Integer i){
        if(i>5){
            throw new CommonException('error');
        } else{
            return dd;
        }
    }
    
    
	
}