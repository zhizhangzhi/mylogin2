public class Dev541_mod7_testmethod {

    public static Integer Mult(Integer n1, Integer n2)
    {
        return n1 * n2;
    }
    
    public static testMethod void doTest()
    {
        Integer a = 10;
        Integer b = 20;
        
        Integer c = Mult(a,b);
        
        System.assert(c == 200);
    }
}