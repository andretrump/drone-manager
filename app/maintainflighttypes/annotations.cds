using SettingsService as service from '../../srv/settings-service';

annotate service.FlightTypesHeader with @(
    UI.HeaderInfo: {
        TypeName      : 'Flight Type',
        TypeNamePlural: 'Flight Types',
        Title         : {
            $Type: 'UI.DataField',
            Value: '{@i18n>appTitle}',
        },
    },
    UI.Facets    : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{@i18n>sectionTitle}',
        ID    : 'AvailableFlightTypes',
        Target: 'flightTypes/@UI.LineItem#AvailableFlightTypes',
    }, ]
);


annotate service.FlightTypes with @(UI.LineItem #AvailableFlightTypes: [
    {
        $Type: 'UI.DataField',
        Value: code,
        Label: '{@i18n>name}',
    },
    {
        $Type: 'UI.DataField',
        Value: name,
        Label: '{@i18n>code}'
    },
]) {
    @UI.Hidden
    ID;

    @UI.Hidden
    header_ID;
};
