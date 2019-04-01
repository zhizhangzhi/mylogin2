public class Dev541_mod9_Rest {
    
    public String Telop{get; set;}
    public String Description{get; set;}
    
    public Dev541_mod9_Rest()
    {
        HttpRequest req = new Httprequest();
        
        string reqUrl = 'http://weather.livedoor.com/forecast/webservice/rest/v1?';
        reqUrl += 'city=63&';
        reqUrl += 'day=today';
        
        req.setEndpoint(reqUrl);
        req.setMethod('GET');
        
        Http h = new Http();
        HttpResponse res = h.send(req);
            
        XmlStreamReader xr = res.getXmlStreamReader();
        while (xr.hasNext()){
            if (xr.getEventType() == XmlTag.START_ELEMENT){
                                
                if (xr.getLocalName() == 'telop'){
                    xr.next();
                    
                    telop = xr.getText();
                    
                    System.debug(telop);
                }else if (xr.getLocalName() == 'description'){
                    xr.next();
                    
                    description = xr.getText();
                    
                    System.debug(description);
                }
                
                
            }
            xr.next();
        }
    }
}