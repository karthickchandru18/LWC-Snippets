({
    Add : function(component, event, helper) {
        var a = component.get("v.num1")
        var b = component.get("v.num2")
       // component.set("v.total",parseInt(a) + parseInt(b));
        var action = component.get("c.getaddition")
        action.setParams({"fnum":a,"snum":b})
        action.setCallback(this, function(response){
            var state = response.getState()
            if (state === "SUCCESS") {
                component.set("v.total", response.getReturnValue())
            }
        });
        $A.enqueueAction(action)
    },
    Sub : function(component, event, helper) {
        var a = component.get("v.num1")
        var b = component.get("v.num2")
        //component.set("v.total",parseInt(a) + parseInt(b));
        var action = component.get("c.getsubtraction")
        action.setParams({"fnum":a,"snum":b})
        action.setCallback(this, function(response){
            var state = response.getState()
            if (state === "SUCCESS") {
                component.set("v.totalsub", response.getReturnValue())
            }
        });
        $A.enqueueAction(action)
    }
})