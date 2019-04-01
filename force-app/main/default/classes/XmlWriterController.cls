public class XmlWriterController {
    
    public static void writeXml() {
        XmlStreamWriter writer = new XmlStreamWriter();
        writer.writeStartDocument('utf-8','1.0');
        writer.writeComment('goodsList start here');
        writer.writeStartElement('','goodsList','http://www.goods.com');
        writer.writeNamespace('', 'http://www.goods.com'); 
        writer.writeStartElement(null,'goods',null);
        writer.writeAttribute(null,null,'item','1');
        writer.writeStartElement(null,'name',null);
        writer.writeCharacters('华为手机');
        writer.writeEndElement();
        writer.writeStartElement(null,'type',null);
        writer.writeCharacters('华为');
        writer.writeEndElement();
        writer.writeEndElement();
        writer.writeStartElement(null,'goods',null);
        writer.writeAttribute(null,null,'item','2');
        writer.writeStartElement(null,'name',null);
        writer.writeCharacters('小米手机');
        writer.writeEndElement();
        writer.writeStartElement(null,'type',null);
        writer.writeCharacters('小米');
        writer.writeEndElement();
        writer.writeEndElement();
        writer.writeEndElement();
        writer.writeEndDocument();
        system.debug(writer.getXmlString());
    }
}