public class XmlReaderController {
    public class goods{
        public String item{get;set;}
        public String name{get;set;}
        public String type{get;set;}
    }
    public List<Goods> getGoodsListByXmlFile(String goodsXml){
        XmlStreamReader reader = new XmlStreamReader(goodsXml);
        Boolean flagXmlEnd = true;
        List<Goods> goodsList = new List<Goods>();
        while(flagXmlEnd){
            Goods tempGoods;
            if(reader.getEventType() == XmlTag.START_ELEMENT) {
                if(reader.getLocalName().equalsIgnoreCase('goods')) {
                    tempGoods = getGoods(reader);
                }
            }
            if(reader.hasNext()) {
                reader.next();
            } else {
                flagXmlEnd = false;
                break;
            }
            if(tempGoods != null) {
                goodsList.add(tempGoods);
            }
        }
        return goodsList;
    }
    Goods getGoods(XmlStreamReader reader) {
        Goods tempGoods = new Goods();
        tempGoods.item = reader.getAttributeValue(null,'item');
        Boolean flagIsLoop = true;
        while(flagIsLoop) {
            if(reader.hasNext()) {
                reader.next();
                if(reader.getEventType() == XmlTag.START_ELEMENT) {
                    if(reader.getLocalName().equalsIgnoreCase('name')) {
                        reader.next();
                        tempGoods.name = reader.getText();
                    } else if(reader.getLocalName().equalsIgnoreCase('type')) {
                        reader.next();
                        tempGoods.type = reader.getText();
                    }
                }
                if(reader.getEventType() == XmlTag.END_ELEMENT && reader.getLocalName().equalsIgnoreCase('goods')) {
                    flagIsLoop = false;
                    break;
                }
            } else {
                flagIsLoop = false;
                break;
            }
        }
        return tempGoods;
    }
		

}