public class ParkLocator {
    public static String[] country(String country){
        ParkService.ParksImplPort locator = new ParkService.ParksImplPort();
        return locator.byCountry(country);
    }
}