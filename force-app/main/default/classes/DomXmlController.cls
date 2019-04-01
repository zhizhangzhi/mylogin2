public class DomXmlController {
    public class Goods{
        String item{get;set;}
        String name{get;set;}
        String type{get;set;}
    }
    public List<Goods> getGoodsViaXmlDom(String XmlString){
        Dom.Document document = new Dom.Document();
        document.load(XmlString);
        Dom.XmlNode rootElement = document.getRootElement();
        System.debug(rootElement);
        System.debug(rootElement.getChildElements());
        List<Goods> goodsList = new List<Goods>();
        for(Dom.XmlNode node : rootElement.getChildElements()){
            if(node.getName().equalsIgnoreCase('goods')){
                Goods tempGoods = new Goods();
                tempGoods = getGoodsNameAndType(node);
                tempGoods.item = node.getAttribute('item',null);
                System.debug(tempGoods.item);
                goodsList.add(tempGoods);
            }
        }
        return goodsList;
    }
    Goods getGoodsNameAndType(Dom.XmlNode parentNode){
        Goods tempGoods = new Goods();
        System.debug(parentNode.getChildElements());
        for(Dom.XmlNode node : parentNode.getChildElements()){
            if(node.getName().equalsIgnoreCase('name')){
                tempGoods.name = node.getText();
            }else if(node.getName().equalsIgnoreCase('type')){
                tempGoods.type = node.getText();
            }
        }
        return tempGoods;
    }

}