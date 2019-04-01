public class AnimalLocator {
    public static String getAnimalNameById(Integer animalId) {
        String animalName = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String strEndpoint = 'https://th-apex-http-callout.herokuapp.com/animals/' + String.valueOf(animalId);
        system.debug(strEndpoint);
        request.setEndpoint(strEndpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String, Object> animalDetail = (Map<String, Object>) results.get('animal');
            animalName = String.valueOf(animalDetail.get('name'));
            system.debug(animalName);
        }
        return animalName;
    }
}