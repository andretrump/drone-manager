sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/at/dronemanager/maintainflighttypes/test/integration/FirstJourney',
		'com/at/dronemanager/maintainflighttypes/test/integration/pages/FlightTypesList',
		'com/at/dronemanager/maintainflighttypes/test/integration/pages/FlightTypesObjectPage'
    ],
    function(JourneyRunner, opaJourney, FlightTypesList, FlightTypesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/at/dronemanager/maintainflighttypes') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheFlightTypesList: FlightTypesList,
					onTheFlightTypesObjectPage: FlightTypesObjectPage
                }
            },
            opaJourney.run
        );
    }
);