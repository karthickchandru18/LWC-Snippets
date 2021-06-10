({
	handleSendData : function(component, event, helper) {
        
        var greeting = component.get(' v.greeting');
        //$A.get("e.c:appEvent");
		var cmpEvent = component.getEvent("cmpEvent");
        
        cmpEvent.setParams({
            message: greeting
        });
        
        cmpEvent.fire();
	}
})