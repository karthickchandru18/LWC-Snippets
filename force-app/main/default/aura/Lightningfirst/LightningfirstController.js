({
	Addition : function(component, event, helper) {
		var aval=component.get("v.aval");
        var bval=component.get("v.bval");
        var Result=parseInt(aval)+parseInt(bval);
        component.set("v.Result",Result)
	},
    Multiplication : function(component, event, helper) {
		var aval=component.get("v.aval");
        var bval=component.get("v.bval");
        var Result=parseInt(aval)*parseInt(bval);
        component.set("v.Result",Result)
	}
})