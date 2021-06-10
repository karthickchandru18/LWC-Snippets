({
    doInit: function(component) {
        var action = component.get('c.GetAccount');
        action.setCallback(this, function(actionResult) {
            component.set('v.lstAccount', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})