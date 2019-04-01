@isTest
public class AnimalLocatorTest {
	@isTest
    public static void AnimalLocatorTest(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String s = AnimalLocator.getAnimalNameById(1);
        System.debug(s);
        System.assertEquals('chicken', s);
    }
}