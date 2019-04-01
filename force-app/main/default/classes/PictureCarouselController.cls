public class PictureCarouselController {
    public String[] picSources{get;set;}
    
    public String[] picDescribes{get;set;}
    public PictureCarouselController() {
    	picSources = new String[]{
    		'https://c.ap2.visual.force.com/servlet/servlet.FileDownload?file=0152800000311Jp',
    		'https://c.ap2.visual.force.com/servlet/servlet.FileDownload?file=0152800000311Jz',
    		'https://c.ap2.visual.force.com/servlet/servlet.FileDownload?file=0152800000311K4'
    		};
    	
    	picDescribes = new String[] {
    		'测试1',
    		'测试2',
    		'测试3'
    	};
    }

          //0152800000311Jp  0152800000311Jz  0152800000311K4
       
}