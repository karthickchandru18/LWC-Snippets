public virtual class MySampleApexClass {       
   public static Integer myValue = 0;  

   
   public virtual void getCalculatedValue () {

      myValue = myValue+10;
      myValue = myValue*100;
       System.debug(myValue);
      
       
   }
}