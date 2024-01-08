using {
    com.at.dronemanager.logging as logging,
    com.at.dronemanager.equipment as equi
} from '../db/schema';

service SettingsService {
    @odata.draft.enabled
    entity FlightTypesHeader       as projection on logging.FlightTypesHeader;

    entity FlightTypes             as projection on logging.FlightTypes;

    @odata.draft.enabled
    entity WeatherConditionsHeader as projection on logging.WeatherConditionsHeader;

    entity WeatherConditions       as projection on logging.WeatherConditions;

    @odata.draft.enabled
    entity EquipmentStatusHeader   as projection on equi.EquipmentStatusHeader;

    entity EquipmentStatus         as projection on equi.EquipmentStatus;
}
