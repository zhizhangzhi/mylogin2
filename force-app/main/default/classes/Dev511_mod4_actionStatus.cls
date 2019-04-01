public class Dev511_mod4_actionStatus {

        Integer count = 0;
                
        public PageReference incrementCounter() {
                count=count+2;
                return null;
        }
                        
        public Integer getCount() {
                return count;
        }


}