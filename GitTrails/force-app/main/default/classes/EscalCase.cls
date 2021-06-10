public class EscalCase {
    //Apex properties or variables

    public Id owner {get; set;}
    public Id Id { get; set; }
    public Case cas { get; set; }

    //constructor to get the Case record
    public EscalCase(ApexPages.StandardController controller) {
    cas =  (Case) controller.getRecord();
    Id = cas.Id;
    System.debug('The case record: ' + cas);
    owner = cas.OwnerId;
    }

    //Method that can is called from the Visual Force page action attribute
    public PageReference caseEscalation() {
       System.debug('Case Owner: ' + owner);
        System.debug('Case Id: ' + Id);
        //build your code logic here
       PageReference pageRef = new PageReference('/'+Id);
        pageRef.setRedirect(true);
       return pageRef; //Returns to the case page
    }
}