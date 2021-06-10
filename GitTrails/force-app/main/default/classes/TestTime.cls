public class TestTime {
    public static void timezone(){
        Datetime dt = System.now();
        String dtIST = dt.format('yyyy-MM-dd HH:mm:ss', 'IST');
        String dtAEST = dt.format('yyyy-MM-dd HH:mm:ss', 'Australia/Sydney');
        System.debug('dt-' + dt);
        System.debug('dtIST-' + dtIST);
        System.debug('dtAEST-' + dtAEST);
        DateTime dt1=DateTime.valueOfGmt(dtAEST);
        System.debug('dt1-'+ dt1);
    }
}