({
    doInit : function(component, event) {
        var action = component.get("c.getcontact");
        action.setParams({accountid:component.get("v.recordId")})
        action.setCallback(this, function(a) {
            component.set("v.contacts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    call: function (component, event, helper) {
        var id=event.getSource().get('v.name');
        alert(id);
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": id,
            "slideDevName": "detail"
        });
        navEvt.fire();
    },
    dobysearch : function(component, event) {
        var action1 = component.get("c.getcontactbyname");
        action1.setParams({name:component.get("v.searchtext")})
        action1.setCallback(this, function(a) {
            component.set("v.contacts", a.getReturnValue());
        });
        $A.enqueueAction(action1);
    }
})