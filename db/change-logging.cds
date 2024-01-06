using { com.at.dronemanager.logging as logging } from './schema';

annotate logging.Flights with @changelog: [
    date,
    task,
    costBearer,
    place,
    personResponsible,
    pilot,
    operator,
    flightObserver,
    type,
    nightFlight,
    airTraficControlInformed,
    timeFrom,
    timeTo,
    flightDuration,
];
