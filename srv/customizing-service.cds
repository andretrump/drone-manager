using {
    com.at.dronemanager.logging as logging,
    com.at.dronemanager.equipment as equi
} from '../db/schema';

service CustomizingService {
    @odata.draft.enabled
    entity FlightTypes as projection on logging.FlightTypes;

    @odata.draft.enabled
    entity WeatherConditions as projection on logging.WeatherConditions;

    @odata.draft.enabled
    entity EquimentStatus as projection on equi.EquimentStatus;
}