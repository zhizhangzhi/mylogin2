public class Dev511_mod3_inputfile {

    public Dev511_mod3_inputfile(ApexPages.StandardController controller) {
        Document d = (Document) controller.getRecord();
        d.folderid = UserInfo.getUserId();
    }

}