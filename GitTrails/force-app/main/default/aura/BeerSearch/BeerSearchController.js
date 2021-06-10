({
    doSerach : function(component, event, helper) {
        var componentEvent = component.getEvent('BeerEvent');
        var searchParam = component.find('searchInput').get('v.value');
        console.log('searchParam==='+searchParam);
        componentEvent.setParams({
            searchText : searchParam
        });
        componentEvent.fire();
    }    
})