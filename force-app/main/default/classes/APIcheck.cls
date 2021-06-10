@RestResource (urlmapping ='/testsurl/*')
global class APIcheck{
   
   @HTTPPost
   global static lead createNewContact() {
        lead ld;
        return ld;
    }

}