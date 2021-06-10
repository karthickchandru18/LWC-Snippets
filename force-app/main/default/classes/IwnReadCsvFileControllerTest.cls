@isTest
public class IwnReadCsvFileControllerTest {    
    public static String str = 'BASE STATION,SENSOR ID,STATUS,SENSOR MODEL \n' +
        'Leeds,1,Enabled ,R8 \n' +
        'Glasgow Central,2,Enabled,R8';
@isTest
    public static void testReadCSVFile(){
    ContentVersion contentVersionInsert = new ContentVersion(
            Title = 'Test',
            PathOnClient = 'Test.csv',
            VersionData = Blob.valueOf(str),
            IsMajorVersion = true
    );
    insert contentVersionInsert;
    Id getId = [Select ContentDocumentId From ContentVersion Where Id =:contentVersionInsert.id and isLatest=true].ContentDocumentId;
List<account> result = CSVFileReadLWCCntrl.csvFileRead(contentVersionInsert.Id);
}   
}