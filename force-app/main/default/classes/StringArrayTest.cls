public class StringArrayTest {
    public static List<String> generateStringArray(Integer n){
        List<String> arrayTest = new List<String>();
        for(Integer i = 0; i<n;i++){
            arrayTest.add('Test '+i);
        }
    return arrayTest;
    }
}