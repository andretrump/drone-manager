sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.at.dronemanager.maintainflighttypes',
            componentId: 'FlightTypesObjectPage',
            contextPath: '/FlightTypes'
        },
        CustomPageDefinitions
    );
});